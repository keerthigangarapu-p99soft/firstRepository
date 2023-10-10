import { LightningElement , track } from 'lwc';
import insertACUnit from '@salesforce/apex/ACUnitController1.insertACUnit';
import updateACUnit from '@salesforce/apex/ACUnitController1.updateACUnit';
import deleteACUnit from '@salesforce/apex/ACUnitController1.deleteACUnit';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class ACUnitManagementLWC extends LightningElement {


    @track operation = 'add'; // Default operation is 'add'
    @track acUnitId; // To store the ID of the AC unit being edited or deleted

    @track location = '';
    @track model = '';
    @track installationDate = '';

    // Handle changes in input fields
    handleLocationChange(event) {
        this.location = event.target.value;
    }

    handleModelChange(event) {
        this.model = event.target.value;
    }

    handleInstallationDateChange(event) {
        this.installationDate = event.target.value;
    }

    // Handle the operation (add, edit, or delete)
    handleOperation(event) {
        this.operation = event.target.value;
        this.clearFields(); // Clear input fields when changing the operation
    }

    // Handle the save operation (add or edit)
    handleSave() {
        if (this.operation === 'add') {
            // Insert a new AC unit
            insertACUnit({ location: this.location, model: this.model, installationDate: this.installationDate })
                .then(result => {
                    this.showSuccessToast('AC unit added successfully.');
                    this.clearFields();
                })
                .catch(error => {
                    this.showErrorToast('Error adding AC unit: ' + error.body.message);
                });
        } else if (this.operation === 'edit') {
            // Update an existing AC unit
            updateACUnit({ acUnitId: this.acUnitId, location: this.location, model: this.model, installationDate: this.installationDate })
                .then(result => {
                    this.showSuccessToast('AC unit updated successfully.');
                    this.clearFields();
                })
                .catch(error => {
                    this.showErrorToast('Error updating AC unit: ' + error.body.message);
                });
        }
    }

    // Handle the delete operation
    handleDelete() {
        // Perform the delete operation
        deleteACUnit({ acUnitId: this.acUnitId })
            .then(result => {
                this.showSuccessToast('AC unit deleted successfully.');
                this.clearFields();
            })
            .catch(error => {
                this.showErrorToast('Error deleting AC unit: ' + error.body.message);
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

    // Clear input fields
    clearFields() {
        this.location = '';
        this.model = '';
        this.installationDate = '';
    }

}