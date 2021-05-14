Configuration SimpleWebServerConfig
{
    Node "Member1"
    {
        WindowsFeature WebServerRolle
        {
            Name = "Web-Server"
            Ensure = "Present"
        }
        WindowsFeature ManagementTools
        {
            Name = "web-Mgmt-Tools"
            Ensure = "Present"
        }

    }
}
#Erzeugen der Mof dateien
SimpleWebServerConfig -OutputPath C:\KursExamples\07-DSC\simple

#Anwenden der Konfiguration
Start-DscConfiguration -Wait -Verbose -Path C:\KursExamples\07-DSC\simple

