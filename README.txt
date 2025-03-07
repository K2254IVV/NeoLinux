Tutorial: How to Run the installPARTS.sh Script from NeoLinux Repository
This tutorial will guide you through the steps to download and run the installPARTS.sh script from the NeoLinux GitHub repository. This script automates the installation of various applications, tools, and configurations for a Linux system.

Prerequisites
A Linux-based system: The script is designed for Linux distributions (e.g., Ubuntu, Debian, or derivatives).

Internet connection: Required to download the script and install packages.

Administrator privileges: You need sudo access to install packages and make system changes.

Step 1: Open a Terminal
Press Ctrl + Alt + T to open a terminal window.

Ensure your system is up-to-date by running:


sudo apt update && sudo apt upgrade -y
Step 2: Download the Script
Use the wget command to download the script directly from GitHub:


wget https://raw.githubusercontent.com/K2254IVV/NeoLinux/main/installPARTS.sh
This will download the installPARTS.sh script to your current directory.

Verify the script is downloaded:


ls
You should see installPARTS.sh listed.

Step 3: Make the Script Executable
The script needs to be executable before you can run it. Use the chmod command to set the necessary permissions:


chmod +x installPARTS.sh
Step 4: Run the Script
Execute the script with sudo to ensure it has the necessary permissions:


sudo ./installPARTS.sh
Follow the on-screen prompts:

The script will guide you through various installation options, such as:

Installing Snap applications.

Setting up Flatpak and Flatpak applications.

Installing Java, Wine, and Bottles.

Configuring KDE Plasma (with options to reinstall or install alongside GNOME).

You may be asked to confirm certain actions or provide input (e.g., selecting a KDE Plasma version).

Step 5: Monitor the Installation
The script will automatically install the selected packages and configurations.

You may see progress messages in the terminal. If any errors occur, they will also be displayed here.

Step 6: Reboot (if required)
After the script completes, it may prompt you to reboot your system to apply changes (e.g., after installing KDE Plasma). To reboot, run:


sudo reboot
Step 7: Verify the Installation
After rebooting, log in to your system.

Check that the installed applications and configurations are working as expected:

Open applications like VLC, Firefox, or Android Studio.

Verify that KDE Plasma (or your chosen desktop environment) is functioning correctly.

Troubleshooting
Script fails to run:

Ensure the script is executable (chmod +x installPARTS.sh).

Check your internet connection.

Run the script with   explicitly:

 
 
sudo   installPARTS.sh
Missing dependencies:

If the script reports missing dependencies, install them manually. For example:

 
 
sudo apt install -y wget git
Permission issues:

Ensure you are running the script with sudo.

Customization
If you want to modify the script (e.g., add or remove packages), open it in a text editor:

 
 
nano installPARTS.sh
Make your changes, save the file, and rerun the script.

Conclusion
You have successfully run the installPARTS.sh script from the NeoLinux repository. This script simplifies the setup of a Linux system by automating the installation of essential tools, applications, and configurations. Enjoy your newly configured system! 🚀

For more information, visit the NeoLinux GitHub repository.
