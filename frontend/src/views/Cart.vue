<template>
    <div>
         <p id="login-message" v-if="!isLoggedIn">
          Welcome! You may browse anonymously as much as you wish,<br />
          but you must
          <router-link v-bind:to="{ name: 'login' }">Login</router-link> to add
          items to your shopping cart.
        </p> 
    
        <input type="text" @keyup="getCartItemsByName" v-model="cartItemName" > 
    
        <cartItemCards :cartItems="cartItems"/>
    
    </div>
    
    </template>
    
    <script>
    import CartService from "../services/CartService";
    import CartItemCards from "../components/CartItemCards.vue";

    export default {
      name: "ProductsView",
      components: {
        CartItemCards
      },
      data() {
        return {
          cartItems: [],
          cartItemName : ''
        };
    
      },
    
      computed: {
        isLoggedIn() {
          return this.$store.state.user.username != "";
        },
      },
    
      methods: {
    
        // getCartItemsByName(name){
        //       name = this.cartItem.productName.toLowerCase();
        //       let filteredProducts = this.products.filter(p => {
        //         return p.name.toLowerCase.includes(name);
        //       })
        //       this.products = filteredProducts;
        //   }
      },
    
      created() {
        CartService.getCartItems().then(response => {
          this.cartItems = response.data;
        })
      },
    };
    </script>
    
    <style>
    
    </style>