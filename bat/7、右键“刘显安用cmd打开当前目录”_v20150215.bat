@echo off
setlocal enabledelayedexpansion
title 添加右键“刘显安用cmd打开当前目录”(by刘显安)
color E0


cls::清屏
call :admintest::检查是否是管理员身份运行
call :vercheck::检查当前系统是否是Win7或Win8


:menu
set Line===================================================
echo %Line%
echo 	提示：本工具同时支持XP、Win7、Win8系统
echo.
echo		[A]	添加右键“刘显安用cmd打开当前目录”
echo		[B]	去除右键“刘显安用cmd打开当前目录”
echo		[C]	关于
echo.
echo		[X]	退出
echo %Line%


choice /c ABCX /M 请选择
if %errorlevel%==1 call :add
if %errorlevel%==2 call :remove
if %errorlevel%==3 call :about
if %errorlevel%==4 exit
goto :menu


:add
REG ADD "HKCR\*\shell\刘显安用cmd打开当前目录\command" /ve /t REG_EXPAND_SZ /d %ComSpec%
REG ADD "HKCR\Directory\shell\刘显安用cmd打开当前目录\command" /ve /t REG_EXPAND_SZ /d "%ComSpec% /k cd %1"
REG ADD "HKCR\Drive\shell\刘显安用cmd打开当前目录\command" /ve /t REG_EXPAND_SZ /d "%ComSpec% /k cd %1"
echo 添加成功！
goto :EOF


:remove
echo Y|REG DELETE "HKCR\*\shell\刘显安用cmd打开当前目录"
echo Y|REG DELETE "HKCR\Directory\shell\刘显安用cmd打开当前目录"
echo Y|REG DELETE "HKCR\Drive\shell\刘显安用cmd打开当前目录"
echo 删除成功！
goto :EOF



:admintest::测试是否是以管理员身份运行
set rnd=_%random%
md %windir%\%rnd% >nul 2>nul
if %errorlevel%==1 (echo.&echo 请右键本文件，选择“以管理员身份运行”。&echo.&echo 您可以按任意键退出……&pause>nul 2>nul &exit)
rd /q %windir%\%rnd%
goto :EOF


:vercheck::系统版本检查
ver | find "5.1" >nul 2>nul && (echo 您的当前系统是WinXP，符合要求！&echo.&goto :EOF)
ver | find "6.1" >nul 2>nul && (echo 您的当前系统是Win7，符合要求！&echo.&goto :EOF)
ver | find "6.2" >nul 2>nul && (echo 您的当前系统是Win8，符合要求！&echo.&goto :EOF)
ver | find "6.3" >nul 2>nul && (echo 您的当前系统是Win8.1，符合要求！&echo.&goto :EOF)
echo.&echo 抱歉，本批处理只能在XP、Win7或Win8系统中使用！
echo.&echo 请按任意键退出吧……
pause>nul
exit


:about::关于
echo.
echo 【添加右键“刘显安用cmd打开当前目录”】
echo 作者：刘显安
echo 微博：http://weibo.com/liuxianan
echo QQ：937925941
echo 日期：2013年3月23日
echo 最后修改：2015年2月15日
echo.
goto :EOF

