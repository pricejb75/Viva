<template>

  <section id="container">



    <h1 class="product-name action"> {{ product.name }}</h1>


    <div class="product-image-div">
        <img height="100" width="100" class="product-image" :src="'http://localhost:8081/images' + picture.filepath"/>  
    </div>

    <h3 class="description">{{ product.description }}</h3>

    <div class="bottom-section">

        <h2 class="price">$ {{ product.price }}</h2>


    </div>

    <p id="login-message" v-if="!isLoggedIn">
      Welcome! You may browse anonymously as much as you wish,<br />
      but you must
      <router-link v-bind:to="{ name: 'login' }" id="login">Login</router-link> to add
      items to your shopping cart.
    </p>


    <div class="add-to-cart" v-if="isAuthenticated()">
            <button @click="addToCart(product.id)"
             title="add-to-cart">Add To Cart</button>
        </div>
    
  </section>

</template>

<script>
import CartService from "../services/CartService";
import ProductService from "../services/ProductService.js";
import PictureService from "../services/PictureService";
export default {
    data() {
        return {
            product: {},
            picture: {},
          

        }
    },

          computed: {
        isLoggedIn() {
          return this.$store.state.user.username != "";
        },
      },


    methods: {
         getProduct() {
            ProductService.getProductByProductId(this.$route.params.id).then(response => {
                this.product = response.data;
            })
        },

        isAuthenticated() {
            return this.$store.state.user.username !== "";
        },


        addToCart(productId) {
            CartService.addCartItem(productId, 1, this.$store.state.user.id).then(response => {
                window.alert("Item was added to cart!");
                console.log("Item Was Added To Cart!", response);
            });
        },

        getPicture(){
            PictureService.getPictureById(this.$route.params.id).then(response => {
                this.picture = response.data;
            })
        }

      


    },
    created() {
        this.getPicture(),
        this.getProduct()
    }
};
</script>

<style scoped>


.product-name {

    font-family: sans-serif;
    font-size:35px;
    padding-top: 5px;
    padding-bottom: 5px;
    color: black;
}

.description {
    font-family: sans-serif;
    font-size:20px;
    padding-top: 5px;
    padding-bottom: 5px;
    color: black;
}

.product-image-div {

    justify-content: center;
    padding: 10px;
    border-radius:5%;

  
}

img {
    width:40%;
    height: auto;
}

.price {

    font-family: sans-serif;
    font-size:25px;
    color: black;
    justify-content: center;
}

.add-to-cart {
    display: flex;
    padding-top: 5px;
    border-radius: 5px;
    justify-content: center;
    font-size: 20px;
}


li a {
    text-decoration: none;
    color: black;
    font-family: 'sans-serif';
}

a {
    text-decoration: none;
    color: black;
    font-family: 'sans-serif';
}

router-link {
    text-decoration: none;
    color: black;
    font-family: 'sans-serif';
}



button {
        font-family: sans-serif;
        font-weight: bold;
        background-color: rgb(241, 184, 62);
        text-transform: uppercase;
        border-color: rgb(241, 184, 62);
        color:white;
        border-radius: 5px;
        cursor:pointer;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
        padding: 10px;
        font-size: 20px;
    }

    button:hover {
        color: rgb(138, 32, 32);
    }

    #login-message {

        color:black;
        padding-bottom: 3vh;

        font-size: 1.2rem;
        margin-bottom: 3em;
        margin-top: 3em;

    }

        #login {
        color : rgb(138, 32, 32);
        font-size: 1.4rem;
        font-style: italic;

    }






</style>