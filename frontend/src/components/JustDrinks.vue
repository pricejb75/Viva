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


    <section class="container">
    <product-cards :products="filteredProducts" id="product-card"/>
    </section>

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
  
  <style scoped>

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
    font-family: sans-serif;
    font-size: 1.0 rem;
    height: 40px;
    margin-right:3vw;
    margin-bottom: 1vw;
    
}

#login-message {

    color:black;
    padding-bottom: 3vh;
    padding-top: 1vh;
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

#product-card {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
}
  
  </style>