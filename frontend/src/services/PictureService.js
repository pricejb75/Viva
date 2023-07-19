import axios from 'axios';

export default {

    getAllPictures(){
        let path = '/api/pictures'
        return axios.get(path);
    },

    getPictureById(id){
        let path = 'api/pictures/'
        if(id !== undefined && id !== '') {
            return axios.get(path + id);
        }
    }
}