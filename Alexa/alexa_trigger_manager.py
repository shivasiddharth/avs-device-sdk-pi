import yaml


USER_PATH = os.path.realpath(os.path.join(__file__, '..', '..','..'))

with open('{}/avs-device-sdk-pi/Alexa/config.yaml'.format(USER_PATH),'r') as conf:
    configuration = yaml.load(conf)

if configuration['Trigger'][0]=="Voice":
    #Add command for voice trigger
if configuration['Trigger'][0]=="PushButton":
    #Add command for pushbutton trigger  
