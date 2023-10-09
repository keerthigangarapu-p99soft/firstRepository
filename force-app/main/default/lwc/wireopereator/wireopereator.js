
import { LightningElement, track,wire } from 'lwc';
import getaccc from '@salesforce/apex/apexwireclass.getaccc';
const columns=[
    {label:'name', fieldName:'Name'},
    {label:'Account id', fieldName:'Id'},

];
export default class Wireopereator extends LightningElement {
    @track columns=columns;
    @track data=[];
    @wire(getaccc)
    Accdetails({data,error}){
if(data){
this.data =data;
}else if(error){
console.debug('error occured');
}
    }
}