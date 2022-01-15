# Build a Lightning Component to display the Fast and Furious movies

## Prompt
Using the provided Fast and Furious API, get the list of movies and display them in a datatable

Information about the API can be found [here](https://github.com/Gradient-Works/interview/blob/main/docs/ff_api.md)

We recommend creating your Apex classes and lwc components locally and deploying them to your Salesforce Developer Environment using sfdx mdapi commands.

## Some Implementation Details
Overall we are not trying to be prescriptive in how you go about completing the task. We have just a few things we'd like to make sure you include:

1. The table should include the following:
    - Columns for: Id, Name, Release Date, Opening Revenue
    - Opening Revenue should be formatted as currency
    - Release Date should be formated as MM DD, YYYY
2. Display the table in a Lightning App page named "Movies"

## Submission Instructions
Once you're done with the assignment, make sure that all of your work is pulled down from your org and included in your forked repository. It should be organized such that we can run this command to successfuly deploy and test your code:

    sfdx force:mdapi:deploy -u orgUser -d gradient-works-ff/src/main/default -w 10

Let us know once your code has been pushed up to GitHub so we can make sure we have access to it before you leave.
