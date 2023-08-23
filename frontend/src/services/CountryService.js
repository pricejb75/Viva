import axios from 'axios';

export default {

    getCountries(){
        return axios.get('http://localhost:8081/api/countries');
    }


    
}