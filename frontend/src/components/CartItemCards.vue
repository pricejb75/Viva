<template>

    <div id="cart-item-cards">


        <div v-for="cartItem in cartItems" :key="cartItem.cartItemId" class="cartItem-card">

            <router-link :to="{ name : 'product', params: {id : cartItem.productId}}">

                <div class="cart-item-name" v-bind:data-id="cartItem.cartItemId">
                    {{ cartItem.product.name }}
                </div>

                <div class="price"> {{ cartItem.product.price }} </div>

                <div class="product-image-div">
                    <img height="100" width="100" class="product-image" v-bind:src="getPicturePath(cartItem.product.id)"/>  
                </div>


            </router-link>

            <div class="quantity">{{ cartItem.quantity }}</div>


            <div class="add-another-to-cart" v-if="isAuthenticated()">
                <button @click="cartItem.quantity++" title="add-to-cart"> Add Another To Cart 🛒 </button>
            </div>
            
            <div class="remove-one-from-cart" v-if="isAuthenticated()">
                <button @click="removeFromCart(cartItem.cartItemId)" title="remove-from-cart"> Remove One From Cart 🛒 </button>
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
    name: "CartItemCards",
    components: {
      
    },
    methods: {
        isAuthenticated() {
            return this.$store.state.user.username !== "";
        },
        removeFromCart() {
            if(this.cartItem.quantity > 1) {
                this.cartItem.quantity -= this.cartItem.quantity;
            }
            CartService.removeCartItem(this.cartItem.cartItemId).then(response => {
                console.log("Item was removed from cart", response);
            })
        },
        getPicturePath(productId) {
            return this.pictures.filter(p => p.productId === productId)[0].filepath;
        }
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
    
    </style>