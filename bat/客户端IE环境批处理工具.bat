@echo off

::---------内网地址设置 start 如果不创建将systemName设置为"" -------
set IPaddr=10.62.1.252
set systemName="FE5.5地址内网"
set systemPort=9090
::---------------内网地址设置 end-------------------

::-------外网地址设置 start 如果不创建将systemHostName设置为"" -------
set IPhostaddr=221.4.222.110
set systemHostName="FE5.5外网地址"
set systemHostPort=9090
::----------------外网地址设置 end------------------

set lnkdir="%USERPROFILE%\桌面"
if not exist lnkdir goto no_path
:no_path
    set lnkdir="%USERPROFILE%\Desktop"

cd /d %lnkdir%

if %systemName% == "" goto x1
echo [DEFAULT]>>%systemName%.url
echo BASEURL=http://%IPaddr%:%systemPort%>>%systemName%.url
echo [InternetShortcut]>>%systemName%.url
echo URL=http://%IPaddr%:%systemPort%>>%systemName%.url
echo 创建内网桌面快键成功...
:x1
   echo  不创建本地快捷方式

if %systemHostName% == "" goto x2
echo [DEFAULT]>>%systemHostName%.url
echo BASEURL=http://%IPhostaddr%:%systemHostPort%>>%systemHostName%.url
echo [InternetShortcut]>>%systemHostName%.url
echo URL=http://%IPhostaddr%:%systemHostPort%>>%systemHostName%.url
echo 创建远程桌面快键成功...
:x2
   echo  不创建远程快捷方式

reg add "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\New Windows" /v "PopupMgr"  /d "no" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "DisplayName"  /d "可信站点" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "Description"  /d "该区域包含有您确认不会损坏计算机或数据的网站。" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "Icon"  /d "inetcpl.cpl#00004480" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "CurrentLevel" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "MinLevel" /t "REG_DWORD"  /d "65536" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "RecommendedLevel" /t "REG_DWORD"  /d "65536" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "Flags" /t "REG_DWORD"  /d "67" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2400" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2401" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2402" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2007" /t "REG_DWORD"  /d "10000" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2004" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2001" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2201" /t "REG_DWORD"  /d "3" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1405" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1201" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2000" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "120B" /t "REG_DWORD"  /d "3" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1004" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1001" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2702" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1209" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1208" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1200" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "120A" /t "REG_DWORD"  /d "0" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1402" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1409" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1407" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2105" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2103" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1606" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1806" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "160A" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1607" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2100" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2301" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1809" /t "REG_DWORD"  /d "3" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2101" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1601" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1406" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1802" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1609" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1608" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1206" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2102" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2300" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2104" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1804" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1A04" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1E05" /t "REG_DWORD"  /d "30000" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1800" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2600" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1803" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "2200" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1604" /t "REG_DWORD"  /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "1A00" /t "REG_DWORD"  /d "0" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "SyncMode5" /t "REG_DWORD"  /d 3 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_LOCALMACHINE_LOCKDOWN" /v "explorer.exe" /t "REG_DWORD" /d  "00000000" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_LOCALMACHINE_LOCKDOWN" /v "iexplore.exe" /t "REG_DWORD" /d  "00000000" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\BrowserEmulation" /v "TLDUpdates" /t "REG_DWORD" /d 0 /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\New Windows" /v "PopupMgr" /t REG_SZ /d no /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range111" /v "http" /t "REG_DWORD"  /d "2" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range111" /v ":Range"  /d "%IPaddr%" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range112" /v "http" /t "REG_DWORD"  /d "2" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range112" /v ":Range"  /d "%IPhostaddr%" /f


reg add "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\PageSetup" /v "header"  /d "" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\PageSetup" /v "footer"  /d "" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\PageSetup" /v "margin_bottom"  /d "0.19685" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\PageSetup" /v "margin_left"  /d "0.19685" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\PageSetup" /v "margin_right"  /d "0.19685" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\PageSetup" /v "margin_top"  /d "0.59055" /f

reg add "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main" /v "Disable Script Debugger"  /d "yes" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main" /v "DisableScriptDebuggerIE"  /d "yes" /f



