<template>
  <header class="header">
    <div class="logo">
      <router-link v-bind:to="{ name : 'home'}">
        <img src="../assets/NavBarImages/VivaLogo.png" alt="Viva Logo" id="vivaImage" />
      </router-link>
    </div>
    <div class="navigation">
      <input type="checkbox" class="toggle-menu" />
      <div class="hamburger"></div>
      <ul class="menu">
        <li><router-link v-bind:to="{ name : 'home'}">Home</router-link></li>
        <li><router-link :to="{ name : 'products'}">Products</router-link></li>
        <li><router-link :to="{ name : 'cart'}">Cart</router-link></li>
        <li><router-link :to="{ name : 'login'}">Log In</router-link></li>
      </ul>
    </div>
  </header>
</template>

<script>
export default {
  name: "NavBar",
};
</script>

<style scoped>
body {
  background-color: white;
  padding: 15px;
}

.header {
  background-color: white;
  position: relative;
  width: 99.9;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0 25px;
  transition: 0.3s;
}

.logo a img {
  display: block;
  width: 100%;
}

#vivaImage {
  height: auto;
  width: 15vw;
}

#vivaImage:hover {
  transform: scale(1.05);
}

.navigation {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.menu {
  display: flex;
  justify-content: center;
  flex-direction: row;
  align-items: center;
  z-index: 1;
  transition: 0.5s;
}

.logo > a {
  text-decoration: none;
}

.menu li {
  list-style-type: none;
}

.menu li a {
  color: black;
  text-decoration: none;
  display: block;
  padding: 40px 25px;
  font-size: 20px;
  list-style: 1;
  transition: 0.3s;
}

.menu li a:hover {
  box-shadow: 0 -5px 0px grey inset, 500px 00 rgba(255, 255, 255, 0.3) inset;
  padding: 35px 25px 45px 25px;
}

.hamburger {
  position: relative;
  width: 30px;
  height: 4px;
  background: black;
  border-radius: 10px;
  cursor: pointer;
  z-index: 2;
  transition: 0.3s;
}
.hamburger:before,
.hamburger:after {
  content: "";
  position: absolute;
  height: 4px;
  right: 0;
  background: black;
  border-radius: 10px;
  transition: 0.3s;
}

.hamburger:before {
  top: -10px;
  width: 20px;
}
.hamburger:after {
  top: 10px;
  width: 25px;
}

.toggle-menu {
  position: absolute;
  width: 30px;
  height: 100%;
  z-index: 3;
  cursor: pointer;
  opacity: 0;
}

.hamburger,
.toggle-menu {
  display: none;
}

.navigation input:checked ~ .hamburger {
  background: transparent;
}
.navigation input:checked ~ .hamburger:before {
  top: 0;
  transform: rotate(-45deg);
  width: 30px;
}

.navigation input:checked ~ .hamburger.hamburger:after {
  top: 0;
  transform: rotate(45deg);
  width: 30px;
}

.navigation input:checked ~ .menu {
  right: 0;
}

@media (max-width: 10000px) and (min-width: 1401px) {
  .menu li a {
    color: black;
    text-decoration: none;
    display: block;
    padding: 40px 25px;
    font-size: 33px;
    list-style: 1;
    transition: 0.3s;
  }

  #vivaImage {
    height: auto;
    width: 18vw;
  }
}

@media (max-width: 1400px) and (min-width: 1101px) {
  .menu li a {
    color: black;
    text-decoration: none;
    display: block;
    /* padding: 40px 25px; */
    font-size: 30px;
    list-style: 1;
    transition: 0.3s;
  }

  #vivaImage {
    height: auto;
    width: 20vw;
  }

  .hamburger,
  .toggle-menu {
    display: block;
  }

  .header {
    padding: 10px 20px;
  }

  .menu {
    justify-content: start;
    flex-direction: column;
    align-items: center;
    position: fixed;
    top: 0;
    right: -400px;
    background: white;
    width: 300px;
    height: 100%;
    padding-top: 65px;
  }

  .menu li {
    width: 100%;
  }

  .menu li a,
  .menu li a:hover {
    padding: 30px;
    font-size: 24px;
    box-shadow: 0 1px 0 rgba(255, 255, 255, 0.1) inset;
  }
}

@media (max-width: 1100px) and (min-width: 826px) {

  .menu li a {
    color: black;
    text-decoration: none;
    display: block;
    /* padding: 40px 25px; */
    font-size: 30px;
    list-style: 1;
    transition: 0.3s;
  }

  #vivaImage {
    height: auto;
    width: 22vw;
  }

  .menu li a {
    color: black;
    text-decoration: none;
    display: block;
    padding: 40px 25px;
    font-size: 27px;
    list-style: 1;
    transition: 0.3s;
  }

  .hamburger,
  .toggle-menu {
    display: block;
  }

  .header {
    padding: 10px 20px;
  }

  .menu {
    justify-content: start;
    flex-direction: column;
    align-items: center;
    position: fixed;
    top: 0;
    right: -400px;
    background: white;
    width: 300px;
    height: 100%;
    padding-top: 65px;
  }

  .menu li {
    width: 100%;
  }

  .menu li a,
  .menu li a:hover {
    padding: 30px;
    font-size: 24px;
    box-shadow: 0 1px 0 rgba(255, 255, 255, 0.1) inset;
  }
}

@media (max-width: 825px) and (min-width: 450px) {
  .hamburger,
  .toggle-menu {
    display: block;
  }

  #vivaImage {
    height: auto;
    width: 25vw;
  }

  .header {
    padding: 10px 20px;
  }

  .menu {
    justify-content: start;
    flex-direction: column;
    align-items: center;
    position: fixed;
    top: 0;
    right: -400px;
    background: white;
    width: 300px;
    height: 100%;
    padding-top: 65px;
  }

  .menu li {
    width: 100%;
  }

  .menu li a,
  .menu li a:hover {
    padding: 30px;
    font-size: 24px;
  }
}

@media (max-width: 449px) {
  #vivaImage {
    height: auto;
    width: 25vw;
  }

  .hamburger,
  .toggle-menu {
    display: block;
  }

  .header {
    padding: 10px 20px;
  }

  .menu {
    justify-content: start;
    flex-direction: column;
    align-items: center;
    position: fixed;
    top: 0;
    right: -400px;
    background: white;
    width: 300px;
    height: 100%;
    padding-top: 65px;
  }

  .menu li {
    width: 100%;
  }

  .menu li a,
  .menu li a:hover {
    padding: 30px;
    font-size: 24px;
    box-shadow: 0 1px 0 rgba(255, 255, 255, 0.1) inset;
  }

  img {
    width: 100%;
    height: auto;
  }
}

li,
h1,
h2,
h3,
p {
  font-family: "Open Sans", sans-serif;
  color: white;
}
</style>