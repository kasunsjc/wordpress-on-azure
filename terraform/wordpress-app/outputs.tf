output "resource_group" {
	value = {
		name = azurerm_resource_group.wordpress.name
		id = azurerm_resource_group.wordpress.id
		location = azurerm_resource_group.wordpress.location
	}
}

output "app_service" {
  value = {
    name     		 = azurerm_app_service.app.name
    hostname     = azurerm_app_service.app.default_site_hostname
    outbound_ips = azurerm_app_service.app.outbound_ip_addresses
    # selected site_config only
    site_config  = {
      always_on          = azurerm_app_service.app.site_config[0].always_on
      app_command_line   = azurerm_app_service.app.site_config[0].app_command_line
      cors               = azurerm_app_service.app.site_config[0].cors
      ftps_state         = azurerm_app_service.app.site_config[0].ftps_state
      linux_fx_version   = azurerm_app_service.app.site_config[0].linux_fx_version
      min_tls_version    = azurerm_app_service.app.site_config[0].min_tls_version
      scm_type           = azurerm_app_service.app.site_config[0].scm_type

    }
  }
}

output "azure_container_registry" {
	value = azurerm_container_registry.acr.login_server
}

output "mysql" {
	value = {
		host = azurerm_mysql_server.wordpress.fqdn
		username = azurerm_mysql_server.wordpress.administrator_login
		db_name = azurerm_mysql_database.wordpress.name
	}
}

output "assets_storage_account" {
  value = {
		name = azurerm_storage_account.assets.name
		location = azurerm_storage_account.assets.location
	}
}