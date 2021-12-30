param keyVaultName string
param keyVaultlocation string
param softDeleteRetentionInDays int = 90
param enabledForDiskEncryption bool = true
param enabledForDeployment bool = true
param enabledForTemplateDeployment bool = true
param enableSoftDelete bool = true

resource keyvault 'Microsoft.KeyVault/vaults@2021-06-01-preview' = {
  name: keyVaultName
  location: keyVaultlocation
  properties: {
    tenantId: tenant().tenantId
    sku: {
      family: 'A'
      name: 'standard'
    }
    accessPolicies: []
    enabledForDeployment: enabledForDeployment
    enabledForDiskEncryption: enabledForDiskEncryption
    enabledForTemplateDeployment: enabledForTemplateDeployment
    enableSoftDelete: enableSoftDelete
    softDeleteRetentionInDays: softDeleteRetentionInDays    
  }
}

output keyvault string = keyvault.properties.vaultUri
