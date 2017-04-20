@echo off

setlocal enabledelayedexpansion

title 系统属性和隐藏属性修改器

color 0A

mode con: cols=50 lines=25

if "%~1"=="" (

echo 您没有拖入任何磁盘或文件或文件夹

echo.

echo 请把要处理的磁盘或文件或文件夹

echo 拖到批处理文件图标中会自动执行

echo.

echo 不要双击启动批处理

echo.

pause

)

:loop

cls

if "%~1"=="" goto :eof

if not exist "%~1" (echo 路径不存在)&pause&shift&goto loop

echo 当前处理的磁盘或文件或文件夹:

echo %~1

echo.

echo 请选择要进行的操作，然后按回车

echo.

echo 加系统和隐藏属性……………………………1

echo 去系统和隐藏属性……………………………2

echo 不处理…………………………………………3

echo.

set /p "c1=选择 (1,2,3) (不输入为!c1!,默认为2):"

if "!c1!"=="1" (set "d=+") else if "!c1!"=="3" (pause&shift&goto loop) else set "d=-"

set "a=%~a1"

if /i "!a:~0,1!"=="d" (

echo.

echo 这是一个文件夹，请选择要进行的操作，然后按回车

echo.

echo 只对该文件夹本身……………………………1

echo 只对该文件夹中的文件夹和文件……………2

echo 对该目录下的一切的文件夹和文件…………3

echo.

set /p "c2=选择 (1,2,3) (不输入为!c2!,默认为1):"

if "!c2!"=="2" (

pushd "%~1"

for /f "delims=" %%i in ('dir /a /b "%~1"') do attrib.exe !d!s !d!h "%%i"

popd

) else if "!c2!"=="3" (

for /f "delims=" %%i in ('dir /a /b /s "%~1"') do attrib.exe !d!s !d!h "%%i"

) else (

attrib.exe !d!s !d!h "%~1"

)

) else (

attrib.exe !d!s !d!h "%~1"

)

pause&shift&goto loop

