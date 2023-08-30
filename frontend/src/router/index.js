import Vue from 'vue';
import VueRouter from 'vue-router';
import Home from '../views/Home.vue';
import Products from '../views/Products.vue';
import Drinks from '../views/Drinks.vue';
import Food from '../views/Food.vue';
import Countries from '../views/Countries.vue';
import Country from '../views/Country.vue';
import Product from '../views/Product.vue';
import Cart from '../views/Cart.vue';
import Login from '../views/Login.vue';
import Register from '../views/Register.vue'

// Here we're specifying that VUE should use VUE router

Vue.use(VueRouter);

/* 
Alright, so VUE router has an array called routes that is filled with route objects.
A route object should have a path, a componenent, and a name. 

The path is what the URL is when that particulared View is being rendered on the DOM. 

The Component is referring to the actual name of the view file which is imported at the top of the file here.
 
the name is given to the View so you don't have to hard-code the URL everytime 
you drop a router link tag somewhere, or if you want to change the URL, you can just do it
here, and not on every router link tag across your entire application
*/

const routes = [
    {path: '/', component: Home, name: 'home'},
    {path: '/products', component: Products, name: 'products'},
    {path:'/drinks', component: Drinks, name: 'drinks'},
    {path: '/food', component: Food, name: 'food'},
    {path: '/countries', component: Countries, name: 'countries'},
    {path: '/country/:id', component: Country, name: 'country'},
    {path: '/product/:id', component: Product, name: 'product'},
    {path: '/cart', component: Cart, name: 'cart'},
    {path: '/login', component: Login, name: 'login'},
    {path: '/register', component: Register, name: 'register'}
  ];
  


const router = new VueRouter({
    mode: 'history',
    routes
  });
  
  export default router;