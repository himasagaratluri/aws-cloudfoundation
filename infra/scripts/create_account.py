import boto3
import os, sys
import json
import logging
from botocore import ClientError

# Setting clients
organizations=boto3.client('organizations')
sts=boto3.client('sts')

# Create a new account
def new_account_create():
    try:
        resp=organizations.create_account(
            Email='string',
            AccountName='string',
            RoleName='string',
            IamUserAccessToBilling='ALLOW'|'DENY'
        )
    except ClientError as e:
        print(e)
    
    logging.info("New AccountId: ",resp['CreateAccountStatus']['AccountId'])