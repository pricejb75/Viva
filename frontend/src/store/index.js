import { createStore } from 'vuex';
import VuexPersistance from 'vuex-persist';

const vuexLocal = new VuexPersistance({
  storage: window.localStorage
});

export default createStore({
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
  plugins: [vuexLocal.plugin]
})








