<template>

 <div id="chekcout">

  <h1> Your total is : {{ total }}</h1>

      <form v-on:submit.prevent="submitOrder()">
        <h1>Checkout</h1>

        <h2>Shipping Info</h2>

        <div id="shipping_fields">
        
          <label for="shipping_name">Ship To:</label>
          <input
            type="text"
            id="name"
            placeholder={{ user.name }}
            v-model="user.name"
            required
          />

          <label for="shipping_address">Address</label>
          <input
            type="text"
            id="address"
            placeholder={{ user.address }}
            v-model="user.address"
          />
  
          <label for="shipping_city">City</label>
          <input type="text" 
           id="city" 
           placeholder={{ user.city }} 
           v-model="user.city" />
  
          <label for="shipping_state">State</label>
          <input
            type="text"
            id="state"
            placeholder={{ user.city }}
            v-model="user.stateCode"
            maxlength="2"
            required
          />
  
          <label for="shipping_zip">ZIP</label>
          <input
            type="number"
            id="zip"
            placeholder={{ user.zip }}
            v-model="user.zip"
            required
            minlength="5"
            maxlength="5"
          />

          <label for="message">Messsage</label>
          <input
            type="text"
            id="message"
            placeholder="Viva!"
          />
       
        </div>

        <h2>Billing Info</h2>

        <div id="billing_fields">

            <label for="billing_name">Cardholder Name</label>
            <input
            type="text"
            id="name"
            placeholder={{ user.name }}
            v-model="user.name"
            required
            />

            <label for="credit_card_number">Card Number</label>
            <input
            type="number"
            id="cc_number"
            placeholder="1234 5678 9101"
            v-model="user.zip"
            />

            <label for="card_pin">Card Pin</label>
            <input
            type="number"
            id="pin"
            placeholder="123"
            v-model="user.zip"
            required
            minlength="3"
            maxlength="3"
            />

            <label for="expiration_date">Card Expiration Date</label>
            <input
            type="date"
            id="expiration_date"
            placeholder="12/12/2025"
            />

        

            <label for="billing_address">Billing Address</label>
            <input
            type="text"
            id="address"
            placeholder={{ user.address }}
            v-model="user.address"
            />

            <label for="billing_city">City</label>
            <input type="text" 
            id="city" 
            placeholder={{ user.city }} 
            v-model="user.city" />

            <label for="billing_state">State</label>
            <input
            type="text"
            id="state"
            placeholder={{ user.city }}
            v-model="user.stateCode"
            maxlength="2"
            required
            />

            <label for="billing_zip">ZIP</label>
            <input
            type="number"
            id="zip"
            placeholder={{ user.zip }}
            v-model="user.zip"
            required
            minlength="5"
            maxlength="5"
            />


      </div>

           <div>
            <button type="submit">Submit Order</button>
           </div>

      </form>
    </div>


</template>


<script>
  export default {
    name: "Checkout",

    data() {
      return {
            user: {
            username: this.$store.state.user.username,
            name: this.$store.state.user.name,
            password: "",
            confirmPassword: "",
            address: this.$store.state.user.address,
            city: this.$store.state.user.city,
            stateCode: this.$store.state.user.stateCode,
            zip: this.$store.state.user.zip,
            role: "user",
            },
            taxRate: 0,
            total: this.calculateTotal,
            cartItems: []
      };
    },
    methods : {
      calculateTotal() {
            this.cartItems.forEach((c) => {
              this.total = this.total + c.product.price;
            })
          },
          submitOrder() {
            this.$router.push({name: 'confirmation'});
          }
    },
    created() {
      CartService.getCartItems().then(response => {
          this.cartItems = response.data;
        }),
        TaxService.getTaxRateByStateCode(this.user.stateCode).then(response => {
          this.taxRate = response.salesTax;
        })
    }
};

</script>


<style socped>

</style>