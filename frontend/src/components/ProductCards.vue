<template>

    <div id="product-cards">


        <div v-for="product in products" v-bind:key="product.id" class="product-card">

            <router-link :to="{ name : 'product', params: {id : product.id}}">

                <div class="product-name action" v-bind:data-id="product.id">
                    {{ product.name }}
                </div>

                <div class="price"> {{ product.price }} </div>

                <div class="product-image-div">
                    <img height="100" width="100" class="product-image" v-bind:src="getPicturePath(product.id)"/>  
                </div>


            </router-link>


            <div class="add-to-cart" v-if="isAuthenticated()">
                    <button @click="addToCart(this.cartItem)" title="add-to-cart">Add To Cart 🛒</button>
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
            pictures: [],
            cartItem: {
                quantity:1,
                productId: this.product.id,
                userId: this.$store.state.user.id, 
                product: this.product
            }
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
        addToCart() {
            CartService.addCartItem(this.cartItem).then(response => {
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