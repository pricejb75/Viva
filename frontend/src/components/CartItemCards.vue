<template>

    <div id="cart-item-cards">


        <div v-for="cartItem in cartItems" :key="cartItem.cartItemId" class="cartItem-card">

            <router-link :to="{ name : 'product', params: {id : cartItem.productId}}">

                <div class="cart-item-name" v-bind:data-id="cartItem.cartItemId">
                    {{ cartItem.product.name }}
                </div>

                <div class="price">$ {{ cartItem.product.price }} </div>

                <div class="product-image-div">
                    <img class="product-image" v-bind:src="getPicturePath(cartItem.product.id)"/>  
                </div>


            </router-link>

            <div class="quantity"> Quantity : {{ cartItem.quantity }}</div>


            <!-- <div class="add-another-to-cart" v-if="isAuthenticated()">
                <button @click="addToCart(cartItem.product.id)" title="add-to-cart"> Add Another To Cart 🛒 </button>
            </div>
            
            <div class="remove-one-from-cart" v-if="isAuthenticated()">
                <button @click="removeFromCart(cartItem.cartItemId, --cartItem.quantity)" title="remove-from-cart"> Remove One From Cart 🛒 </button>
            </div> -->
            

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
    name: "CartItemCards",
    components: {
      
    },
    methods: {
        isAuthenticated() {
            return this.$store.state.user.username !== "";
        },
        removeFromCart(cartItemId, quantity) {
            debugger;
            CartService.removeCartItem(cartItemId, quantity, this.$store.state.user.id).then(response => {
                console.log("Item was removed from cart", response);
            })
        },
        getPicturePath(productId) {
            return this.pictures.filter(p => p.productId === productId)[0].filepath;
        },
        addToCart(productId) {
            CartService.addCartItem(productId, 1, this.$store.state.user.id).then(response => {
                console.log("Item Was Added To Cart!", response);
            });
    },
},
    props: {
        cartItems: []
    },
    created() {
        PictureService.getAllPictures().then(response => {
            this.pictures = response.data;

            
        })



    }

}
    </script>
    
    <style scoped>

    .cartItem-card {
        border:solid rgb(197, 188, 188);
        border-radius:10px;
        margin:10px;
        align-items: center;
        flex-shrink: inherit;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
        
    }
    
    img {
        width:auto;
        height: 25vw;
        border-radius: 5%;
    }

    .cart-item-name {
        justify-content: center;
        font-family: sans-serif;
        font-size: 2em;
        color:black;
        margin-top: 10px;
    }

    .price {
        font-size: 1.5em;
        font-family: sans-serif;
        color:black;
    }
    
    a {
        text-emphasis: none;
        text-decoration: none;
    }

    .quantity {
        font-size: 1.5em;
        font-family: sans-serif;
        color:black;
        margin-bottom: 10px;
    }
    </style>