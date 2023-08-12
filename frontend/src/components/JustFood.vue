<template>

    <div id="product-cards">
        <router-link :to="{ name : 'product', params: {id : product.id}}" v-for="product in products" v-bind:key="product.id" class="product-card">
            <article id="product-card"  >
                <div class="product-name action" v-bind:data-id="product.productId">
                    {{ product.name }}
                </div>
                <div class="price"> {{ product.price }} </div>
                <div class="product-image-div">
                    <img height="100" width="100" class="product-image" v-bind:src="getPicturePath(product.id)"/>  <!-- v-bind:src="product.image.path"-->
                </div>
                <div class="add-to-cart">
                    <button title="add-to-cart">Add To Cart 🛒</button>
                </div>
            </article>
        </router-link>
    </div>
    
</template>

<script>
export default {
    data() {
        return {
            products: [],
            pictures: []
        }
    },
    methods: {
        async getProducts() {
            const res = await fetch("/api/products?type=1");
            this.products = await res.json();
        },

        async getPictures() {
            const res = await fetch("/api/pictures");
            this.pictures = await res.json();
        },

        getPicturePath(productId) {
            return this.pictures.filter(p => p.productId === productId)[0].filepath;
        }
    },
    mounted() {
        this.getProducts(),
        this.getPictures()
    }
};
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