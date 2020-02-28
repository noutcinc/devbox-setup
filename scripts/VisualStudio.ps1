#--- Visual Studio ---
choco install visualstudio2019professional -y --package-parameters "--add Microsoft.VisualStudio.Component.Git" 
Update-SessionEnvironment #refreshing env due to Git install

choco install -y visualstudio2019buildtools
choco install -y visualstudio2019-workload-azure
choco install -y visualstudio2019-workload-universal
choco install -y visualstudio2019-workload-manageddesktop
choco install -y visualstudio2019-workload-nativedesktop
choco install -y visualstudio2019-workload-vctools
choco install -y visualstudio2019-workload-netcoretools
choco install -y visualstudio2019-workload-visualstudioextension 

#--- Visual Studio extensions ---
choco install -y gitdiffmargin
choco install -y resharper-ultimate-all --package-parameters="'/NoCpp'"

#--- Install Windows Template Studio VSIX
$requestUri = "https://marketplace.visualstudio.com/_apis/public/gallery/extensionquery";
$requestBody = '{"flags":"262","filters":[{"criteria":[{"filterType":"10","value":"windows template studio"}],"sortBy":"0","sortOrder":"2","pageSize":"25","pageNumber":"1"}]}';
$requestHeaders = New-Object "System.Collections.Generic.Dictionary[[String],[String]]";
$requestHeaders.Add('Accept','application/json; api-version=3.2-preview.1');
$requestHeaders.Add('Content-Type','application/json; charset=utf-8');

$results = Invoke-WebRequest -Uri $requestUri -Method POST -Headers $requestHeaders -Body $requestBody -UseBasicParsing;

$jsonResults = $results.Content | ConvertFrom-Json;
$wtsResults = $jsonResults.results[0].extensions | Where-Object {$_.extensionName -eq "WindowsTemplateStudio"} ;
$wtsFileUrl = $wtsResults.versions[0].files | Where-Object {$_.assetType -eq "Microsoft.Templates.vsix"};

$wtsVsix = [System.IO.Path]::GetFileName($wtsFileUrl.source);
$wtsFullPath = [System.IO.Path]::Combine((Resolve-Path $env:USERPROFILE).path, $wtsVsix);

Invoke-WebRequest -Uri $wtsFileUrl.source -OutFile $wtsFullPath;

$vsixInstallerFile = Get-Childitem -Include vsixinstaller.exe -Recurse -Path "C:\Program Files (x86)\Microsoft Visual Studio\2019\";
$wtsArgList = "/quiet `"$wtsFullPath`"";

$vsixInstallerResult = Start-Process -FilePath $vsixInstallerFile.FullName -ArgumentList $wtsArgList -Wait -PassThru;

Remove-Item $wtsFullPath
#--- End Install Windows Template Studio VSIX