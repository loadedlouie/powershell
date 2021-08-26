workflow NomeDoWorkFlow
{

param ( 
    [Parameter (Mandatory = $false)]
    [object]$WebhookData
)

$RequestBody = (ConvertFrom-JSON $WebhookData.RequestBody)
#$Link = $RequestBody.data.LinkToSearchResults

#Alertas CustomLog Searches
$AlertT1 = $RequestBody.data.essentials.monitoringService
#Alertas do tipo Metrica
$AlertT2 = $RequestBody.data.version


if ($AlertT1 -eq 'Log Alerts V2'){
    $AlertName = $RequestBody.data.essentials.alertRule
    }
elseif ($AlertT2 -eq '2.0')
    {
    $AlertName = $RequestBody.data.context.name
    }
else 
    {
    $AlertName = $RequestBody.data.AlertRuleName
    }



$Description = $RequestBody.data.Description

$control = 0


####Entradas Geradas Automaticamente Pela Query Azure Graph ####
####Entradas Geradas Automaticamente Pela Query Azure Graph ####
#### ####CAMonitor-SmartPin-AR-AppService-AverageResponseTime########################################################################### 


####Entradas Geradas Automaticamente Pela Query Azure Graph ACIMA DESTA LINHA ####
####Entradas Geradas Automaticamente Pela Query Azure Graph ACIMA DESTA LINHA ####
#####################################Control Check##############################################################################
elseif ( $control -ne 1)
{
 Write-EventLog –LogName CA.OMS.Applications –Source "SOURCENAME" –EntryType Error –EventID 9999 –Message "$AlertName"
}

}
