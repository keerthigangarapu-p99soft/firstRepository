import { LightningElement, wire, track } from 'lwc';
import getAcUnitData from '@salesforce/apex/ACUnitController.getAcUnitData';
export default class AcManagementDashboard extends LightningElement {
    @track acUnitsWithMaintenance = [];

    // Wire method to fetch AC unit data from Apex
    @wire(getAcUnitData)
    wiredAcUnitData({ error, data }) {
        if (data) {
            // Assign the retrieved data to the acUnitsWithMaintenance property
            this.acUnitsWithMaintenance = data;
        } else if (error) {
            console.error('Error fetching AC unit data:', error);
        }
    }
}
