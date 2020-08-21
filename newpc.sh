#!/bin/sh

# Colorize

# Set the colours you can use
black=$(tput setaf 0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
white=$(tput setaf 7)

# Resets the style
reset=`tput sgr0`

# Color-echo. Improved. [Thanks @joaocunha]
# arg $1 = message
# arg $2 = Color
cecho() {
  echo "${2}${1}${reset}"
  return
}

echo ""
cecho "###############################################" $red
cecho "#        DO NOT RUN THIS SCRIPT BLINDLY       #" $red
cecho "#         YOU'LL PROBABLY REGRET IT...        #" $red
cecho "#                                             #" $red
cecho "#              READ IT THOROUGHLY             #" $red
cecho "#         AND EDIT TO SUIT YOUR NEEDS         #" $red
cecho "###############################################" $red
echo ""

# Set continue to false by default.
CONTINUE=false

echo ""
cecho "Have you read through the script you're about to run and " $red
cecho "会修改你的系统设置? (y/n)" $red
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  CONTINUE=true
fi

if ! $CONTINUE; then
  # Check if we're continuing and output a message if not
  cecho "Please go read the script, it only takes a few minutes" $red
  exit
fi

# Here we go.. ask for the administrator password upfront and run a
# keep-alive to update existing `sudo` time stamp until script has finished
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &






#############################################
### 系统设置 https://github.com/742481030/osx/newpc.sh
#############################################

#
osascript -e 'tell application "System Preferences" to quit'
defaults write NSGlobalDomain com.apple.swipescrolldirection 0

#开启未知来源
sudo spctl --master-disable



##################
#设置dns
##################
networksetup -setdnsservers Wi-Fi 223.5.5.5 114.114.114.114 8.8.8.8 2400:3200::1 2001:4860:4860::8888
networksetup -setdnsservers Ethernet  223.5.5.5 114.114.114.114 8.8.8.8 2400:3200::1 2001:4860:4860::8888
networksetup -setdnsservers PPPoe  223.5.5.5 114.114.114.114 8.8.8.8 2400:3200::1 2001:4860:4860::8888

#在登录界面,单击时钟时显示IP地址，主机名，操作系统版本等
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

#禁用通知中心并删除菜单栏图标
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

##################
### Finder, Dock, & Menu Items
##################
#回收站不提示
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Finder: 增加退出菜单
defaults write com.apple.finder QuitMenuItem -bool true

#显示文件扩展名
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# 不保存文件到icloud
#defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Finder: 显示所有文件扩展名
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
#显示资源库
chflags nohidden ~/Library

#自动隐藏Dock
#defaults write com.apple.dock autohide -bool true

#只显示打开到应用程序  
#defaults write com.apple.dock static-only -bool true

#显示文件完整路径
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# 关闭修改文件扩展名称警告
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# 打印完成自动退出
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# 禁用“确定要打开此应用程序吗？” 对话框。
defaults write com.apple.LaunchServices LSQuarantine -bool false

# 不在网络和移动存储未知创建 .DS_Store 文件
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# 设置访达文件列表样式
# 其他样式 `icnv`, `clmv`, `Flwv`
#defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# 最小化应用程序到图标
defaults write com.apple.dock minimize-to-application -bool true

# 自动显示dock
#defaults write com.apple.dock autohide -bool true

# 不要在Dock中显示最近打开的最应用程序
    defaults write com.apple.dock show-recents -bool false


#禁用磁盘映像验证

#禁用磁盘映像验证

defaults write com.apple.frameworks.diskimages skip-verify -bool true

defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true

defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true
##################
### 文本键盘设置
##################

# 关闭自动补全
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Use function F1, F, etc keys as standard function keys
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool true


###############################################################################
# 截图设置                                                       #
###############################################################################

# Require password immediately after sleep or screen saver begins"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "$HOME/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

###############################################################################
# Address Book, Dashboard, iCal, TextEdit, and Disk Utility                   #
###############################################################################

# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0


###############################################################################
# 触控板鼠标设置                #
###############################################################################

# 关闭滚轮
 defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false




# 鼠标设置
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse.plist MouseOneFingerDoubleTapGesture -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse.plist MouseTwoFingerDoubleTapGesture -int 3
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse.plist MouseTwoFingerHorizSwipeGesture -int 2
defaults write ~/Library/Preferences/.GlobalPreferences.plist com.apple.mouse.scaling -float 3
defaults write ~/Library/Preferences/.GlobalPreferences.plist com.apple.swipescrolldirection -boolean NO


###############################################################################
# Mac App Store                                                               #
###############################################################################

# 关闭应用商店自动更新
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# 后台下载可用更新
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

# 安装系统数据文件和安全更新
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

###############################################################################
# Google Chrome                                                               #
###############################################################################

# Disable the all too sensitive backswipe on trackpads
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false



 #关闭系统设置面板
 sleep 5
 echo "会弹出系统授权请全部同意"
exec osascript <<EOF
      tell application "System Events"
	tell application "System Preferences"
		activate
		set current pane to pane "com.apple.preference.mouse"
	end tell
	delay 0.5
	tell process "System Preferences" to tell window 1 to tell checkbox 1
		if value is 1 then click
	end tell
	tell application "System Preferences" to quit
end tell

EOF

  sudo languagesetup
  
