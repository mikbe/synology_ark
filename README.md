# Synology Ark: Survival Evolved 

The easiest way to install an Ark: Survival Evolution on your Synology DiskStation.

### Status  
Developing, not ready to use yet, do not download, DANGER WILL ROBINSON! DANGER!

!!!!   YOU MUST HAVE 16GB OF MEMORY IN YOUR SYNOLOGY DS   !!!!  
  
!!!!  YOU MAY NEED AN ATOM PROCESSOR IN YOUR SYNOLOGY DS  !!!!  


### Description  
 
This is specifically designed for Synology owners.  
It probably won't work well for non Synology installs.  

Based off Phantium's Ark Server but much more friendly for Synology owners  
as it uses a shared folder instead of a non-shared folder you can't get to  
without SSHing into the server.  

This configuration also uses simple files to control the server and it  
doesn't reinstall the server everytime you boot the image.  

### Instructions
* Install Docker on your Synology DS if you haven't already.
* Add a shared folder named "ArkServer" using File Station in DSM.
* Add this image in Docker via url: 
* Start the container.
* After it's done installing the Ark software stop the container.
* Edit the GameUserSettings.ini file.
* Open ports 7778 and 27015 in your router to enable external users to join your server.
* Join your server using the "LAN" filter in Ark.


## IMPORTANT NOTES  

It can take over five minutes for the Ark server to start, be patient.  
Installing, updating, or validating will take a LONG time,  
usually over 30 minutes. Be patient. Look at the log for progress info.  

I don't know if Ark will run on non Intel CPUs.  
Please email me to let me know if this works with your non-Intel DiskStation.  

** YOU NEED 16GB IN YOUR DISKSTATION! **  
You may be able to get away with 6GB but your DS will be using all your memory.  
Keep in mind that the server, without any users, uses 3.4GB.  
Use this memory: CT2C8G3S160BM (2x kit model number: CT2K8G3S160BM)  
Memory link: http://www.amazon.com/gp/product/B008LTBJFW  
How to install memory: https://www.youtube.com/watch?v=yy_iA-Gp9z8  

Assumes your volume is named volume1.  

Config file is located at /volume1/ArkServer/  
