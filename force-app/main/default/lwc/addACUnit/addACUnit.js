import { LightningElement, track } from 'lwc';
import insertACUnit from '@salesforce/apex/ACUnitController1.insertACUnit';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class AddACUnit extends LightningElement {
    @track location = '';
    @track model = '';
    @track installationDate = '';

    handleLocationChange(event) {
        this.location = event.target.value;
    }

    handleModelChange(event) {
        this.model = event.target.value;
    }

    handleInstallationDateChange(event) {
        this.installationDate = event.target.value;
    }

    handleSave() {
        // Call the Apex method to insert the AC unit record
        insertACUnit({ location: this.location, model: this.model, installationDate: this.installationDate })
            .then(result => {
                // Handle success
                this.showSuccessToast('AC unit record inserted successfully');
                // Optionally, you can perform other actions here
            })
            .catch(error => {
                // Handle errors
                this.showErrorToast('Error inserting AC unit record: ' + error.body.message);
            });
    }

    // Show a success toast message
    showSuccessToast(message) {
        const toastEvent = new ShowToastEvent({
            title: 'Success',
            message: message,
            variant: 'success',
        });
        this.dispatchEvent(toastEvent);
    }

    // Show an error toast message
    showErrorToast(message) {
        const toastEvent = new ShowToastEvent({
            title: 'Error',
            message: message,
            variant: 'error',
        });
        this.dispatchEvent(toastEvent);
    }
}
