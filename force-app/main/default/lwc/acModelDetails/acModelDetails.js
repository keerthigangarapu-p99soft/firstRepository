import { LightningElement, api, wire } from 'lwc';
import getModelDetails from '@salesforce/apex/ModelDetailsController.getModelDetails';
export default class AcModelDetails extends LightningElement {
        @api modelId; // Pass the selected model ID from the parent component
        model;
    
        @wire(getModelDetails, { modelId: '$modelId' })
        wiredModelDetails({ error, data }) {
            if (data) {
                this.model = data;
            } else if (error) {
                console.error('Error fetching model details:', error);
            }
        }   




}