#!/bin/bash -e

# rs-run-rightscript <server_id> <right_script_href>

# e.g.   rs-run-rightscript-array.sh 1234 4321

[[ ! $1 ]] && echo 'No server_id ID provided, exiting.' && exit 1
[[ ! $2 ]] && echo 'No right_script_id ID provided, exiting.' && exit 1

. "$HOME/.rightscale/rs_api_config.sh"
. "$HOME/.rightscale/rs_api_creds.sh"

server_id="$1"
rightscript_id="$2"
rightscript_href="https://my.rightscale.com/api/acct/$rs_api_account_id/right_scripts/$rightscript_id"

api_url="https://my.rightscale.com/api/acct/$rs_api_account_id/servers/$server_id/run_script"

echo "Running RightScript [$rightscript_href] on Server [$server_id]."
echo "GET: $api_url"
curl -s -S -v -X POST -b "$rs_api_cookie" -H X-API-VERSION:"$rs_api_version" -d server[right_script_href]="$rightscript_href" "$api_url"