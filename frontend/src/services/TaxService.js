import axios from 'axios';

export default {
    getTaxRateByStateCode(stateCode) {
        let path = 'https://teapi.netlify.app/api/statetax?state=';

        return axios.get(path + stateCode);
    }
}