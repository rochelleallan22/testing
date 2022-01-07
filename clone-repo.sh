#!/bin/bash

# This script will clone our current collection of repositories, ignoring any
# repositories you may already have in the current directory. First ensure you
# replace the below three SSH key IDs with your own. Then, From a dedicated
# directory, run this script at the command line in Bash, Zsh or similar shell.
#
# Repos are organized by AWS account (edtwordpress, Monro Prod, Monro Non Prod,
# etc.), and directory structure representing these accounts will be created
# for you.
#
# Any questions? Feel free to reach out to Jake! jbrandt@mindex.com

# Replace this value with your IAM user's SSH key ID for the edtwordpress AWS account.
EDT_WORDPRESS_SSH_KEY_ID='your-key-id-here'

# Replace this value with your IAM user's SSH key ID for the Monro Prod AWS account.
MONRO_PROD_SSH_KEY_ID='your-key-id-here'

# Replace this value with your IAM user's SSH key ID for the Monro CMS AWS account.
MONRO_CMS_SSH_KEY_ID='your-key-id-here'

###################################
# No edits required below this line
###################################

EDT_WORDPRESS_REPO_NAMES=( \
    'mindex-docker-wordpress-demo' \
    '240days' \
    'Apache-httpd' \
    'C2Sense-Webdev' \
    'HCO-WebDev' \
    'HowardHanna' \
    'Seneca-Park-Zoo-WebDev' \
    'ServerConfigs' \
    'alicia' \
    'carx' \
    'carx-mandrill-mailchimp' \
    'cds' \
    'cee-mit' \
    'cmac-mobile-app' \
    'codePipelineTest' \
    'craft-bonadio' \
    'craft-roc2025' \
    'craft-template' \
    'crancap' \
    'eagledream' \
    'eagledreamhealth' \
    'edta11y' \
    'fargate-hosting-cdk' \
    'fueledandfocused' \
    'greenlight_networks' \
    'harley' \
    'ideaboxx' \
    'justcorp' \
    'justwater' \
    'macronet' \
    'monro' \
    'monro-yext' \
    'morgancommunities-dev' \
    'nyk-testing' \
    'nywcc' \
    'onestream' \
    'primecoalition' \
    'risinglotuswellness' \
    'socius' \
    'sociusfo' \
    'sweetwater' \
    'untappedShores' \
    'wordpress-burke' \
    'wordpress-coast' \
    'wordpress-consiliarium' \
    'wordpress-consilliarum' \
    'wordpress-edt' \
    'wordpress-familyfirst' \
    'wordpress-icircle' \
    'wordpress-ses' \
    'wordpress-template'
	'bastion_scripts' \
	'greenlight_web_api')

echo ''
echo 'This process may take quite some time to complete (44+ GB of data)...'
echo ''

mkdir -p ./edtwordpress && cd ./edtwordpress
for repo in "${EDT_WORDPRESS_REPO_NAMES[@]}"
do
    if [ ! -d "./$repo" ]; then
        git clone "ssh://$EDT_WORDPRESS_SSH_KEY_ID@git-codecommit.us-east-1.amazonaws.com/v1/repos/$repo"
    else
        echo "Skipping $repo; already exists locally"
    fi
done

cd ../
