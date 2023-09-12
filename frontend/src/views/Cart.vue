<template>
  <section class="container">
  
    <div id="logged-in" v-if="isLoggedIn">

        <div class="top-section">
          <h1> Your total is : $ {{ total }}</h1>
          <button @click="checkout()" title="checkout" id="checkout">Checkout</button>
        </div>

        <cartItemCards :cartItems="filteredCartItems"/>

        <div class="bottom-section">
          <button @click="clearCart()" title="clearCart" id="clear-cart">Clear Cart</button>
          <button @click="checkout()" title="checkout" id="checkout">Checkout</button>
        </div>

    </div>

    <div class="not-logged-in" v-if="!isLoggedIn">

      <p id="message">
        Welcome! You may browse anonymously as much as you wish,<br />
        but you must
        <router-link v-bind:to="{ name: 'login' }" id="login">Login</router-link> to add
        items to your shopping cart.
      </p>

    </div>

  </section>
      
    </template>
    
    <script>
    import CartService from "../services/CartService.js";
    import CartItemCards from "../components/CartItemCards.vue";
    //import TaxService from '../services/TaxService.js';

    export default {
      name: "ProductsView",
      components: {
        CartItemCards
      },
      data() {
        return {
          cartItems: [],
          cartItemName : '',
          filteredCartItems: [],
          stateCode: this.$store.state.user.stateCode,
          taxRate: 0
        };
    
      },
    
      computed: {
        isLoggedIn() {
          return this.$store.state.user.username != "";
        },
        total() {
          return this.cartItems.reduce((acc, val) => {
              return acc + val.product.price;
            }, 0).toFixed(2);
        }
  
      },
    
      methods: {
    
        getCartItemsByName(name){
              name = this.cartItem.product.name.toLowerCase();
              let filteredCartItems = this.cartItems.filter(c => {
                return c.name.toLowerCase.includes(name);
              })
              this.cartItems = filteredCartItems;
          },

          checkout() {
            this.$router.push({name: 'confirmation'})
          },

          refreshPage() {
            this.$router.push({name: 'cart'})
          },

          clearCart() {
            CartService.clearUserCart(this.$store.state.user.id).then(response => {
              if(response.status == 204) {
                this.carItems = {}
              } else {
                console.log("unable to clear cart")
              }
            })
          this.$router.go();
          }


      },
    
      created() {
        CartService.getCartItems(this.$store.state.user.username).then(response => {
          this.cartItems = response.data.items;
          this.filteredCartItems = this.cartItems;
        })

        // TaxService.getTaxRateByStateCode(this.$store.state.user.stateCode).then(response => {
        //   this.taxRate = response.salesTax;
        // })

        

        
      },
    };
    </script>
    
    <style scoped>

    .top-section {
      display: flex;
      justify-content: space-between;
      margin: 2em;
      padding-right: 15px;
    }

    .bottom-section {
      display: flex;
      justify-content: space-between;
      margin: 2em;
      padding-right: 15px;
    }

    #checkout {
        font-family: sans-serif;
        font-weight: bold;
        background-color: rgb(241, 184, 62);
        text-transform: uppercase;
        border-color: rgb(241, 184, 62);
        color:white;
        border-radius: 5px;
        cursor:pointer;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
        padding: 10px;
        font-size: 20px;
        margin-top: 20px;
        margin-bottom: 20px;
    }

    #checkout:hover {
      color: rgb(138, 32, 32);
    }

    #clear-cart {
        font-family: sans-serif;
        font-weight: bold;
        background-color: rgb(138, 32, 32);
        text-transform: uppercase;
        border-color: rgb(138, 32, 32);
        color:white;
        border-radius: 5px;
        cursor:pointer;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
        padding: 10px;
        font-size: 20px;
        margin-top: 20px;
        margin-bottom: 20px;
    }

    #clear-cart:hover {
      color:rgb(241, 184, 62);
    }

    #message {
      font-size: 2em;
      margin-top: 2em;
    }
    
    </style>