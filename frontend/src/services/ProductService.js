import axios from 'axios';

export default {
    getAllProducts(...args){

        let path = '/api/products'

        if(withLinks !== undefined && withLinks !== '') {
            path += `?withLinks=${withLinks}`;
        }
        if(qualityDetail !== undefined && qualityDetail !== '') {
            path += `?qualityDetail=${qualityDetail}`;
        }
        if(type !== undefined && type !== '') {
            path += `?type=${type}`;
        }
        if(country !== undefined && country !== '') {
            path += `?country=${country}`;
        }
        if(lowEnd !== undefined && lowEnd !== '') {
            path += `?lowEnd=${lowEnd}`;
        }
        if(highEnd !== undefined && highEnd !== '') {
            path += `?highEnd=${highEnd}`;
        }

        return axios.get(path);
        
    }
} 