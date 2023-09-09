<template>
  <div>

    <section id="top-section">

      <span></span>

        <input type="text" 
        placeholder=" 🔎 search..."  
        @keyup="getProductsByName" 
        v-model="productName"
        id="search" > 

    </section>

    <p id="login-message" v-if="!isLoggedIn">
      Welcome! You may browse anonymously as much as you wish,<br />
      but you must
      <router-link v-bind:to="{ name: 'login' }" id="login">Login</router-link> to add
      items to your shopping cart.
    </p>

      <h1 id="country_name">{{ country.name }}</h1>



      <product-cards :products="products" id="product-card"/>
  
    </div>
</template>

<script>
  import ProductService from "../services/ProductService.js";
  import ProductCards from "../components/ProductCards.vue";
import CountryService from "../services/CountryService";
export default {
    name: "ProductsByCountry",
        components: {
            ProductCards
        },
    data() {
        return {
            products: [],
            productName: '',
            filteredProducts: [],
            country:{}
        }
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
        ProductService.getProductsByCountryId(this.$route.params.id).then(response => {
            this.products = response.data;
            this.filteredProducts = this.products;
        }),
       
          CountryService.getCountryById(this.$route.params.id).then(response => {
            this.country = response.data;
          })
        }
    
};
</script>

<style scoped>

#country_name {
  color : rgb(138, 32, 32);
  padding-top: 5px;
  font-style: italic;
  font-size: 2.4rem;
  
}

#product-card {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
}

#top-section {

padding-left: 40px;
display:flex;
align-items: center;
justify-content: space-between;


}

#search {
    
   
    border: solid black;
    font-size: 17px;
    box-shadow:0 0 15px 4px rgba(0,0,0,0.40);
    border-radius:10px;
    font-family: 'Open Sans';
    font-size: 1.0 rem;
    height: 40px;
    grid-area:search;
    margin-right:3vw;
    margin-bottom: 1vw;
    
}

#login-message {

    color:black;
    padding-bottom: 3vh;
   
    font-size: 1.2rem;
    margin-bottom: 3em;

}

#login {
  color : rgb(138, 32, 32);
  font-size: 1.4rem;
  font-style: italic;
  
}

#login:hover {
  color:rgb(215, 150, 9);
}

</style>