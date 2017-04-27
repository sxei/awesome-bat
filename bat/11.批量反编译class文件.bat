@echo off
setlocal enabledelayedexpansion
title class批量反编译
color 0A
mode con: cols=80 lines=40

::**********************************************
::
:: %1：需要批量反编译的文件夹，暂不支持直接反编译jar包，
::     需要先解压，然后再把解压后的文件夹拖入到该批处理上
::     另外需要事先将jad.exe配置环境变量
:: by lxa 20151023
:: last update 20151023
::
::**********************************************

if "%~1"=="" (
	echo 您没有拖入任何文件夹
	echo.
	echo 请把要批量反编译的文件夹
	echo 拖到批处理文件图标中
	echo.
	echo 不要双击启动批处理
	echo.
	pause
	goto :eof
)
set output_path="%~dp1source"
if exist !output_path! (
	rd /q /s !output_path!
)
md !output_path!
jad -o -r -d !output_path! -s java "%~1\**\*.class"
echo 完毕