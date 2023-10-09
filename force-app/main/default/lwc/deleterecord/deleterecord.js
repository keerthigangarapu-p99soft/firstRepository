import { LightningElement, api } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import { deleteRecord, RecordFieldDataType } from 'lightning/uiRecordApi';
import {NavigationMixin} from 'lightning/navigation';


export default class Deleterecord extends NavigationMixin(LightningElement ){
@api recordId;
@api objectApiName;
handledeleterecord(){
    deleteRecord(this.recordId)
    .then( ()=> {
        this.dispatchEvent(new ShowToastEvent({
            title:'Success',
            message:'Record deletedd successfully',
            variant:'success',
            mode:'dismissable'

    
        }));
        this[NavigationMixin.Navigate]({
            type:"standard__objectPage",
            attributes : {
                     actionName:"list",
                      objectApiName: this.objectApiName
            },
            state :{
                filterName:"Recent"
            }

        });
    })
    .catch(error =>{
        this.dispatchEvent( new ShowToastEvent ({
            
                title:'error',
                message:'erroe while Record deleting ',
                variant:'error',
                mode:'dismissable'
    
        }));
    })
}
}