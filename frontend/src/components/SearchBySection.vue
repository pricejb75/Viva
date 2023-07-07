<template>
    <section id="parent-container">
        <section id="parent-grid">

            <div class="card" id="first-card">
                <router-link v-bind:to="{ name : 'food'}" class="food-link text">Search By Food</router-link>
                <router-link v-bind:to="{ name : 'food'}"> 
                    <img src="../assets/SearchBySectionImages/food.jpg" alt="food" class="image food">
                </router-link>
            </div>

            <div class="card" id="second-card">
                <router-link v-bind:to="{ name : 'drinks'}" class="drinks-link text">Search By Drinks</router-link>
                <router-link v-bind:to="{ name : 'drinks'}"> 
                    <img src="../assets/SearchBySectionImages/mojitos.jpg" alt="drinks" class="image drinks">
                </router-link>
            </div>

            
            <div class="card" id="third-card">
                <router-link v-bind:to="{ name : 'countries'}" class="countries-link text">Search By Country</router-link>
                <router-link v-bind:to="{ name : 'countries'}">   
                    <img src="../assets/SearchBySectionImages/countries.jpg" alt="landscape" class="image countries">
                </router-link>
            </div>

        </section>
    </section>
</template>


<script>
export default {
 name: "search-by-section",
};

</script>


<style scoped>
    li,h1,h2,h3,p {
        font-family: 'Open Sans', sans-serif; 
        color: white;
    }

    body {
    padding:10px;
}


#parent-grid {


    justify-content: space-between;
    display: flex;
}

.card {
    display: grid;
    grid-template-columns: 1fr;
    grid-template-areas: 
    "image"
    "text";

    margin:10px;
    width:25vw;
    padding: 10px;
    flex-shrink: inherit;
    justify-content: center;
    align-items: center;
  
}

.image {
    height: auto;
    width: 20vw;
    display: flex;
    justify-content: center;
    align-items: center;
    grid-area:image;
    margin: auto;
   
}

.countries {
    height: auto;
    width:15vw;
    border-radius:99rem;
    margin-bottom: 20px;
}

.food {
    height: auto;
    width:15vw;
    border-radius:99rem;
    margin-bottom: 20px;
}

.drinks {
    height: auto;
    width:15vw;
    border-radius:99rem;
    margin-bottom: 50px;
}

.text {

    border-radius:10px;
    text-align: center;
    grid-area:text;
    font-family: 'Open Sans';
    color:black;
    padding: 15px 25px;
    text-decoration: none;
    font-size: 1.6rem;
    border-radius: 1%;
    
}

.text:hover {
    color: rgb(171, 34, 80);
}

.image:hover {
    scale:1.05;
}

@media (max-width: 449px) {

    body {
        padding-right:30px;
    }

  .text {
      font-size: .9rem;
  }

  .image {
    height: auto;
    width: 20vw;
    display: flex;
    justify-content: center;
    align-items: center;
    grid-area:image;
    margin: auto;
   
}

}
</style>