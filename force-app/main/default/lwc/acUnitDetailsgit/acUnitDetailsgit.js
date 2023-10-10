import { LightningElement, track } from 'lwc';

export default class AcUnitDetailsgit extends LightningElement {



   


    @track locationFilter = '';
    @track modelFilter = '';
    @track selectedMaintenanceStatus = '';

    // Define maintenance status options for the combobox
    maintenanceStatusOptions = [
        { label: 'All', value: '' },
        { label: 'Scheduled', value: 'Scheduled' },
        { label: 'Completed', value: 'Completed' },
        { label: 'In Progress', value: 'In Progress' }
    ];

    handleLocationChange(event) {
        this.locationFilter = event.target.value;
    }

    handleModelChange(event) {
        this.modelFilter = event.target.value;
    }

    handleMaintenanceStatusChange(event) {
        this.selectedMaintenanceStatus = event.detail.value;
    }

    handleSearch() {
        // Dispatch an event to notify a parent component or trigger a search action
        const searchEvent = new CustomEvent('search', {
            detail: {
                locationFilter: this.locationFilter,
                modelFilter: this.modelFilter,
                maintenanceStatus: this.selectedMaintenanceStatus
            }
        });
        this.dispatchEvent(searchEvent);
    }
}

