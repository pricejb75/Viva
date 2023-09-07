import axios from 'axios';

export default {

    getCountries(){
        return axios.get('http://localhost:8081/api/countries');
    },

    getCountryById(id){
        let path = 'http://localhost:8081/api/countries/';
        return axios.get(path+id);
    }


    
}