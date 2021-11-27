import RPi.GPIO as GPIO
import socket
import yaml

SOCKET_PORT = 5000

USER_PATH = os.path.realpath(os.path.join(__file__, '..', '..','..'))

with open('{}/avs-device-sdk-pi/Alexa/config.yaml'.format(USER_PATH),'r') as conf:
    configuration = yaml.load(conf)

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

triggerbutton=configuration['Gpios']['trigger'][0]
GPIO.setup(triggerbutton, GPIO.IN, pull_up_down=GPIO.PUD_UP)

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(('localhost', SOCKET_PORT))

def trigger_callback():
    s.sendall(b't')
    s.close()
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect(('localhost', SOCKET_PORT))

GPIO.add_event_detect(triggerbutton,GPIO.FALLING,callback=trigger_callback)

message = input("Press enter to Quit\n\n") # Run until someone presses enter
GPIO.cleanup() # Clean up

# while True:
#     if GPIO.event_detected(stoppushbutton):
#         GPIO.remove_event_detect(triggerbutton)
#         s.sendall(b't')
#         s.close()
#         s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
#         s.connect(('localhost', SOCKET_PORT))
