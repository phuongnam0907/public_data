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
### Install APT package: autossh
### => Get PORT: 12xxx
### Installing script...
Created symlink /etc/systemd/system/multi-user.target.wants/autosshd.service → /etc/systemd/system/autosshd.service.
Created symlink /etc/systemd/system/timers.target.wants/auto_poweroff.timer → /etc/systemd/system/auto_poweroff.timer.
### Cleaning workspace...
###======================###
###    SETUP DONE!!!!    ###
############################
```
