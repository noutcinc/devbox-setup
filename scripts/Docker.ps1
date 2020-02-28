Enable-WindowsOptionalFeature -Online -FeatureName containers -All
RefreshEnv
choco install -y docker-desktop
choco install -y vscode-docker
choco install -y docker-kitematic