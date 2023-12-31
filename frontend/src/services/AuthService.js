import axios from 'axios';

export default {

  login(user) {
    return axios.post('/api/login', user)
  },

  register(user) {
    return axios.post('/api/register', user)
  },

  authenticateUser(loginDto) {
    return axios.post('/api/authenticate', loginDto)
  }

}