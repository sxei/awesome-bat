@echo off
setlocal enabledelayedexpansion
title 去除或恢复桌面快捷方式小箭头工具(by刘显安)
color 0A
mode con: cols=50 lines=25


cls::清屏
call :admintest::检查是否是管理员身份运行
call :vercheck::检查当前系统是否是Win7或Win8


:menu
set Line===================================================
echo %Line%
echo 	提示：本工具同时支持XP、Win7、Win8系统
echo.
echo		[A]	去除箭头
echo		[B]	恢复箭头
echo		[C]	关于
echo.
echo		[X]	退出
echo %Line%


choice /c ABCX /M 请选择
if %errorlevel%==1 call :remove
if %errorlevel%==2 call :add
if %errorlevel%==3 call :about
if %errorlevel%==4 exit
goto :menu

:remove
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 29 /d "%systemroot%\system32\%value%" /t reg_sz /f
taskkill /f /im explorer.exe
start explorer
goto :EOF


:add
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 29 /f
taskkill /f /im explorer.exe
start explorer
goto :EOF


:admintest::测试是否是以管理员身份运行
set rnd=_%random%
md %windir%\%rnd% >nul 2>nul
if %errorlevel%==1 (echo.&echo 请右键本文件，选择“以管理员身份运行”。&echo.&echo 您可以按任意键退出……&pause>nul 2>nul &exit)
rd /q %windir%\%rnd%
goto :EOF


:vercheck::系统版本检查
ver | find "5.1" >nul 2>nul && (echo 您的当前系统是WinXP，符合要求！&set value=shell32.dll,49&echo.&goto :EOF)
ver | find "6.1" >nul 2>nul && (echo 您的当前系统是Win7，符合要求！&set value=imageres.dll,196&echo.&goto :EOF)
ver | find "6.2" >nul 2>nul && (echo 您的当前系统是Win8，符合要求！&set value=imageres.dll,197&echo.&goto :EOF)
ver | find "6.3" >nul 2>nul && (echo 您的当前系统是Win8.1，符合要求！&set value=imageres.dll,197&echo.&goto :EOF)
echo.&echo 抱歉，本批处理只能在Win7或Win8系统中使用！
echo.&echo 请按任意键退出吧……
pause>nul
exit


:about::关于
echo.
echo 【去除或恢复桌面快捷方式小箭头工具】
echo 作者：刘显安
echo 微博：http://weibo.com/liuxianan
echo QQ：937925941
echo 日期：2013年2月11日
echo.
goto :EOF

