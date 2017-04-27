@echo off
mode con cols=42 lines=23
color 0A 
title Java环境变量一键设置工具
call :admintest::检查是否是管理员身份运行
echo 	Java环境变量一键设置工具
echo 	by【刘显安】
echo 	2013年4月20日
echo.
echo 执行前请确认：
echo.
echo 1、请将本批处理放在Java\jdk_1.6.0\目录下(不是bin)
echo 2、退出360等杀毒软件(因为修改系统path杀毒软件会自动拦截)
echo 3、将自动为您创建JAVA_HOME、ClassPath、Path 3个环境变量，如果已经存在会自动为您覆盖，请放心使用！
echo 4、限于作者水平，不保证一定执行正确，对此造成的损失概不负责！还是推荐【手动配置】环境变量！
echo.
echo 按任意键继续执行，若要退出请手动关闭本批处理……
pause>nul 2>nul

::如果存在JAVA_HOME环境变量那么先删除之
wmic ENVIRONMENT where "name='JAVA_HOME'" delete

::如果存在ClassPath环境变量那么先删除之
wmic ENVIRONMENT where "name='ClassPath'" delete

::创建JAVA_HOME，其中“%~dp0”为批处理文件所在的目录的路径，以/结尾
wmic ENVIRONMENT create name="JAVA_HOME",username="<system>",VariableValue="%~dp0"

::创建ClassPath
wmic ENVIRONMENT create name="ClassPath",username="<system>",VariableValue="%~dp0lib\dt.jar;%~dp0lib\tools.jar;.;"

::这一句话可能比较难理解，总的意思就是将%Path%里面的%JAVA_HOME%给删除
call set newPath=%%Path:%JAVA_HOME%bin;=%%

::设置Path环境变量，用%JAVA_HOME%%bin;与上面得到的新path合并
wmic ENVIRONMENT where "name='Path' and username='<system>'" set VariableValue="%%JAVA_HOME%%bin;%newPath%"

echo 如果不出意外，环境变量以为您设置成功！
echo 请按任意键退出。
pause>nul 2>nul

:admintest::测试是否是以管理员身份运行
set rnd=_%random%
md %windir%\%rnd% >nul 2>nul
if %errorlevel%==1 (echo.&echo 请右键本批处理文件，选择“以管理员身份运行”。&echo.&echo 您可以按任意键退出……&pause>nul 2>nul &exit)
rd /q %windir%\%rnd%
goto :EOF

::By刘显安
::日期21:42 2013/4/20
::微博：http://weibo.com/liuxianan
::QQ:937925941