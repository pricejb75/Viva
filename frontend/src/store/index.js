import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex)

export default new Vuex.Store({
  state: {
      user : {
      id: '',
      username: '',
      name: '',
      address: '',
      city: '',
      stateCode: '',
      ZIP: ''
    },
    loginDto : {
      username: '',
      password: ''
    }
  },
  mutations: {
    SET_USER(state,user) {
        state.user = user;
    },
   
  },
})








