import axios from 'axios';

export default {
    addCartItem(cartItem) {
        // const item = {
        //     quantity: 1,
        //     productId: product.productId
        // };
        return axios.post('/api/cart/items', cartItem);
    },

    getCartItems() {
        return axios.get('/cart');
    },

    removeCartItem(itemId) {
        return axios.delete('/cart/items/' + itemId);
    }
}