import axios from 'axios';

export default {
    getAllProducts(params){
        let p = params;
        p.withLinks = params.withLinks ?? '';
        p.qualityDetail = params.qualityDetail ?? '';
        p.type = params.type ?? '';
        p.country = params.country ?? '';
        p.lowend = params.lowend ?? '';
        p.highend = params.highend ?? '';
        // let products = productService.getAllProducts({qualityDetail = 'banans', country='uganda'})

        let path = '/api/products'

        if(p.withLinks) {
            path += `?withLinks=${p.withLinks}`;
        }
        if(p.qualityDetail) {
            path += `?qualityDetail=${p.qualityDetail}`;
        }
        if(p.type) {
            path += `?type=${p.type}`;
        }
        if(p.country) {
            path += `?country=${p.country}`;
        }
        if(p.lowEnd) {
            path += `?lowEnd=${p.lowEnd}`;
        }
        if(p.highEnd) {
            path += `?highEnd=${p.highEnd}`;
        }

        path = path.replace('?', '&');

        return axios.get(path);
        
    }
} 