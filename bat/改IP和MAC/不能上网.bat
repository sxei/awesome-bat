@echo off
set IP=172.16.4.98
set MAC=782BCB925FA7
set NAME=本地连接

::延迟环境变量扩展
setlocal enabledelayedexpansion
title 快速修改IP和MAC地址工具(by刘显安)
color 0A
::mode con: cols=50 lines=25


echo 快速修改IP和MAC地址工具(v20150226)
echo 请确认以下信息：
echo 1、请根据实际情况修改你的网卡名称，如“本地连接”“以太网”；
echo 2、请根据实际情况提前用记事本打开修改好IP地址和MAC地址再运行；
echo 3、目标IP：%IP%
echo 4、目标MAC：%MAC%
pause

echo 正在设置IP、DNS等 ...

::修改IP、子网掩码和网关
netsh interface ip set address "%NAME%" source=static addr=%IP% mask=255.255.0.0 gateway=172.16.0.1 gwmetric=1


::首选DNS和备用DNS
::netsh interface ip set dns "%NAME%" source=static addr=202.96.134.133 register=primary
::netsh interface ip add dns "%NAME%" addr=8.8.4.4 index=2
::netsh interface ip set wins "%NAME%" source=static addr=none

echo IP、DNS设置完毕!

echo 正在设置MAC地址 ...

::0表示第0个网卡，请根据实际情况修改
::改MAC地址，调用smac_v1.2.exe，但是只有1.0版本支持命令行调用，故作废
::"%~dp0tools\smac.exe" -ModifyMAC 0 %MAC%

::使用macshift.exe这个工具修改MAC地址
"%~dp0tools\macshift.exe" %MAC% -i "%NAME%"

echo MAC地址设置完毕!


echo 正在重启本地连接(xp系统下貌似没用)
netsh interface set interface "%NAME%" disable
netsh interface set interface "%NAME%" enable
echo 本地连接重启完毕！


echo 全部设置完毕!
echo 如果还没有生效请尝试禁用并启用一下本地连接。
pause