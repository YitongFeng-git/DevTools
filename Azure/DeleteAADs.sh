```bash
#!/bin/bash

# Log in to Azure
az login

# Get the object ID of the current user
currentUserObjectId=$(az ad signed-in-user show --query id -o tsv)

# Get all app registrations owned by the current user
ownedApps=$(az ad app list --show-mine --query [].appId -o tsv)

for appId in ${ownedApps[@]}; do
    # Delete the app registration
    az ad app delete --id $appId
    echo "Deleted app registration with App ID: $appId"
done

```
