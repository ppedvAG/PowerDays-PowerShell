Configuration dynamicServerConfig
{
    Node $AllNodes.NodeName
    {
        Foreach($Feature in $Node.WindowsFeatures)
        {
            WindowsFeature $Feature.Name
            {
                Name= $Feature.Name
                Ensure = $Feature.Ensure
            }
        }
    }
}

dynamicServerConfig -OutputPath C:\KursExamples\07-DSC\dynamic -ConfigurationData C:\KursExamples\07-DSC\dynamic\dsc.psd1 

Start-DscConfiguration -Wait -Verbose -Path C:\KursExamples\07-DSC\dynamic 
