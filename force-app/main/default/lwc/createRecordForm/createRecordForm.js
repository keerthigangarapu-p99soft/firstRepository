import { LightningElement,track } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import {ShowToastEvent} from 'lightning/platformShowToastEvent'

export default class CreateRecordForm extends LightningElement {
    @track aname;
    @track aphone;
    @track afax;
    @track awebsite;
    @track abillingcity;
    onaccchange(event)
    {
       this.aname=event.target.value;
    }
    onaccphonechange(event){
        this.aphone=event.target.value;
    }
    onacccfaxhange(event){
        this.afax=event.target.value;
    }
    onaccwebchange(event){
        this.awebsite=event.target.value;
    }
    onaccbillchange(event){
        this.abillingcity=event.target.value;
    }
    handlesave()
    {
const fields={
'Name':this.aname,
'Phone':this.aphone,
'Fax':this.afax,
'Website':this.awebsite,
'BillingCity':this.abillingcity
};
const recordinput={apiName:'Account',fields};
createRecord(recordinput).then (result => {
this.dispatchEvent(new ShowToastEvent({
    title:'Success',
    message: 'record inserted successfully',
    variant:'success',
    mode:'dismissable'

}));

console.log('account record id:'+result.id);
})
.catch(error =>{
console.log('error while inserrting records:'+error.body.message);
this.dispatchEvent(new ShowToastEvent({
    title:'error',
    message: 'error wile inserted successfully',
    variant:'error',
    mode:'dismissable'
}));
})

    }
}
