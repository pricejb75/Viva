<template>


    <ul id="country-names">
        <router-link :to="{ name : 'country', params: {id : country.id}}" v-for="country in countries" v-bind:key="country.id">
        <li id="country-name" >{{ country.name }}</li>
        </router-link>
    </ul>




    
</template>

<script>
export default {
    data() {
        return {
            countries: []
        }
    },
    methods: {
        async getCountries() {
            const res = await fetch("/api/countries");
            this.countries = await res.json();
        },

    },
    mounted() {
        this.getCountries()
    }
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
     font-family: 'sans-serif';
     cursor: pointer;
     box-sizing: border-box;
     transition: 0.5s;
     color: black;
     text-decoration: none;
     
}

#country-name:hover{
    color:white;
    background-color: rgb(171, 34, 80);
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






</style>