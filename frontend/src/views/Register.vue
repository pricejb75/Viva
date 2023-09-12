<template>
    <div id="register">
      <form v-on:submit.prevent="register">
        <h1>Create Account</h1>
        <div id="fields">
          <label for="username">Username :</label>
          <input
            type="text"
            id="username"
            placeholder="Username"
            v-model="user.username"
            required
            autofocus
          />
    <br>
          <label for="name">Name :</label>
          <input
            type="text"
            id="name"
            placeholder="Name"
            v-model="user.name"
            required
          />
          <br>
          <label for="password">Password :</label>
          <input
            type="password"
            id="password"
            placeholder="Password"
            v-model="user.password"
            required
          />
       <br>
          <label for="confirmPassword">Confirm password :</label>
          <input
            type="password"
            id="confirmPassword"
            placeholder="Confirm Password"
            v-model="user.confirmPassword"
            required
          />
            <br>
          <label for="address">Address :</label>
          <input
            type="text"
            id="address"
            placeholder="Address"
            v-model="user.address"
          />
          <br>
  
          <label for="city">City :</label>
          <input type="text" id="city" placeholder="City" v-model="user.city" />
          <br>
          <label for="state">State</label>
          <input
            type="text"
            id="state"
            placeholder="State"
            v-model="user.stateCode"
            maxlength="2"
            required
          />
          <br>
  
          <label for="zip">ZIP :</label>
          <input
            type="number"
            id="zip"
            placeholder="ZIP"
            v-model="user.zip"
            required
            minlength="5"
            maxlength="5"
          />
          <br>
          <!-- <div></div> -->
          <div>
            <button type="submit">Create Account</button>
          </div>
        </div>
        <hr />
        Have an account?
        <router-link v-bind:to="{ name: 'login' }">Sign in!</router-link>
      </form>
    </div>
  </template>
  
  <script>
  import authService from "../services/AuthService.js";
  
  export default {
    name: "RegisterView",
    data() {
      return {
        user: {
          username: "",
          name: "",
          password: "",
          confirmPassword: "",
          address: "",
          city: "",
          stateCode: "",
          zip: "",
          role: "user",
        },
      };
    },
    methods: {
      error(msg) {
        alert(msg);
      },
      success(msg) {
        alert(msg);
      },
      register() {
        if (this.user.password != this.user.confirmPassword) {
          this.error("Password & Confirm Password do not match");
        } else {
          authService
            .register(this.user)
            .then((response) => {
              if (response.status == 201) {
                this.success("Thank you for registering, please sign in.");
                this.$router.push({
                  path: "/login",
                });
              }
            })
            .catch((error) => {
              const response = error.response;
              if (!response) {
                this.error(error);
              } else if (response.status === 400) {
                if (response.data.errors) {
                  // Show the validation errors
                  let msg = "Validation error: ";
                  for (let err of response.data.errors) {
                    msg += `'${err.field}':${err.defaultMessage}. `;
                  }
                  this.error(msg);
                } else {
                  this.error(response.data.message);
                }
              } else {
                this.error(response.data.message);
              }
            });
        }
      },
    },
  };
  </script>
  
  <style scoped>

  input {
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

  label {
    font-size: 1.4em;
    padding:10px;
  }

  #register {
    display: flex;
    align-items: center;
    justify-content: center;
  }

  h1{
    text-align: center;
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


  </style>