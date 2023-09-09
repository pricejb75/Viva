<template>

    <div>


        <section id="top-section">

            <span></span>

            <input type="text" 
            placeholder=" 🔎 search..."  
            @keyup="getCountriesByName" 
            v-model="countryName"
            id="search" > 

        </section>


        <ul id="country-names">

            <router-link :to="{ name : 'country', params: {id : country.id}}" 
            v-for="country in filteredCountries" v-bind:key="country.id"
            id="countries">

            <li id="country-name" >{{ country.name }}</li>

            </router-link>
        </ul>

    </div>




    
</template>

<script>
import CountryService from '../services/CountryService';

export default {
    data() {
        return {
            countries: [],
            countryName: '',
            filteredCountries: []
        };
    },
    methods : {
    getCountriesByName(name){
              name = this.countryName.toLowerCase();
               this.filteredCountries = this.countries.filter(c => {
                return c.name.toLowerCase().includes(name);
              })
      }
    },
    
      created() {
        CountryService.getCountries().then(response => {
          this.countries = response.data;
          this.filteredCountries = this.countries;
        })
      },
};
</script>

<style scoped>

body {
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    
}

#country-names {
    margin: 0;
    padding: 0;
    display: flex;
    flex-wrap: wrap;
   
}

li a {
    text-decoration: none;
}

a {
    text-decoration: none;
}

router-link {
    text-decoration: none;
}

#country-name {

    position: relative;
    list-style: none;
    font-size: 3em;
    padding: 20px;
     font-family: sans-serif;
     cursor: pointer;
     box-sizing: border-box;
     transition: 0.5s;
     color : rgb(138, 32, 32);
     text-decoration: none;
     
}

#country-name:hover{
    color:rgb(215, 150, 9);
   
}

#country-name::before {
    top:0;
    left:0;
    width:100%;
    height:100%;
    background:rgb(171, 34, 80);
    z-index: -1;
    transform: scaleY(0);
    transition: transform 0.5s;
    transform-origin: bottom;
}

#country-name:hover::before {
    transform: scaleY(0);
    transition: transform 0.5s;
    transform-origin: top;
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
    padding-top: 3vh;
    font-size: 1.2rem;

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