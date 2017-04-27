@echo off
setlocal enabledelayedexpansion
title 虚拟Wi-Fi设置工具v1.1
color 0A
mode con: cols=50 lines=25


cls::清屏
call :admintest::检查是否是管理员身份运行
call :vercheck::检查当前系统是否是Win7或Win8


:menu
set Line===================================================
echo %Line%
echo 	提示：第一次运行本工具请按"B"创建密码
echo.
echo		[A]	查看虚拟Wi-Fi信息（即承载网络）
echo		[B]	创建或修改虚拟Wi-Fi名称和密码
echo		[C]	启动虚拟Wi-Fi
echo		[D]	关闭虚拟Wi-Fi
echo		[E]	彻底禁用虚拟Wi-Fi
echo		[F]	关于
echo.
echo		[X]	退出
echo %Line%


choice /c ABCDEFX /M 请选择
if %errorlevel%==1 (netsh wlan show hostednetwork)
if %errorlevel%==2 call :update
if %errorlevel%==3 (netsh wlan start hostednetwork)
if %errorlevel%==4 (netsh wlan stop hostednetwork)
if %errorlevel%==5 (netsh wlan set hostednetwork mode=disallow)
if %errorlevel%==6 call:about
if %errorlevel%==7 exit
goto :menu


:update::修改名称和密码
echo 请输入虚拟Wi-Fi的名称:
set /p ssid=%=%
echo 请输入你想设置的密码(至少8位)：
set /p key=%=%
netsh wlan set hostednetwork mode=allow ssid=%ssid% key=%key%
goto :EOF

:admintest::测试是否是以管理员身份运行
set rnd=_%random%
md %windir%\%rnd% >nul 2>nul
if %errorlevel%==1 (echo.&echo 请右键本文件，选择“以管理员身份运行”。&echo.&echo 您可以按任意键退出……&pause>nul 2>nul &exit)
rd /q %windir%\%rnd%
goto :EOF

:vercheck::系统版本检查
ver | find "6.1" >nul 2>nul && (echo 您的当前系统是Win7，符合要求！&echo.&goto :EOF)
ver | find "6.2" >nul 2>nul && (echo 您的当前系统是Win8，符合要求！&echo.&goto :EOF)
ver | find "6.3" >nul 2>nul && (echo 您的当前系统是Win8.1，符合要求！&echo.&goto :EOF)
ver | find "10.0" >nul 2>nul && (echo 您的当前系统是Win10，符合要求！&echo.&goto :EOF)
echo.&echo 抱歉，本批处理只能在Win7或更高版本系统中使用！
echo.&echo 请按任意键退出吧……
pause>nul
exit


:about::关于
echo.
echo 【虚拟WiFi设置工具】
echo 作者：柳夏南
echo 微博：http://weibo.com/liuxianan
echo 官网：http://liuxianan.com
echo 创建日期：2013年2月11日
echo 最后修改：2017年4月27日
echo.
goto :EOF


