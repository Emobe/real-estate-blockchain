import Vue from 'vue'
import Vuex from 'vuex'
import Web3 from '../utils/w3'
import accounts from '../utils/accounts'
//import { balanceOf } from '../utils/abi'
import deed from '../../../blockchain/build/contracts/Deed.json'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    deeds: []
  },
  mutations: {
  },
  actions: {
    async getVault() {
      let contract = new Web3.eth.Contract(deed.abi)
      contract.options.address = accounts.deed;
      const ey = await contract.methods.balanceOf('0x22d491Bde2303f2f43325b2108D26f1eAbA1e32b').call();
      console.log(ey)
    }
  },
  modules: {
  }
})
