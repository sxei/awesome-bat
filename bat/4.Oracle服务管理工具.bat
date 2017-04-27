@echo off
setlocal enabledelayedexpansion
title Oracle服务管理工具”(by刘显安)
color E0


cls::清屏
call :admintest::检查是否是管理员身份运行
call :vercheck::检查当前系统是否是Win7或Win8


:menu
set Line===================================================
echo %Line%
echo 	提示：本工具同时支持XP、Win7、Win8系统
echo.
echo		[A]	启动Oracle
echo		[B]	停止Oracle
echo		[C]	关于
echo.
echo		[X]	退出
echo %Line%


choice /c ABCX /M 请选择
if %errorlevel%==1 call :start
if %errorlevel%==2 call :stop
if %errorlevel%==3 call :about
if %errorlevel%==4 exit
goto :menu

:start
net start OracleXETNSListener 2>nul
net start OracleServiceXE 2>nul
@oradim -startup -sid XE -starttype inst > nul 2>&1
goto :EOF

:stop
net stop OracleServiceXE
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
echo.&echo 抱歉，本批处理只能在XP、Win7或Win8系统中使用！
echo.&echo 请按任意键退出吧……
pause>nul
exit


:about::关于
echo.
echo 【Oracle服务管理工具】
echo 作者：刘显安
echo 微博：http://weibo.com/liuxianan
echo QQ：937925941
echo 日期：2013年3月23日
echo.
goto :EOF

