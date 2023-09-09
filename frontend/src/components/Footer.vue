<template>
    <div class="footer_container"> 

        <div class="socialIcons">
            <a href=""><i class="fa-brands fa-facebook"></i></a>
            <a href=""><i class="fa-brands fa-instagram"></i></a>
            <a href=""><i class="fa-brands fa-twitter"></i></a>
            <a href=""><i class="fa-brands fa-youtube"></i></a>
        </div>

        <div class="footer_nav">
            <ul>
            <li><router-link v-bind:to="{ name : 'home'}">Home</router-link></li>
            <li><router-link :to="{ name : 'products'}">Products</router-link></li>
            <li><router-link :to="{ name : 'cart'}">Cart</router-link></li>
            </ul>
        </div>

        <div class="footer_bottom">
            <p>CopyRight &copy;2023 designed by <span class="name">Jeremy Price</span></p>
        </div>

    </div>
</template>


<script>

</script>


<style scoped>
*{
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}

footer{
    background-color: #111;
}

.footer_container {

    width:100%;
    padding: 70px 30px 20px;
}

.socialIcons {
    display: flex;
    justify-content: center;

}

.socialIcons a {
    text-decoration: none;
    padding: 10px;
    background-color: white ;
    margin: 10px;
    border-radius: 50%;
}

.socialIcons a i{
    font-size: 2em;
    color : rgb(138, 32, 32);
    opacity:0.9;
}

.socialIcons a i:hover {
    color:rgb(215, 150, 9);
}

.footer_nav {
    margin:30px 0;
}

.footer_nav ul {
    display: flex;
    justify-content: center;
    
}

.footer_nav ul li {
    list-style: none;
}

.footer_nav ul li a {
    color : black;
    margin: 20px;
    text-decoration: none;
    font-size: 1.3em;
    opacity: 0.7;
    transition: 0.5s;
    font-family: sans-serif;
}

.footer_nav ul li a:hover {
    color : rgb(138, 32, 32);
}













</style>