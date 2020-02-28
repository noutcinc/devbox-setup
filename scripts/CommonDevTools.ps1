# tools we expect devs across many scenarios will want
choco install -y nodejs
choco install -y vscode
choco install -y git --package-parameters="'/GitAndUnixToolsOnPath /WindowsTerminal'"
choco install -y git-credential-winstore
choco install -y python
choco install -y python2
choco install -y sysinternals
choco install -y npppluginmanager
choco install -y gitkraken
choco install -y sql-server-management-studio
choco install -y dotnetcore-sdk
choco install -y androidstudio
choco install -y awscli
choco install -y cyberduck
choco install -y linqpad
choco install -y postman
choco install -y fiddler
choco install -y putty
choco install -y nvm
choco install -y yarn

choco install -y cascadiacode
choco install -y jetbrainstoolbox
choco install -y poshgit
choco install -y dotpeek
choco install -y kdiff3
choco install -y SourceTree
choco install -y FiraCode
choco install -y ngrok.portable
choco install -y winscp
choco install -y rapidee
choco install -y snoop

Install-Module -Force oh-my-posh

code --install-extension msjsdiag.debugger-for-chrome
code --install-extension msjsdiag.debugger-for-edge

#--- Microsoft WebDriver ---
choco install -y microsoftwebdriver