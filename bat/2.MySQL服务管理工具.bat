@echo off
setlocal enabledelayedexpansion::延迟环境变量扩展
title MySQL服务管理工具(by小茗同学)
color 0A
mode con: cols=50 lines=30

call :admintest::检查是否是管理员身份运行
call :vercheck::检查当前系统是否是Win7或Win8
call :pathcheck::检查是否放在bin目录下运行
cls::清屏

::将当前路径添加到path环境变量，主要结尾不能有空格！
:menu
set Line===================================================
echo %Line%
echo 	提示：本工具同时支持XP、Win7、Win8系统
echo			v20170427
echo.
echo		[A]	安装MySQL服务
echo		[B]	卸载MySQL服务
echo		[C]	启动MySQL服务
echo		[D]	停止MySQL服务
echo		[E]	重启MySQL服务
echo		[F]	为root设置密码
echo		[G]	关于
echo.
echo		[X]	退出
echo %Line%


choice /c ABCDEFGX /M 请选择
if %errorlevel%==1 call :install
if %errorlevel%==2 call :uninstall
if %errorlevel%==3 call :start
if %errorlevel%==4 call :stop
if %errorlevel%==5 call :restart
if %errorlevel%==6 call :password
if %errorlevel%==7 call :about
if %errorlevel%==8 exit
goto :menu


:install
"%~dp0mysqld.exe" --install
goto :EOF

:uninstall
sc delete mysql
goto :EOF

:start
net start mysql
goto :EOF

:stop
net stop mysql
goto :EOF

:restart
net stop mysql
net start mysql
goto :EOF

:password
echo.
echo 温馨提示：设置密码前须先启动MySQL服务哦！
echo.
echo 你是否是第一次设置密码？
choice /c YN /M 请选择
if %errorlevel%==1 call :pwd1
if %errorlevel%==2 call :pwd2
goto :EOF

:pwd1
echo 请输入您想设置的密码:
set /p pwd=%=%
mysqladmin -uroot password %pwd%
goto :EOF

:pwd2
echo 请输入旧密码:
set /p old=%=%
echo 请输入新密码:
set /p pwd=%=%
mysqladmin -uroot -p%old% password %pwd%
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
ver | find "10.0" >nul 2>nul && (echo 您的当前系统是Win10，符合要求！&set value=imageres.dll,197&echo.&goto :EOF)
echo.&echo 抱歉，本批处理只能在XP、Win7或更高版本系统中使用！
echo.&echo 请按任意键退出吧……
pause>nul
exit

:pathcheck::检查是否放在bin目录下
echo.
echo 温馨提示：
echo.
echo 如果您是安装MySQL服务或者修改密码，
echo 请务必将本批处理放在MySQL\bin目录下执行！
echo.
echo 按任意键继续，退出请点击“关闭”。。。
pause>null
goto :EOF

:about::关于
echo.
echo 【MySQL服务管理工具】
echo 作者：柳夏南
echo 官网：http://liuxianan.com
echo 创建日期：2013年3月23日
echo 最后修改：2017年4月27日
echo.
echo 更新历史：
echo 20130323：v1.0 最初版本，具备安装、卸载、启动、停止MySQL服务等功能，但是必须先手动配置MySQL路径
echo 20130504：v1.1 无需配置路径，但需保证运行在bin目录下，增加密码修改功能
echo 20130505: v1.2 解决由于无需配置MySQL路径直接配置path导致的安装后MySQL服务路径不正确的Bug（定位到bin目录然后直接使用“mysqld --install”安装会有问题！！！）
echo 20130902: v1.3 解决Win8.1下系统判断问题，发现"%~dp0mysqld.exe"语句是合法的。
echo.
goto :EOF

