import { LightningElement, track, wire } from 'lwc';
import insertMaintenanceRecord from '@salesforce/apex/MaintenanceRecordController.insertMaintenanceRecord';
import getACUnitsformainteance from '@salesforce/apex/ACUnitController.getACUnitsformainteance';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class MaintenanceScheduling extends LightningElement {
  @track maintenanceDate = '';
    @track description = '';
    @track selectedACUnit = '';
    @track acUnitOptions = [];

    // Load AC units options
    @wire(getACUnitsformainteance)
    loadACUnits({ data, error }) {
        if (data) {
            this.acUnitOptions = data.map(unit => ({
                label: unit.Name,
                value: unit.Id
            }));
        } else if (error) {
            console.error('Error loading AC units:', error);
        }
    }

    handleDateChange(event) {
        this.maintenanceDate = event.target.value;
    }

    handleDescriptionChange(event) {
        this.description = event.target.value;
    }

    handleACUnitChange(event) {
        this.selectedACUnit = event.detail.value;
    }

    handleSave() {
        // Call Apex method to insert maintenance record
        insertMaintenanceRecord({ 
            maintenanceDate: this.maintenanceDate, 
            description: this.description, 
            selectedACUnit: this.selectedACUnit 
        })
        .then(result => {
            // Handle success, e.g., show a toast notification
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Maintenance record saved successfully.',
                    variant: 'success',
                })
            );
            // Clear input fields
            this.maintenanceDate = '';
            this.description = '';
            this.selectedACUnit = '';
        })
        .catch(error => {
            // Handle errors, e.g., show a toast notification
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error',
                    message: 'Error saving maintenance record: ' + error.body.message,
                    variant: 'error',
                })
            );
        });
    }

}