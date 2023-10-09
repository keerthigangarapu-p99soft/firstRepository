import { LightningElement ,api} from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class RecordForm extends LightningElement {
    @api objectApiName;
    @api recordId;
    handlesucess(){
        const showtoastmess = new ShowToastEvent({
            title:'Success',
            message:'Records have been loaded successfully',
            variant:'success',
            mode:'dismissable'
        });
        this.dispatchEvent(showtoastmess);
        
    }
}