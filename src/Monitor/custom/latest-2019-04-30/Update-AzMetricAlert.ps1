function Update-AzMetricAlert {
[OutputType('Microsoft.Azure.PowerShell.Cmdlets.Monitor.Models.Api20180301.IMetricAlertResource')]
[CmdletBinding(DefaultParameterSetName='UpdateExpanded', PositionalBinding=$false, SupportsShouldProcess, ConfirmImpact='Medium')]
[Microsoft.Azure.PowerShell.Cmdlets.Monitor.Profile('latest-2019-04-30')]
[Microsoft.Azure.PowerShell.Cmdlets.Monitor.Description('Update an metric alert definition.')]
param(
    [Parameter(ParameterSetName='UpdateExpanded', Mandatory, HelpMessage='The name of the rule.')]
    [Parameter(ParameterSetName='UpdateExpandedByResourceId', Mandatory, HelpMessage='The name of the rule.')]
    [Parameter(ParameterSetName='UpdateExpandedByScope', Mandatory, HelpMessage='The name of the rule.')]
    [Microsoft.Azure.PowerShell.Cmdlets.Monitor.Category('Path')]
    [Microsoft.Azure.PowerShell.Cmdlets.Monitor.Runtime.Info(SerializedName='ruleName', Required, PossibleTypes=([System.String]), Description='The name of the rule.')]
    [System.String]
    # The name of the rule.
    ${Name},

    [Parameter(ParameterSetName='UpdateExpanded', Mandatory, HelpMessage='The name of the resource group.')]
    [Parameter(ParameterSetName='UpdateExpandedByResourceId', Mandatory, HelpMessage='The name of the resource group.')]
    [Parameter(ParameterSetName='UpdateExpandedByScope', Mandatory, HelpMessage='The name of the resource group.')]
    [Microsoft.Azure.PowerShell.Cmdlets.Monitor.Category('Path')]
    [Microsoft.Azure.PowerShell.Cmdlets.Monitor.Runtime.Info(SerializedName='resourceGroupName', Required, PossibleTypes=([System.String]), Description='The name of the resource group.')]
    [System.String]
    # The name of the resource group.
    ${ResourceGroupName},

    [Parameter(ParameterSetName='UpdateExpanded', Mandatory, HelpMessage='The Azure subscription Id.')]
    [Parameter(ParameterSetName='UpdateExpandedByResourceId', Mandatory, HelpMessage='The Azure subscription Id.')]
    [Parameter(ParameterSetName='UpdateExpandedByScope', Mandatory, HelpMessage='The Azure subscription Id.')]
    [Microsoft.Azure.PowerShell.Cmdlets.Monitor.Category('Path')]
    [Microsoft.Azure.PowerShell.Cmdlets.Monitor.Runtime.Info(SerializedName='subscriptionId', Required, PossibleTypes=([System.String]), Description='The Azure subscription Id.')]
    [Microsoft.Azure.PowerShell.Cmdlets.Monitor.Runtime.DefaultInfo(Script='(Get-AzContext).Subscription.Id')]
    [System.String]
    # The Azure subscription Id.
    ${SubscriptionId},

    [Parameter(ParameterSetName='UpdateViaIdentityExpanded', Mandatory, ValueFromPipeline, HelpMessage='Identity Parameter')]
    [Parameter(ParameterSetName='UpdateViaIdentityExpandedByResourceId', Mandatory, ValueFromPipeline, HelpMessage='Identity Parameter')]
    [Parameter(ParameterSetName='UpdateViaIdentityExpandedByScope', Mandatory, ValueFromPipeline, HelpMessage='Identity Parameter')]
    [Microsoft.Azure.PowerShell.Cmdlets.Monitor.Category('Path')]
    [Microsoft.Azure.PowerShell.Cmdlets.Monitor.Models.IMonitorIdentity]
    # Identity Parameter
    ${InputObject},

    [Parameter(HelpMessage='the array of actions that are performed when the alert rule becomes active, and when an alert condition is resolved. To construct, see NOTES section for ACTION properties and create a hash table.')]
    [Microsoft.Azure.PowerShell.Cmdlets.Monitor.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.Monitor.Runtime.Info(SerializedName='actions', PossibleTypes=([Microsoft.Azure.PowerShell.Cmdlets.Monitor.Models.Api20180301.IMetricAlertAction]), Description='the array of actions that are performed when the alert rule becomes active, and when an alert condition is resolved.')]
    [Microsoft.Azure.PowerShell.Cmdlets.Monitor.Models.Api20180301.IMetricAlertAction[]]
    # the array of actions that are performed when the alert rule becomes active, and when an alert condition is resolved.
    # To construct, see NOTES section for ACTION properties and create a hash table.
    ${Action},

    [Parameter(HelpMessage='the flag that indicates whether the alert should be auto resolved or not.')]
    [Microsoft.Azure.PowerShell.Cmdlets.Monitor.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.Monitor.Runtime.Info(SerializedName='autoMitigate', PossibleTypes=([System.Management.Automation.SwitchParameter]), Description='the flag that indicates whether the alert should be auto resolved or not.')]
    [System.Management.Automation.SwitchParameter]
    # the flag that indicates whether the alert should be auto resolved or not.
    ${AutoMitigate},

    #[Parameter(HelpMessage='defines the specific alert criteria information. To construct, see NOTES section for CRITERION properties and create a hash table.')]
    #[Microsoft.Azure.PowerShell.Cmdlets.Monitor.Category('Body')]
    #[Microsoft.Azure.PowerShell.Cmdlets.Monitor.Runtime.Info(SerializedName='criteria', PossibleTypes=([Microsoft.Azure.PowerShell.Cmdlets.Monitor.Models.Api20180301.IMetricAlertCriteria]), Description='defines the specific alert criteria information.')]
    #[Microsoft.Azure.PowerShell.Cmdlets.Monitor.Models.Api20180301.IMetricAlertCriteria]
    ## defines the specific alert criteria information.
    ## To construct, see NOTES section for CRITERION properties and create a hash table.
    #${Criterion},

    # CUSTOM
    [Parameter(ParameterSetName="UpdateExpandedByResourceId", Mandatory, HelpMessage='The rule criteria that defines the conditions of the alert rule.')]
    [Parameter(ParameterSetName="UpdateExpandedByScope", Mandatory, HelpMessage='The rule criteria that defines the conditions of the alert rule.')]
    [Parameter(ParameterSetName="UpdateViaIdentityExpandedByResourceId", Mandatory, HelpMessage='The rule criteria that defines the conditions of the alert rule.')]
    [Parameter(ParameterSetName="UpdateViaIdentityExpandedByScope", Mandatory, HelpMessage='The rule criteria that defines the conditions of the alert rule.')]
    [Microsoft.Azure.PowerShell.Cmdlets.Monitor.Models.Api20180301.MetricCriteria[]]
    [Microsoft.Azure.PowerShell.Cmdlets.Monitor.Runtime.Info(Required, PossibleTypes=([Microsoft.Azure.PowerShell.Cmdlets.Monitor.Models.Api20180301.MetricCriteria]), Description='The rule criteria that defines the conditions of the alert rule.')]
    ${Condition},
    # END CUSTOM

    [Parameter(HelpMessage='the description of the metric alert that will be included in the alert email.')]
    [Microsoft.Azure.PowerShell.Cmdlets.Monitor.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.Monitor.Runtime.Info(SerializedName='description', PossibleTypes=([System.String]), Description='the description of the metric alert that will be included in the alert email.')]
    [System.String]
    # the description of the metric alert that will be included in the alert email.
    ${Description},

    [Parameter(HelpMessage='the flag that indicates whether the metric alert is enabled.')]
    [Microsoft.Azure.PowerShell.Cmdlets.Monitor.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.Monitor.Runtime.Info(SerializedName='enabled', PossibleTypes=([System.Management.Automation.SwitchParameter]), Description='the flag that indicates whether the metric alert is enabled.')]
    [System.Management.Automation.SwitchParameter]
    # the flag that indicates whether the metric alert is enabled.
    ${Enabled},

    [Parameter(HelpMessage='how often the metric alert is evaluated represented in ISO 8601 duration format.')]
    [Microsoft.Azure.PowerShell.Cmdlets.Monitor.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.Monitor.Runtime.Info(SerializedName='evaluationFrequency', PossibleTypes=([System.TimeSpan]), Description='how often the metric alert is evaluated represented in ISO 8601 duration format.')]
    [System.TimeSpan]
    # how often the metric alert is evaluated represented in ISO 8601 duration format.
    ${EvaluationFrequency},

    #[Parameter(HelpMessage='the list of resource id''s that this metric alert is scoped to.')]
    #[Microsoft.Azure.PowerShell.Cmdlets.Monitor.Category('Body')]
    #[Microsoft.Azure.PowerShell.Cmdlets.Monitor.Runtime.Info(SerializedName='scopes', PossibleTypes=([System.String]), Description='the list of resource id''s that this metric alert is scoped to.')]
    #[System.String[]]
    ## the list of resource id's that this metric alert is scoped to.
    #${Scope},

    [Parameter(HelpMessage='Alert severity {0, 1, 2, 3, 4}')]
    [Microsoft.Azure.PowerShell.Cmdlets.Monitor.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.Monitor.Runtime.Info(SerializedName='severity', PossibleTypes=([System.Int32]), Description='Alert severity {0, 1, 2, 3, 4}')]
    [System.Int32]
    # Alert severity {0, 1, 2, 3, 4}
    ${Severity},

    [Parameter(HelpMessage='Resource tags')]
    [Microsoft.Azure.PowerShell.Cmdlets.Monitor.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.Monitor.Runtime.Info(SerializedName='tags', PossibleTypes=([Microsoft.Azure.PowerShell.Cmdlets.Monitor.Models.Api20180301.IMetricAlertResourcePatchTags]), Description='Resource tags')]
    [System.Collections.Hashtable]
    # Resource tags
    ${Tag},

    # CUSTOM
    [Parameter(ParameterSetName='UpdateExpandedByResourceId', Mandatory, HelpMessage='the target resource id for rule.')]
    [Parameter(ParameterSetName='UpdateViaIdentityExpandedByResourceId', Mandatory, HelpMessage='the target resource id for rule.')]
    [System.String]
    ${TargetResourceId},

    [Parameter(ParameterSetName='UpdateExpandedByScope', Mandatory, HelpMessage='the list of resource id''s that this metric alert is scoped to.')]
    [Parameter(ParameterSetName='UpdateViaIdentityExpandedByScope', Mandatory, HelpMessage='the list of resource id''s that this metric alert is scoped to.')]
    [System.String[]]
    # the list of resource id's that this metric alert is scoped to.
    ${TargetResourceScope},

    [Parameter(ParameterSetName='UpdateExpandedByScope', Mandatory, HelpMessage='the region of the target resource(s) on which the alert is created/updated.')]
    [Parameter(ParameterSetName='UpdateViaIdentityExpandedByScope', Mandatory, HelpMessage='the region of the target resource(s) on which the alert is created/updated.')]
    [Microsoft.Azure.PowerShell.Cmdlets.Monitor.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.Monitor.Runtime.Info(SerializedName='targetResourceRegion', PossibleTypes=([System.String]), Description='the region of the target resource(s) on which the alert is created/updated. Mandatory for MultipleResourceMultipleMetricCriteria.')]
    [System.String]
    # the region of the target resource(s) on which the alert is created/updated. Mandatory for MultipleResourceMultipleMetricCriteria.
    ${TargetResourceRegion},

    [Parameter(ParameterSetName='UpdateExpandedByScope', Mandatory, HelpMessage='the resource type of the target resource(s) on which the alert is created/updated.')]
    [Parameter(ParameterSetName='UpdateViaIdentityExpandedByScope', Mandatory, HelpMessage='the resource type of the target resource(s) on which the alert is created/updated.')]
    [Microsoft.Azure.PowerShell.Cmdlets.Monitor.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.Monitor.Runtime.Info(SerializedName='targetResourceType', PossibleTypes=([System.String]), Description='the resource type of the target resource(s) on which the alert is created/updated. Mandatory for MultipleResourceMultipleMetricCriteria.')]
    [System.String]
    # the resource type of the target resource(s) on which the alert is created/updated. Mandatory for MultipleResourceMultipleMetricCriteria.
    ${TargetResourceType},
    # END CUSTOM

    [Parameter(HelpMessage='the period of time (in ISO 8601 duration format) that is used to monitor alert activity based on the threshold.')]
    [Microsoft.Azure.PowerShell.Cmdlets.Monitor.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.Monitor.Runtime.Info(SerializedName='windowSize', PossibleTypes=([System.TimeSpan]), Description='the period of time (in ISO 8601 duration format) that is used to monitor alert activity based on the threshold.')]
    [System.TimeSpan]
    # the period of time (in ISO 8601 duration format) that is used to monitor alert activity based on the threshold.
    ${WindowSize},

    [Parameter(HelpMessage='The credentials, account, tenant, and subscription used for communication with Azure.')]
    [Alias('AzureRMContext', 'AzureCredential')]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.Monitor.Category('Azure')]
    [System.Management.Automation.PSObject]
    # The credentials, account, tenant, and subscription used for communication with Azure.
    ${DefaultProfile},

    [Parameter(DontShow, HelpMessage='Wait for .NET debugger to attach')]
    [Microsoft.Azure.PowerShell.Cmdlets.Monitor.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Wait for .NET debugger to attach
    ${Break},

    [Parameter(DontShow, HelpMessage='SendAsync Pipeline Steps to be appended to the front of the pipeline')]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.Monitor.Category('Runtime')]
    [Microsoft.Azure.PowerShell.Cmdlets.Monitor.Runtime.SendAsyncStep[]]
    # SendAsync Pipeline Steps to be appended to the front of the pipeline
    ${HttpPipelineAppend},

    [Parameter(DontShow, HelpMessage='SendAsync Pipeline Steps to be prepended to the front of the pipeline')]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.Monitor.Category('Runtime')]
    [Microsoft.Azure.PowerShell.Cmdlets.Monitor.Runtime.SendAsyncStep[]]
    # SendAsync Pipeline Steps to be prepended to the front of the pipeline
    ${HttpPipelinePrepend},

    [Parameter(DontShow, HelpMessage='The URI for the proxy server to use')]
    [Microsoft.Azure.PowerShell.Cmdlets.Monitor.Category('Runtime')]
    [System.Uri]
    # The URI for the proxy server to use
    ${Proxy},

    [Parameter(DontShow, HelpMessage='Credentials for a proxy server to use for the remote call')]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.Monitor.Category('Runtime')]
    [System.Management.Automation.PSCredential]
    # Credentials for a proxy server to use for the remote call
    ${ProxyCredential},

    [Parameter(DontShow, HelpMessage='Use the default credentials for the proxy')]
    [Microsoft.Azure.PowerShell.Cmdlets.Monitor.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Use the default credentials for the proxy
    ${ProxyUseDefaultCredentials}
)

process {
    if ($PSBoundParameters.ContainsKey("TargetResourceId")) {
        $PSBoundParameters["Scope"] = $PSBoundParameters["TargetResourceId"]
        $null = $PSBoundParameters.Remove("TargetResourceId")
        $PSBoundParameters["Criterion"] = @{allOf=$PSBoundParameters["Condition"]; odatatype="Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria"}
    } elseif ($PSBoundParameters.ContainsKey("TargetResourceScope")) {
        $PSBoundParameters["Scope"] = $PSBoundParameters["TargetResourceScope"]
        $null = $PSBoundParameters.Remove("TargetResourceScope")
        $PSBoundParameters["Criterion"] = @{allOf=$PSBoundParameters["Condition"]; odatatype="Microsoft.Azure.Monitor.MultipleResourceMultipleMetricCriteria"}
    }

    $null = $PSBoundParameters.Remove("Condition")

    Az.Monitor.internal\Update-AzMetricAlert @PSBoundParameters
}

}
