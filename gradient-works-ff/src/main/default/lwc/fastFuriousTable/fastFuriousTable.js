import {LightningElement, wire} from 'lwc';
import getAllMovies from '@salesforce/apex/FuriousController.getAllMovies';

export default class FastFuriousTable extends LightningElement {
    columns = [
        {label: "Id", fieldName: "id"},
        {label: "Name", fieldName: "title"},
        {
            label: "Release Date",
            fieldName: "release_date",
            type:"date",
        },
        {
            label: "Opening Revenue",
            fieldName:"opening_revenue",
            type: 'currency',
            typeAttributes: { currencyCode: 'USD' }
        },
    ]
    data = [];
    @wire(getAllMovies)
    movies({data, error}){
        if (data && !error) {
            this.data = data;
        }
        if (error) {
            console.log(JSON.stringify(error));
        }
    }
}