import axios from 'axios';

export default {
    addCartItem(product) {
        const item = {
            quantity: 1,
            productId: product.productId
        };
        return axios.post('/cart/items', item);
    },

    getCartItems() {
        return axios.get('/cart');
    }
}