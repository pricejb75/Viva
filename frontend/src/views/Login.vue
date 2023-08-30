<template>
    <div id="login">

      <form v-on:submit.prevent="login">

        <h1>Please Sign In</h1>

        <div id="fields">

          <label for="username">Username</label>

          <input
            type="text"
            id="username"
            placeholder="Username"
            v-model="loginDto.username"
            required
            autofocus
          />

          <label for="password">Password</label>

          <input
            type="password"
            id="password"
            placeholder="Password"
            v-model="user.password"
            required
          />

          <div>
            <button type="submit">Sign in</button></div>
          </div>
        <hr/>
        Need an account? <router-link v-bind:to="{ name: 'register' }">Register!</router-link>
      </form>
    </div>
  </template>
  
  <script>
  import authService from "../services/AuthService";
  
  export default {
    name: "LoginView",
    data() {
      return {
        loginDto : {
          username: "",
          password: "",
        },
      };
    },
    methods: {
      login() {
        authService
          .login(this.user)
          .then((response) => {
            if (response.status == 200) {
              this.$store.commit("SET_AUTH_TOKEN", response.data.token);
              this.$store.commit("SET_USER", response.data.user);
              this.$router.push("/");
            }
          })
          .catch((error) => {
            const response = error.response;
            if (!response) {
              alert(error);
            } else if (response.status === 401) {
              alert("Invalid username and password!");
            } else {
              alert(response.message);
            }
          });
      },
    },
  };
  </script>
  
  <style scoped>
  
  </style>

<!-- <template>

  <div id="login">

    <div id="display-box">{{ response }}</div>

    <form v-on:submit.prevent="login">

      <h1>Please Sign In</h1>

      <div id="fields">

        <label for="username">Username</label>

          <input
            type="text"
            id="username"
            placeholder="Username"
            v-model="loginDto.username"
            required
            autofocus
          />

          <label for="password">Password</label>

          <input
            type="password"
            id="password"
            placeholder="Password"
            v-model="user.password"
            required
          />

          <div>
            <button type="submit">Sign in</button></div>
          </div>

      <hr/>
      Need an account? 
      <router-link v-bind:to="{ name: 'register' }">Register!</router-link>

    </form>


  </div>
</template>

<script>
import authService from "../services/AuthService";

export default {
  name: "LoginView",
  data() {
    return {
      loginDto : {
        username: "",
        password: "",
      },
      response: ''
    };
  },
  methods: {
    authenticateUser() {
      authService
        .authenticateUser(this.loginDto)
        .then((response) => {
          if (response.loginResponseDto.loginResult.eqals('SUCCESS')) {
            this.$store.commit("SET_USER", response.data);
            this.$router.push("/");
          }
          if(response.loginResponseDto.loginResult.equals('BAD_PASSWORD')) {
            response = "Invalid Password!"
          }

          else {
            response = "User does not exist."
          }
        })
     
    },
  },
};
</script>

<style scoped>

</style> -->