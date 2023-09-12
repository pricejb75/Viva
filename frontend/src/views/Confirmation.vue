<template>
    <main id="flight-confirm-main">
      <div id="confirm-container">
        <h2 id="message">
          Thank you! <br> <br>
           Your Order Has Been Placed. <br>
          Your order details have been sent to you via email. <br> <br>
          Your confirmation code is:
        </h2>
        <h2 id="confirm-code">{{ confirmationCode }}</h2>
      </div>
    </main>
  </template>
  
  
  <script>
  export default {
    data() {
      return {
        confirmationCode: null,
      };
    },
    methods: {
      generateConfirmationCode() {
        const length = 20;
        const characters =
          "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        let confirmationCode = "";
  
        for (let i = 0; i < length; i++) {
          const randomIndex = Math.floor(Math.random() * characters.length);
          confirmationCode += characters.charAt(randomIndex);
        }
  
        return confirmationCode;
      },
    },
    created() {
      this.confirmationCode = this.generateConfirmationCode();
    },
  };
  </script>
  
  
  <style scoped>

  </style>