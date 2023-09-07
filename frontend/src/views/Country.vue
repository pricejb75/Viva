<template>
  <div>

      <h1 id="country_name">{{ country.name }}</h1>

      <product-cards :products="products"/>
  
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
  padding-top: 10px;
  padding-bottom: 10px;
  font-style: italic;
  font-size: 2.4rem;
  
}

</style>