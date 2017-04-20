netsh interface ip set address "ÒÔÌ«Íø" static 172.16.4.98 255.255.0.0
netsh interface ip add address "ÒÔÌ«Íø" gateway=172.16.0.1 gwmetric=1
::netsh interface ip set dns "ÒÔÌ«Íø" static 202.96.134.133
::netsh interface ip add dns "ÒÔÌ«Íø" 8.8.4.4 index=2