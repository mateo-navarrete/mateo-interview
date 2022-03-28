#!/bin/bash

set -eou pipefail

devhub_alias=${DEVHUB_ALIAS:-DevHub}
duration_days=${DURATION_DAYS:-7}

user_email=${USER_EMAIL}
if [ -z "${user_email}" ]; then
  echo "No user email specified. Use USER_EMAIL env variable"
  exit 1
fi

org_alias="interview-${user_email}"
echo "${org_alias}"

echo ""
echo "Creating scratch org"
sfdx force:org:create -s -v "${devhub_alias}" -a "${org_alias}" -f config/project-scratch-def.json --durationdays "${duration_days}"

echo ""
echo "Creating user"
sfdx force:user:create -u "${org_alias}" -v "${devhub_alias}" username="${user_email}" email="${user_email}" profileName="System Administrator"
user_id=$(sfdx force:user:display -v "${devhub_alias}" -u "${user_email}" --json | jq -j ".result.id")

echo ""
echo "Sending reset password to user"
echo "System.resetPassword(Id.valueOf('${user_id}'), true);" | sfdx force:apex:execute -u "${org_alias}"


