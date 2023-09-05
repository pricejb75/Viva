<template>
  <div>
      <p id="login-message" v-if="!isLoggedIn">
        Welcome! You may browse anonymously as much as you wish,<br />
        but you must
        <router-link v-bind:to="{ name: 'login' }">Login</router-link> to add
        items to your shopping cart.
      </p>
  
      <input type="text" @keyup="getProductsByName" v-model="productName" > 
  
      <product-cards :products="filteredProducts"/>
  
    </div>
  
  </template>
  
  <script>
  import ProductService from "../services/ProductService.js";
  import ProductCards from "../components/ProductCards.vue";
  export default {
    name: "DrinksView",
    components: {
      ProductCards
    },
    data() {
      return {
        products: [],
        productName : '',
        filteredProducts : []
      };
  
    },
  
    computed: {
      isLoggedIn() {
        return this.$store.state.user.username != "";
      },
    },
  
    methods: {
  
      getProductsByName(name){
            name = this.productName.toLowerCase();
            this.filteredProducts = this.products.filter(p => {
              return p.name.toLowerCase().includes(name);
            })
        }
    },
  
    created() {
      ProductService.getDrinks().then(response => {
        this.products = response.data;
        this.filteredProducts = this.products;
      })
    },
  };
  </script>
  
  <style>
  
  </style>