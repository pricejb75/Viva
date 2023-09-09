<template>

    <div id="product-cards">


        <div v-for="product in products" v-bind:key="product.id" class="product-card">

            <router-link :to="{ name : 'product', params: {id : product.id}}">

                <div class="product-name" v-bind:data-id="product.id">
                  <p>  {{ product.name }} </p>
                </div>

                <div class="product-image-div">
                    <img  class="product-image" v-bind:src="getPicturePath(product.id)"/>  
                </div>





            </router-link>

            <div class="bottom-of-card">

                <div class="price">
                        <p>$ {{ product.price }} </p>
                </div>

                <div class="add-to-cart" v-if="isAuthenticated()">
                        <button @click="addToCart(product.id)" title="add-to-cart">Add To Cart</button>
                </div>   

            </div>


        </div>


    </div>

</template>
    
    <script>
    import CartService from '../services/CartService.js';
    import PictureService from '../services/PictureService.js';
    
    export default {
        data() {
        return {
            pictures: []
        }
    },
    name: "ProductCards",
    components: {
    //     PictureService,
    // CartService
    },
    methods: {
        isAuthenticated() {
            return this.$store.state.user.username !== "";
        },
        addToCart(productId) {
            CartService.addCartItem(productId, 1, this.$store.state.user.id).then(response => {
                console.log("Item Was Added To Cart!", response);
            });
        },
        getPicturePath(productId) {
            return this.pictures.filter(p => p.productId === productId)[0].filepath;
        }
    },
    props: {
        products: []
    },
    created() {
        PictureService.getAllPictures().then(response => {
            this.pictures = response.data;
        })
    }

}
    </script>
    
    <style scoped>

    .product-card {
        border:solid rgb(197, 188, 188);
        border-radius:10px;
        margin:10px;
        width:26vw;
        padding: 10px;
        align-items: center;
        flex-shrink: inherit;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    .product-image {
    height: 15vw;
    width: auto;
    display: flex;
    justify-content: center;
    align-items: center;
    margin: auto;
    border-radius: 5%;
    }

    .product-image-div {
        justify-content: center;
        align-items: center;
        margin: auto;
    }

    .product-name {
        justify-content: center;
        font-family: sans-serif;
        font-size: 20px;
        color:black;
    }

    a {
        text-decoration: none;
    }

    .price {
   
        font-family: sans-serif;
        font-size: 1.2em;
        
    }

    .bottom-of-card {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 5px;
        margin-bottom:none;
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
        padding:10px;
       
    }

    button:hover {
        background-color: rgb(138, 32, 32);
        color: rgb(241, 184, 62);
        border-color: rgb(138, 32, 32);
    }
    

    
    
    
    </style>