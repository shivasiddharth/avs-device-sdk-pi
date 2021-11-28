# avs-device-sdk-pi
## Scripts to enable Alexa voice activation using Picovoice Porcupine

*******************************************************************************************************************************
### **If you like the work, find it useful and if you would like to get me a :coffee: :smile:** [![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif)](https://paypal.me/sidsclass?country.x=IE&locale.x=en_US)  

*******************************************************************************************************************************
1. Follow Amazon's official setup guide from [here](https://developer.amazon.com/en-US/docs/alexa/avs-device-sdk/raspberry-pi.html) for the installation procedure.                                                                                                                                                                                                     
2. After the completion of the Alexa installation, install the requisites for Picovoice porcupine using:   
```     
sudo apt-get update     
sudo apt-get install python3-pip wmctrl xdotool   
pip3 install pvporcupine==2.0.0     
pip3 install pvrecorder==1.0.2    
```       
3. Download the **alexa_picovoice_trigger.py** file from this git.    
4. Create the Access Key in Picovoice console and download the keyword from Picovoice porcupine git.     
5. For voice activation, open a terminal and enter the following:     
```      
wmctrl -l    
```    
Note the id value of the terminal in the extreme left.   
6. Start the Alexa's Startsample.sh script from the same terminal.   
7. Open the alexa_picovoice_trigger.py script and change the id value given in https://github.com/shivasiddharth/avs-device-sdk-pi/blob/65858c8e879a08615ee4177f6b0f0288c53c1592/alexa_picovoice_trigger.py#L115 with the id value noted.      
7. Start the Picovoice porcupine trigger using the following syntax:    
```    
python3 /home/pi/alexa_picovoice_trigger.py --access_key ${ACCESS_KEY} --keyword_paths ${KEYWORD_PATH_ONE}       
```     
8. Now, Alexa can be triggered with Picovoice Porcupine wakeword engine.       
