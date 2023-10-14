# public_data
## To setup Auto SSH Service
Run this command:
```
curl https://raw.githubusercontent.com/phuongnam0907/public_data/setup/script/setup_port.sh | bash
```
Then the port is shown like:
```
### => Get PORT: 12xxx
```
Go to [this page](http://portal.lpnserver.net/) then choose <b>Devices SSH</b> to open connection with related port
<br>
Example Output:
```
pi@raspberry:~ $ curl https://raw.githubusercontent.com/phuongnam0907/public_data/setup/script/setup_port.sh | bash
% Total    % Received % Xferd  Average Speed   Time    Time     Time  Current Dload  Upload   Total   Spent    Left  Speed
100  6236  100  6236    0     0  10757      0 --:--:-- --:--:-- --:--:-- 10770
############################
###     START SETUP      ###
###======================###
### Preparing environment...
The following NEW packages will be installed:
  autossh
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 33.5 kB of archives.
After this operation, 84.0 kB of additional disk space will be used.
Selecting previously unselected package autossh.
(Reading database ... 133035 files and directories currently installed.)
Preparing to unpack .../autossh_1.4g-1_armhf.deb ...
Unpacking autossh (1.4g-1) ...
Setting up autossh (1.4g-1) ...
Processing triggers for man-db (2.11.2-2) ...
### => Get PORT: 12xxx
### Installing script...
Created symlink /etc/systemd/system/multi-user.target.wants/autosshd.service → /etc/systemd/system/autosshd.service.
Created symlink /etc/systemd/system/timers.target.wants/auto_poweroff.timer → /etc/systemd/system/auto_poweroff.timer.
### Cleaning workspace...
###======================###
###    SETUP DONE!!!!    ###
############################
```
