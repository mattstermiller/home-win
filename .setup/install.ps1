# install apps
choco install firefox
choco install vim
choco install microsoft-windows-terminal
choco install arsclip
choco install autohotkey
choco install nircmd
choco install vlc
choco install irfanview
choco install 7zip
choco install lightshot
#choco install gimp
#choco install screentogif
#choco install steam
#choco install logitech-options-plus
#choco install lghub

# install dev tools
choco install gitkraken
choco install vscode
choco install dotnet-sdk
choco install visualstudio2019-workload-manageddesktopbuildtools

# vim setup
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni $HOME/vimfiles/autoload/plug.vim -Force
vim +PlugInstall +qall
mkdir ..\vimfiles\swap

# copy nuget.config since SDK does not create it
mkdir ..\AppData\Roaming\NuGet\
copy .\resources\NuGet.Config ..\AppData\Roaming\NuGet\

# add pins for apps that auto-update
choco pin add -n firefox
choco pin add -n gitkraken
choco pin add -n kb2533623
choco pin add -n lghub
choco pin add -n logitech-options-plus
choco pin add -n microsoft-windows-terminal
choco pin add -n steam
choco pin add -n vcredist140
choco pin add -n vscode
choco pin add -n vscode.install

# generate shims
& "$env:ChocolateyInstall\tools\shimgen.exe" -p "$env:ChocolateyInstall\tools\shimgen.exe" -o "$env:ChocolateyInstall\bin\shimgen.exe"
shimgen -p "C:\Program Files\Git\git-bash.exe" -o "$env:ChocolateyInstall\bin\git-bash.exe"

# system settings
& "$env:userprofile\.ahk\hotkeys.ahk"
nircmd shortcut "$env:userprofile\.ahk\hotkeys.ahk" '~$folder.startup$' "Hotkeys"
$startMenu = "$env:userprofile\AppData\Roaming\Microsoft\Windows\Start Menu\Programs"
copy "$startMenu\ArsClip.lnk" "$startMenu\Startup"

REGEDIT /S .\resources\disable-caps-lock_map-scroll-lock-to-caps-lock.reg
REGEDIT /S .\resources\disable-web-search-in-start-menu-and-explorer.reg
REGEDIT /S .\resources\disable-login-blur.reg

