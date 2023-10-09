import { LightningElement ,track, wire} from 'lwc';
import getAccUnits from '@salesforce/apex/AcunitDetails.getAccUnits';


export default class AcUnitList extends LightningElement {

    @track searchTerm = '';
    @track selectedFilter = '';
    @track acUnits = [];

    // Define filter options
    filterOptions = [
        { label: 'All', value: 'All' },
        { label: 'Residential', value: 'Residential' },
        { label: 'Commercial', value: 'Commercial' },
    ];

    // Define columns for the datatable
    columns = [
        { label: 'Name', fieldName: 'Name', type: 'text' },
        { label: 'Type', fieldName: 'typeOfAcunit__c', type: 'text' },
        { label: 'Installation Date', fieldName: 'Installation_Date__c', type: 'date' },
    ];

    // Wire a function to fetch AC units from Salesforce
    @wire(getAccUnits, { searchTerm: '$searchTerm', selectedFilter: '$selectedFilter' })
    wireACUnits({ error, data }) {
        if (data) {
            this.acUnits = data;
        } else if (error) {
            // Handle error
        }
    }

    // Handle search input change
    handleSearch(event) {
        this.searchTerm = event.target.value;
    }

    // Handle filter selection change
    handleFilter(event) {
        this.selectedFilter = event.target.value;
    }
}

