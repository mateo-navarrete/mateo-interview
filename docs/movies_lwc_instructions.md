# Build a Lightning Component to display the Fast and Furious movies

## Prompt
Using the provided Fast and Furious API, Apex classes and lwc, get the list of movies and display them in a datatable.

Information about the API can be found [here](https://github.com/Gradient-Works/interview/blob/main/docs/ff_api.md)


## Some Implementation Details
1. Please use Apex to interact with the API.
2. Using `lightning-datatable`, build a component containing the following:
    - Columns for: Id, Name, Release Date, Opening Revenue
    - Opening Revenue should be formatted as currency
    - Release Date should be formatted as MM DD, YYYY
3. Display the table in a Lightning App page named "Movies"

## Submission Instructions
Once you're done with the assignment, make sure that all of your work is pulled down from your org and included in your forked repository. It should be organized such that we can run this command to successfuly deploy and test your code:

    sfdx force:mdapi:deploy -u orgUser -d gradient-works-ff/src/main/default -w 10

Let us know once your code has been pushed up to GitHub so we can make sure we have access to it before you leave.
