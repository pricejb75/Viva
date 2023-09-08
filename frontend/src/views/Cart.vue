<template>
    <div>

      <input type="text" @keyup="getCartItemsByName" v-model="cartItemName"> 

      <h1> Your total is : {{ total }}</h1>

      <button @click="checkout()" title="checkout">Checkout</button>
    
        <cartItemCards :cartItems="filteredCartItems"/>

        <h1> Your total is : {{ total }}</h1>

      <button @click="checkout()" title="checkout">Checkout</button>

      <button @click="clearCart()" title="clearCart">Clear Cart</button>
    
    </div>
    
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
            this.$router.push({name: 'checkout'})
          },

          refreshPage() {
            this.$router.push({name: 'cart'})
          },

          clearCart() {
            CartService.clearUserCart(this.$store.state.user.id).then(response => {
              if(response.status == 204) {
                this.carItems = {}
              } else {
                console.log("unalbe to clear cart")
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
    
    <style>
    
    </style>