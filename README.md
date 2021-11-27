# Assistants-Pi
## One installer for both Google Asistant and Amazon Alexa   
## Simultaneously run Google Assistant and Alexa on Raspberry Pi    
*******************************************************************************************************************************
### **If you like the work, find it useful and if you would like to get me a :coffee: :smile:** [![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=7GH3YDCHZ36QN)  

*******************************************************************************************************************************
### Note:
**18/01/2020: Routine update and bug fixes.**  
****************************************************************
**Before Starting the setup**
****************************************************************
**For Google Assistant**  
1. Create a project in the Google's Action Console.    
2. Download credentials--->.json file (refer to this doc for creating credentials https://developers.google.com/assistant/sdk/develop/python/config-dev-project-and-account)   


**For Amazon Alexa**  
1. Create a security profile for alexa-avs-sample-app if you already don't have one.  
https://github.com/alexa/avs-device-sdk/wiki/Create-Security-Profile  

2. Download the **"config.json"** file. 


***************************************************************
**Setup Amazon Alexa, Google Assistant or Both**     
***************************************************************
1. Clone the git using:
```
git clone https://github.com/shivasiddharth/Assistants-Pi  
```    
**DO NOT RENAME THE CREDENTIALS FILEs**     
Place the Alexa **config.json in** file in the  **/home/pi/Assistants-Pi/Alexa** directory.        
Place the Google **client_secret.....json** file in the **/home/pi/** directory.     

2. Make the installers executable using:
```
sudo chmod +x /home/pi/Assistants-Pi/scripts/prep-system.sh    
sudo chmod +x /home/pi/Assistants-Pi/scripts/audio-test.sh   
sudo chmod +x /home/pi/Assistants-Pi/scripts/installer.sh  
```    

3. Prepare the system for installing assistants by updating, upgrading and setting up audio using:  
```
sudo /home/pi/Assistants-Pi/scripts/prep-system.sh
```    

4. Restart the Pi using:
```
sudo reboot
```    

5. Make sure that contents of asoundrc match the contents of asound.conf    
   Open a terminal and type:  
```
sudo nano /etc/asound.conf
```
   Open a second terminal and type:    
```
sudo nano ~/.asoundrc
```  
   If the contents of .asoundrc are not same as asound.conf, copy the contents from asound.conf to .asoundrc, save using ctrl+x and y

6. Bonus Script - Test the audio setup using the following code (optional). **Dont panic if the test does not go through successfully, proceed with the installation**:  
```
sudo /home/pi/Assistants-Pi/scripts/audio-test.sh  
```     

7. Restart the Pi using:
```
sudo reboot
```      

8. Install the assistant/assistants using the following. This is an interactive script, so just follow the onscreen instructions:
```
sudo /home/pi/Assistants-Pi/scripts/installer.sh  
```      

9. After verification of the assistants, to make them auto start on boot:  

Open a terminal and run the following commands:  
```
sudo chmod +x /home/pi/Assistants-Pi/scripts/service-installer.sh
sudo /home/pi/Assistants-Pi/scripts/service-installer.sh  
```
For Alexa:  
```
sudo systemctl enable alexa.service  
```
For Google Assistant:  
```
sudo systemctl enable google-assistant.service  
```

10. Authorize Alexa before restarting  
```
sudo /home/pi/Assistants-Pi/Alexa/startsample.sh  
```

### Manually Start The Alexa Assistant   
Double click start.sh file in the /home/pi/Assistants-Pi/Alexa folder and choose to "Execute in the Terminal".       

### Manually Start The Google Assistant
Open a terminal and execute the following:
```
/home/pi/env/bin/python -u /home/pi/Assistants-Pi/Google-Assistant/src/main.py --project_id 'replace this with the project id '--device_model_id 'replace this with the model id'
```   

#### If you have issues with the Assistants strating on boot, you may have to setup PulseAudio as a system wide service. For further details refer this git https://github.com/shivasiddharth/PulseAudio-System-Wide      
