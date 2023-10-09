import axios from 'axios';

const instance = axios.create({
    baseURL:"https://gateway-arbitrum.network.thegraph.com/api/da8504c1ecfcea6facab47c86b57d811/subgraphs/id/"
})

export default instance;