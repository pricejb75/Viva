<template>

  <section id="main-section">

    <div id="login" v-if="!isLoggedIn">

      <div id="display-box">{{ response }}</div>

      <form v-on:submit.prevent="authenticateUser">

        <h1 id="sign-in-message">Please Sign In</h1>

        <h2>
          Username : ExampleUser1
        </h2>
        <h2>
          Password : password
        </h2>

        <div id="fields">

          <label for="username">Username : </label>

            <input
              type="text"
              id="username"
              placeholder="Username"
              v-model="loginDto.username"
              required
              autofocus
            />

            <br>

            <label for="password">Password : </label>

            <input
              type="password"
              id="password"
              placeholder="Password"
              v-model="loginDto.password"
              required
            />

            <div>
              <button type="submit">Sign in</button></div>
            </div>


       <p id="need-account"> Need an account?</p> 

        <router-link v-bind:to="{ name: 'register' }">Register!</router-link>

      </form>


    </div>

    <div id="logged-in" v-if="isLoggedIn">

      <h1 id="message">
        You're Currently logged in as : {{ this.$store.state.user.username }}
      </h1>

      <button @click="logout()" title="logout">
        Logout
      </button>




    </div>

  </section>
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
  computed: {
        isLoggedIn() {
          return this.$store.state.user.username != "";
        }
      },
  methods: {
    authenticateUser() {
      authService
        .authenticateUser(this.loginDto)
        .then((response) => {
          if (response.data.loginResult == 'SUCCESS') {
            this.$store.commit("SET_USER", 
    {
      id: response.data.id,
      username: response.data.username,
      name: '',
      address: '',
      city: '',
      stateCode: '',
      ZIP: ''
    });
            this.$router.push("/");
          }
          if(response.data.loginResult == 'BAD_PASSWORD') {
            response = "Invalid Password!"
          }

          else {
            response = "User does not exist."
          }
        })
     
    },
    logout() {
      if(this.$store.state.user.username != "") {
        this.$store.commit("SET_USER", 
        {
      id: '',
      username: '',
      name: '',
      address: '',
      city: '',
      stateCode: '',
      ZIP: ''
        })
      }
      this.$router.push("/");
    },


    isAuthenticated() {
            return this.$store.state.user.username !== "";
        }

  },
};
</script>

<style scoped>

#username {
  border: solid black;
    font-size: 17px;
    box-shadow:0 0 15px 4px rgba(0,0,0,0.40);
    border-radius:10px;
    font-family: sans-serif;
    font-size: 1.0 rem;
    height: 40px;
    margin-right:3vw;
    margin-bottom: 1vw;
    align-items: center;
}

#password {
  border: solid black;
    font-size: 17px;
    box-shadow:0 0 15px 4px rgba(0,0,0,0.40);
    border-radius:10px;
    font-family: sans-serif;
    font-size: 1.0 rem;
    height: 40px;
    margin-right:3vw;
    margin-bottom: 1vw;
    align-items: center;
}

#sign-in-message {
  font-size: 2em;
  margin-bottom: 1.5em;
}

label {
  font-size: 1.4em;
  padding: 10px;
}

button {
        font-family: sans-serif;
        font-weight: bold;
        background-color: rgb(241, 184, 62);
        text-transform: uppercase;
        border-color: rgb(241, 184, 62);
        color:white;
        border-radius: 5px;
        cursor:pointer;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
        padding: 10px;
        font-size: 20px;
        margin-top: 20px;
        margin-bottom: 20px;
    }

    button:hover {
        color: rgb(138, 32, 32);
    }

    h2 {
      font-size: 1.2em;
    }

    #need-account {
      font-size: 1.5em;
    }

    a {
      font-size: 1.5em;
      text-decoration: none;
      background-color: rgb(138, 32, 32);
      text-transform: uppercase;
      color:white;
      border-radius: 5px;
        cursor:pointer;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
        padding: 10px;
        font-size: 20px;
    }

    a:hover {
      color: rgb(241, 184, 62);
    }

</style> 