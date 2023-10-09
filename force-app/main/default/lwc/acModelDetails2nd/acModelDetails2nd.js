import { LightningElement , api, wire} from 'lwc';
import getModelDetails from '@salesforce/apex/ModelDetailsController.getModelDetails';
import { NavigationMixin } from 'lightning/navigation'; // Import NavigationMixin
export default class AcModelDetails2nd extends NavigationMixin(LightningElement) {
  
    @api modelId;

    model;

    @wire(getModelDetails, { modelId: '$modelId' })
    wiredModelDetails({ error, data }) {
        if (data) {
            this.model = data;
        } else if (error) {
            console.error('Error fetching model details:', error);
        }
    }
    handleShowDetailsClick() {
        // Navigate to the detail page of the AC model
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: this.modelId,
                objectApiName: 'AC_Model__c', // Replace with the actual object API name
                actionName: 'view',
            },
        });
    }
        }   

