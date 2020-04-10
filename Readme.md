## Create a storage account

## Init terraofrm with subscription_id  

```bash
az login 
export TF_VAR_subscription_id=<YOUR_SUBSCRIPTION_ID>
terraform init -backend-config=storage_account_name=<YOUR_STORAGE_ACCOUNT> -backend-config=container_name=tfstate -backend-config=resource_group_name=remove-spike-rg -backend-config=key=example.tfstate
```

