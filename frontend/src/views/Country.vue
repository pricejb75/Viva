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
    name: "ProductsByCountry",
        components: {
            ProductCards
        },
    data() {
        return {
            products: [],
            productName: ''
        }
    },
    computed: {
      // isLoggedIn() {
      //   return this.$store.state.token.length > 0;
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
        ProductService.getProductsByCountryId(this.$route.params.id).then(response => {
            this.products = response.data;
        })
    }
};
</script>

<style scoped>

.product-card {
    display: grid;
    grid-template-columns: 1fr 1fr;
    grid-template-areas:
    "image image image"
    "image image image"
    "image image image"
    "name name name"
    "price price ."
    "button button button";
    border:solid black;
    border-radius:10px;
    margin:10px;
    width:25vw;
    padding: 10px;
    align-items: center;
    flex-shrink: inherit;
}

.product-name {
    grid-area: name;
    font-family: 'Open Sans';
    font-size: 1.0 rem;
    font-style: italic;
    font-size:15px;
    padding-top: 5px;
    padding-bottom: 5px;
}

.product-image-div {
    grid-area: image;
    display: flex;
    justify-content: center;
    padding: 10px;
    border-radius:10px;
    flex-shrink: inherit;
  
}

.price {
    grid-area: price;
    display: flex;
    justify-content: flex-end;
    font-family: 'Open Sans';
    font-size: 1.0 rem;
    font-size:15px;
}

.add-to-cart {
    grid-area:cart;
    display: flex;
    padding-top: 5px;
}




</style>