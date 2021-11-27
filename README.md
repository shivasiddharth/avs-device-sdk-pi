# avs-device-sdk-pi
## Simple avs-device-sdk installer for Pi   

*******************************************************************************************************************************
### **If you like the work, find it useful and if you would like to get me a :coffee: :smile:** [![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=7GH3YDCHZ36QN)  

*******************************************************************************************************************************
### Note:
**What works:**    
1. Picovoice wakewording.   

**WIP:**    
1. Indicators.   
2. Options to switch between pushbutton and Picovoice triggers.     
3. Autostart on boot.    
****************************************************************
**Before Starting the setup**
****************************************************************

**For Amazon Alexa**  
1. Create a security profile for alexa-avs-sample-app if you already don't have one.  
https://github.com/alexa/avs-device-sdk/wiki/Create-Security-Profile  

2. Download the **"config.json"** file.


***************************************************************
**Setup Amazon Alexa, Google Assistant or Both**     
***************************************************************
1. Clone the git using:
```
git clone https://github.com/shivasiddharth/avs-device-sdk-pi  
```    
**DO NOT RENAME THE CREDENTIALS FILEs**     
Place the Alexa **config.json in** file in the  **/home/pi/avs-device-sdk-pi/Alexa** directory.        

2. Make the installer executable using:
```
sudo chmod +x /home/pi/avs-device-sdk-pi/scripts/installer.sh  
```    
3. Install the assistant/assistants using the following. This is an interactive script, so just follow the onscreen instructions:
```
sudo /home/pi/avs-device-sdk-pi/scripts/installer.sh  
```      

4. Manually start Alexa first:    

Open a terminal and run the following commands:  
```
sudo chmod +x /home/pi/avs-device-sdk-pi/scripts/service-installer.sh
sudo /home/pi/avs-device-sdk-pi/scripts/service-installer.sh  
```
