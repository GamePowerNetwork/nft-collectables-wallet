import { testData } from '../../../extra/testData.extra'
import axios from 'axios';

export default {
  claimNFT: async () => {
    return testData.nftData
  },

  getClaimData: () => {
    const data = testData.scanData
    if(data.c === 0){
      axios.get(`https://ipfs.io/ipfs/${data.p}/provider.json`)
        .then(res => {
          const provider = res.data;
          console.log("GET CLAIM DATA: ", provider);
          return {
            provider,
            nft: data.n
          }
        })
    }
    return testData.scanData
  },

  getCollectibles: async () => {
    return testData.collectibleData
  },

  getSeries: async () => {
    return testData.seriesData
  }
}