# avs-device-sdk-pi
## Scripts to enable Alexa voice activation using Picovoice Porcupine

*******************************************************************************************************************************
### **If you like the work, find it useful and if you would like to get me a :coffee: :smile:** [![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=7GH3YDCHZ36QN)  

*******************************************************************************************************************************
1. Follow Amazon's official setup guide from [here](https://developer.amazon.com/en-US/docs/alexa/avs-device-sdk/raspberry-pi.html) for the installation procedure.         
2. After [Step-3](https://developer.amazon.com/en-US/docs/alexa/avs-device-sdk/raspberry-pi.html#step-3-download-the-avs-device-sdk) of the installation process, replace the **UserInputManager.cpp** in the "avs-device-sdk/SampleApp/src/" folder with the **UserInputManager.cpp** file given here in this git.   
3. After replacing the file, proceed with the subsequent installation steps from the official guide.   
4. After the completion of the Alexa installation, install the requisites for Picovoice porcupine using:   
```     
sudo apt-get update     
sudo apt-get install python3-pip    
pip3 install pvporcupine==2.0.0     
pip3 install pvrecorder==1.0.2    
```       
5. Download the **alexa_trigger.py** file from this git.    
6. Create the Access Key in Picovoice console and download the keyword from Picovoice porcupine git.     
6. For voice activation, start Alexa first. And then start the Picovoice porcupine trigger using the following syntax:    
```    
python3 /home/pi/alexa_trigger.py --access_key ${ACCESS_KEY} --keyword_paths ${KEYWORD_PATH_ONE}       
```     
