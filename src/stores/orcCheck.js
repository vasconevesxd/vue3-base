import { defineStore } from "pinia";
import axios from "axios";

export const useOrcCeck = defineStore('orcCeck', {
    state: () => ({
        orc: []
    }),
    getters: {
        getORC: state => state.orc
    },
    actions: {
        async getORCCheck(){
            try {
                const data = await axios.get(
                  "https://jsonplaceholder.typicode.com/todos"
                );
                this.orc = {headers: ["userId","id","title","completed"],  fields: data.data};
            } catch (error) {
                alert(error);
            }
        }
    }
})