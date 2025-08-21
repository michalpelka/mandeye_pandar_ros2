# Prerequsities

User name : mandeye
Ros2 worskpace  cloned to : /home/mandeye/mandeye_pandar_ros2
Hesai laser connected to eth0.


# Setup Xsense

```
sudo adduser mandeye dialout
```

# Build ROS 2 workspace

```
cd /home/mandeye/mandeye_pandar_ros2
colcon build
```


# Create PTP server config

```
sudo apt-get update && sudo apt-get install linuxptp
```
and create config:

```
sudo vim /etc/linuxptp/gm-l2.conf
```
and add content:
```
[global]
serverOnly            1         
time_stamping         hardware
network_transport     L2    
delay_mechanism       E2E
domainNumber          0
twoStepFlag           1
summary_interval      1
logAnnounceInterval   1
logSyncInterval       0
summary_interval      1
[eth0]
```

# Services

## Install services for ROS 2 drivers and PTP

```
sudo cp /home/mandeye/mandeye_pandar_ros2/* /etc/systemd/system/
```

### Start it
```
sudo systemctl daemon-reload
sudo systemctl enable --now mandeye_ptp4l-gm-eth0.service
sudo systemctl enable --now mandeye_phc2sys-gm-eth0.service
sudo systemctl enable --now mandeye_ros2_hesai.service
sudo systemctl enable --now mandeye_ros2_xsense.service
```

### Log
```
journalctl -u mandeye_ptp4l-gm-eth0 -n 50 -e | tail
journalctl -u mandeye_phc2sys-gm-eth0 -n 50 -e | tail
journalctl -u mandeye_ros2_hesai -n 50 -e | tail
journalctl -u mandeye_ros2_xsense -n 50 -e | tail
```

## Setup Lidar
Set Clock source to PTP and choose network transport "L2". 
![](screen0.png)

## Test

![](screen1.png)


# Install xsense and heasi drivers as 

