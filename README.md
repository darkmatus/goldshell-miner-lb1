# Goldshellminer-cli

### Introduction

It is a mining software to interact with goldshell home-mining device (HS1, HS1-Plus)

HS1: https://www.goldshell.com/hs1-handshake-miner-intro/   

HS1-Plus:  https://www.goldshell.com/hs1-handshake-miner-intro/  


### Mining Guide

Tested on Linux, Windows and Mac OS. 

#### 1.Install Node.js 
```v10.15.3``` is recommended and tested
#### 2.Clone code
 ```$:https://github.com/darkmatus/goldshell-miner-lb1.git```
#### 3.Install dependency
```$:npm install```
#### 4. Config udev rule
##### debian based systems
Identify productId and vendorId by calling
```udevadm info -a -p  $(udevadm info -q path -n /dev/ttyACM0)``` where ttyACM0 is the port where your miner is located.

Open `/etc/udev/rules.d/10-local.rules` and add the following line:

```ACTION=="add", ATTRS{idVendor}=="0403", ATTRS{idProduct}=="6001", SYMLINK+="myLB1"```

The idVendor should be replaced with the id found out with the previous command (same for idProduct).
You can also replace "myLB1" with your wished name. 

Load the new udevadm rule(s) with:
`sudo udevadm trigger`
#### 5.Config pool
Config `./config.json` to set your pool.
###### DXPOOL for example
``` json
{
  "loglevel": -1,
  "miners": [
    {
      "cryptoname": "hns",
      "minername": ["Goldshell-HS1", "Goldshell-HS1-Plus"],
      "minerport": ["/dev/myHS1", "/dev/myHS1Plus"],
      "pool": {
        "host": "hns.ss.dxpool.com",
        "port": 3008,
        "user": "user.name",
        "pass": "x"
      }
    },
    {
      "cryptoname": "lbc",
      "minername": ["Goldshell-LB1"],
      "minerport": ["/dev/myLB1"],
      "pool": {
        "host": "lbc.viabtc.com",
        "port": 3002,
        "user": "user.name",
        "pass": "x"
      }
    }
  ]
}

```
#### 5.Start Mining
```$:npm run dashboard ```

#### 6.Stop Mining
(Ctrl+C, Q, or ESC to stop the dashboard miner)
