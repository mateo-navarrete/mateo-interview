# Setup

## Prerequisites
1. Salesforce CLI - https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_install_cli.htm 
2. Salesforce Developer Environment - https://developer.salesforce.com/signup
4. A Github account - https://docs.github.com/en/get-started/quickstart/set-up-git#setting-up-git

## Install gradient-works-ff package
1. Log into your Salesforce Developer Environment using the Salesforce CLI:
    - sfdx force:auth:web:login -r orgUrl
    - orgUrl should be replaced with the url of your Salesforce Developer Enviornment (i.e. - https://gradientworks5-dev-ed.my.salesforce.com)
2. [Fork](https://docs.github.com/en/get-started/quickstart/fork-a-repo#prerequisites) and clone the following repo: https://github.com/Gradient-Works/interview
3. Deploy the GWInterview package to your environment
   - Go to interview/gradient-works-ff directory
   - sfdx force:mdapi:deploy -u orgUser -d . -w 10
    - orgUser should be the user you logged in with from step 1.
