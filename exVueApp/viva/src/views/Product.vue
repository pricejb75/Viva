<template>

  <section id="container">

    <h1 class="product-name action"> {{ product.name }}</h1>
    <h2 class="price"> {{ product.price }}</h2>
    <div class="product-image-div">
        <img height="100" width="100" class="product-image"
         v-bind:src="picture.filepath"/>  
    </div>
    <h3 class="description">{{ product.description }}</h3>
    <div class="add-to-cart">
        <button title="add-to-cart">Add To Cart 🛒</button>
    </div>

  </section>

</template>

<script>
export default {
    data() {
        return {
            product: {},
            picture: {}
        }
    },
    methods: {
        async getProduct() {
            const res = await fetch(
                "/api/products/" +  this.$route.params.id
                );
            this.product = await res.json();
        },

        async getPicture() {
            const res = await fetch(
                "/api/pictures/" + this.$route.params.id
                );
            this.picture = await res.json();
        }


    },
    mounted() {
        this.getProduct(),
        this.getPicture()
    }
};
</script>

<style>

#container {

    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
    grid-template-areas:
    "name name name"
    "image image description"
    "image image description"
    "image image description"
    "price . button";

}

.product-name {
    grid-area: name;
    font-family: 'Open Sans';
    font-size: 1.0 rem;
    font-style: italic;
    font-size:15px;
    padding-top: 5px;
    padding-bottom: 5px;
    color: black;
    font-family: 'sans-serif';
}

.description {
    grid-area: description;
    font-family: 'Open Sans';
    font-size: 1.0 rem;
    font-size:15px;
    padding-top: 5px;
    padding-bottom: 5px;
    color: black;
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
    color: black;
    font-family: 'sans-serif';
}

.add-to-cart {
    grid-area:cart;
    display: flex;
    padding-top: 5px;
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









</style>