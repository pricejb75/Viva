import axios from 'axios';

export default {
    addCartItem(productId, quantity, userId) {
        const itemRequest = {
            quantity: quantity,
            productId: productId,
            userId: userId
        };
        return axios.post('/api/cart/items', itemRequest);
    },

    getCartItems(username) {
        return axios.get(`/api/cart/${username}`);
    },

    removeCartItem(cartItemId, quantity, userId) {
        if (quantity === 0) {
            this.deleteCartItem(cartItemId, userId)
        }
        const itemRequest = {
            quantity: quantity,
            cartItemId: cartItemId,
            userId: userId,
            productId: 4
        };
        return axios.put('/api/cart/items/', itemRequest);
        
    },
    deleteCartItem(cartItemId) {
        return axios.delete(`/api/cart/items/${cartItemId}`);
    },

    clearUserCart(userId) {
        return axios.delete(`api/cart/${userId}`)
    }
}