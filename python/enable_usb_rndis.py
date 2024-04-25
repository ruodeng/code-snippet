import os
import subprocess

"""
This script running on a openwrt or other device, used to enable USB RNDIS on an Android device.
Then the device can be connected to the internet through the Android device.
Setup in cronjob to run every 5 minutes:
*/5 * * * * /usr/bin/python3 /path/to/your/enable_usb_rndis.py
"""

class AndroidDeviceManager:
    def __init__(self):
        self.devices = self.check_connected_devices()

    def check_connected_devices(self):
        """Check if an Android device is connected to this computer using adb."""
        devices = os.popen('adb devices').read()
        if 'device' in devices:
            return devices.split()[4]
        return None

    def setup_usb_rndis_on_device(self):
        """Try to open USB on the connected device."""
        if self.devices is not None:
            try:
                subprocess.check_call(f'adb -s {self.devices} shell svc usb setFunctions rndis', shell=True, stdout=subprocess.DEVNULL, stderr=subprocess.STDOUT)
            except subprocess.CalledProcessError:
                print(f'Failed to open USB on device {self.devices}')

def main():
    """Main function to run the device check."""
    manager = AndroidDeviceManager()
    manager.setup_usb_rndis_on_device()

if __name__ == '__main__':
    main()