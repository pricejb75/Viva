<template>
<div>
    <!-- <p id="login-message" v-if="!isLoggedIn">
      Welcome! You may browse anonymously as much as you wish,<br />
      but you must
      <router-link v-bind:to="{ name: 'login' }">Login</router-link> to add
      items to your shopping cart.
    </p> -->

    <input type="text" @keyup="getProductsByName" v-model="productName" > 

    <product-cards :products="products"/>

  </div>

</template>

<script>
import ProductService from "../services/ProductService.js";
import ProductCards from "../components/ProductCards.vue";
export default {
  name: "ProductsView",
  components: {
    ProductCards
  },
  data() {
    return {
      products: [],
      productName : ''
    };

  },

  computed: {
    // isLoggedIn() {
    //   return this.$store.state.user.username != '';
    // },
  },

  methods: {

    getProductsByName(name){
          name = this.productName.toLowerCase();
          let filteredProducts = this.products.filter(p => {
            return p.name.toLowerCase.includes(name);
          })
          this.products = filteredProducts;
      }
  },

  created() {
    ProductService.getAllProducts({}).then(response => {
      this.products = response.data;
    })
  },
};
</script>

<style>

</style>