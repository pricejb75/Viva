<template>
    <div>

      <input type="text" @keyup="getCartItemsByName" v-model="cartItemName"> 

      <h1> Your total is : {{ total }}</h1>

      <button @click="checkout()" title="checkout">Checkout</button>
    
        <cartItemCards :cartItems="filteredCartItems"/>

        <h1> Your total is : {{ total }}</h1>

      <button @click="checkout()" title="checkout">Checkout</button>
    
    </div>
    
    </template>
    
    <script>
    import CartService from "../services/CartService";
    import CartItemCards from "../components/CartItemCards.vue";
    import TaxService from '../services/TaxService.js';

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
          taxRate: 0,
          total: this.calculateTotal
        };
    
      },
    
      computed: {
        isLoggedIn() {
          return this.$store.state.user.username != "";
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

          calculateTotal() {
            this.cartItems.forEach((c) => {
              this.total = this.total + c.product.price;
            })
          },

          checkout() {
            this.$router.push({name: 'checkout'})
          }


      },
    
      created() {
        CartService.getCartItems().then(response => {
          this.cartItems = response.data;
          this.filteredCartItems = this.cartItems;
        }),

        TaxService.getTaxRateByStateCode(this.user.stateCode).then(response => {
          this.taxRate = response.salesTax;
        })

        

        
      },
    };
    </script>
    
    <style>
    
    </style>