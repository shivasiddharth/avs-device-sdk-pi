# avs-device-sdk-pi

## Simple avs-device-sdk installer for Pi (Untested Branch)   

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

***************************************************************
**Setup Amazon Alexa**     
***************************************************************
1. Clone the git using:
```
git clone https://github.com/shivasiddharth/avs-device-sdk-pi  
```    
2. Create a security profile for alexa-avs-sample-app if you already don't have one.  
https://github.com/alexa/avs-device-sdk/wiki/Create-Security-Profile  

3. Download the **"config.json"** file.
**DO NOT RENAME THE CREDENTIALS FILEs**     
Place the Alexa **config.json in** file in the  **/home/pi/avs-device-sdk-pi/Alexa** directory.        

4. Make the installer executable using:
```
sudo chmod +x /home/pi/avs-device-sdk-pi/scripts/installer.sh  
```    
5. Install the assistant using the following:         
```
sudo /home/pi/avs-device-sdk-pi/scripts/installer.sh  
```      
6. Start the Alexa SampleApp and Authorize the first time it starts.    
7. Headover to Picovoice's console and generate the access key.   
8. For Picovoice porcupine wakewording, start the SampleApp first and then launch the trigger using:   
```    
python3 /home/pi/avs-device-sdk-pi/Alexa/alexa_trigger.py --access_key ${ACCESS_KEY} --keyword_paths ${KEYWORD_PATH_ONE}

