import { LightningElement } from 'lwc';

export default class Directives extends LightningElement {
    isvisible=false;
    name;


    onchlick(){
        this.isvisible=true;
    }
    oninputchange(event){
        this.name= event.target.value
    }
     get inputtext(){
        return this.name==='hello'
    }
}