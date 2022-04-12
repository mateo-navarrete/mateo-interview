import { LightningElement, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getMovies from '@salesforce/apex/FastAndFuriousClient.getMovies';

export default class Movies extends LightningElement {
    columns = [
        { label: 'Id', fieldName: 'id' },
        { label: 'Name', fieldName: 'title' },
        {
            label: 'Release Date', fieldName: 'release_date',
        },
        { label: 'Opening Revenue', fieldName: 'opening_revenue', type: 'currency' }
    ];
    data = [];

    @wire(getMovies)
    data({ data, error }) {
        if (data) {
            let movies = [...data];
            movies = movies.map(m => {
                // make a copy as LWC has strict restrictions on read only data
                let movie = { ...m };
                // split date str and group by year, month, day(+rest of str)
                let dates = movie.release_date.split("-");
                let year = dates[0];
                let month = dates[1];
                let day = dates[2];
                // slice to isolate only the day in the str
                movie.release_date = '' + month + ' ' + day.slice(0, 2) + ', ' + year;
                return movie;
            });
            this.data = movies;
        } else if (error) {
            const event = new ShowToastEvent({
                title: 'Error',
                message: 'Error getting movie data',
            });
            this.dispatchEvent(event);
        }
    }

}