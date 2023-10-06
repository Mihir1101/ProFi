import axios from 'axios';

const instance = axios.create({
    baseURL:"https://gateway-arbitrum.network.thegraph.com/api/eaee48d9a0a0be50dabf31fdf13fcb96/subgraphs/id/"
})

export default instance;