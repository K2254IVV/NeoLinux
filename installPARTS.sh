#!/bin/bash

# Function to check and install PyQt6
install_pyqt6() {
    echo "Checking for PyQt6..."
    if ! python3 -c "import PyQt6" &> /dev/null; then
        echo "PyQt6 not found. Installing PyQt6..."
        sudo pip install pyqt6
    else
        echo "PyQt6 is already installed."
    fi
}

# Function to install ADB and Fastboot
install_adb_fastboot() {
    echo "Installing ADB and Fastboot..."
    sudo apt update
    sudo apt install -y adb fastboot
    echo "ADB and Fastboot installed."
}

# Function to install Snap applications
install_snap_apps() {
    echo "Installing Snap applications..."
    sudo snap install vlc
    sudo snap install android-studio --classic
    sudo snap install chromium
    sudo snap install ark
    sudo snap install steam
    sudo snap install gimp
    sudo snap install sublime-text --classic
    sudo snap install firefox
    sudo snap install red-app
    sudo snap install libreoffice
    sudo snap install cheese
    sudo snap install discord
    sudo snap install flstudio
    sudo snap install telegram-desktop
    sudo snap install telegram-cli
    echo "Snap applications installed."
}

# Function to install Flatpak and applications
install_flatpak() {
    echo "Installing Flatpak and applications..."
    sudo add-apt-repository ppa:flatpak/stable -y
    sudo apt update
    sudo apt install -y flatpak
    sudo flatpak install flathub org.prismlauncher.PrismLauncher -y
    echo "Flatpak and applications installed."
}

# Function to install Java (OpenJDK)
install_java() {
    echo "Installing Java (OpenJDK)..."
    sudo apt update
    sudo apt install -y openjdk-17-jdk openjdk-17-jre
    echo "Java installed."
    java -version
}

# Function to install Wine and Bottles
install_wine_bottles() {
    echo "Installing Wine and Bottles..."
    sudo apt update
    # Install Wine
    sudo dpkg --add-architecture i386
    sudo mkdir -pm755 /etc/apt/keyrings
    sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
    sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/$(lsb_release -cs)/winehq-$(lsb_release -cs).sources
    sudo apt update
    sudo apt install -y --install-recommends winehq-stable

    # Install Bottles via Flatpak
    sudo flatpak install flathub com.usebottles.bottles -y
    echo "Wine and Bottles installed."
}

# Function to install additional packages
install_additional_pkgs() {
    echo "Installing additional packages..."
    sudo add-apt-repository ppa:deadsnakes/ppa -y
    sudo apt install -y python3.13-full
    sudo add-apt-repository ppa:git-core/ppa -y
    sudo apt install -y git
    sudo apt install -y p7zip-full
    echo "Additional packages installed."
}

# Function to install PSL1GHT
install_psl1ght() {
    echo "Installing PSL1GHT..."
    sudo apt-get update
    sudo apt-get install -y p7zip-full git
    cd ~
    mkdir -p PS3DEV
    cd ~/PS3DEV
    git clone git://github.com/HACKERCHANNEL/PSL1GHT
    cd psl1ght
    export PSL1GHT=~/PS3DEV/psl1ght/build
    make
    make install
    echo "PSL1GHT installed."
}

# Function to change user password
change_password() {
    echo "Changing password for user mif0s..."
    sudo passwd mif0s
    echo "Password changed."
}

# Function to select and install KDE Plasma
install_kde_plasma() {
    echo "Selecting KDE Plasma installation option..."

    # Select installation option
    echo "1. Reinstall KDE Plasma (remove GNOME if present)"
    echo "2. Install KDE Plasma alongside GNOME"
    read -p "Choose an option (1 or 2): " kde_option

    if [[ "$kde_option" == "1" ]]; then
        echo "Reinstalling KDE Plasma..."
        sudo apt update
        sudo apt remove --purge gnome-shell* -y
    elif [[ "$kde_option" == "2" ]]; then
        echo "Installing KDE Plasma alongside GNOME..."
    else
        echo "Invalid option. Reinstalling KDE Plasma by default."
        sudo apt update
        sudo apt remove --purge gnome-shell* -y
    fi

    # Select KDE Plasma version
    read -p "KDE Plasma version (l - latest, or enter a specific version, e.g., 5.27): " kde_version
    if [[ "$kde_version" == "l" || "$kde_version" == "latest" ]]; then
        kde_version="latest"
    else
        kde_version="$kde_version"
    fi

    # Select KDE Plasma type
    read -p "KDE Plasma type (s - standard, a - active): " kde_type
    if [[ "$kde_type" == "s" || "$kde_type" == "standard" ]]; then
        kde_package="kde-plasma-desktop"
    elif [[ "$kde_type" == "a" || "$kde_type" == "active" ]]; then
        kde_package="plasma-active"
    else
        echo "Invalid type selected. Installing standard KDE Plasma."
        kde_package="kde-plasma-desktop"
    fi

    if [[ "$kde_version" != "latest" ]]; then
        echo "Adding PPA for specific KDE Plasma version..."
        sudo add-apt-repository ppa:kubuntu-ppa/backports -y
        sudo apt update
    fi

    sudo apt install -y "$kde_package"
    sudo apt autoremove -y
    echo "KDE Plasma installed. Rebooting system..."
    reboot
}

# Function to install other DEs
install_other_des() {
    echo "Installing other DEs..."
    sudo apt install -y gnome-shell
    sudo apt install -y cinnamon-desktop-environment
    sudo apt install -y xfce4
    sudo apt install -y mate-desktop-environment
    sudo apt install -y lxde
    sudo apt install -y kde-plasma-desktop
    sudo apt install -y enlightenment
    sudo apt install -y lxqt
    sudo apt install -y sugar-desktop
    sudo apt install -y trinity-desktop-environment
    echo "Other DEs installed."
}

# Function to install libraries for development
install_dev_libraries() {
    echo "Installing libraries for development..."
    sudo apt install -y libgtk-3-dev
    sudo apt install -y libqt5-dev
    sudo apt install -y libkf5-dev
    sudo apt install -y libgnome-dev
    sudo apt install -y libwebkitgtk-dev
    sudo apt install -y libjavascriptcore-dev
    sudo apt install -y libdbus-1-dev
    sudo apt install -y libpulse-dev
    sudo apt install -y libalsa-dev
    sudo apt install -y libgstreamer1.0-dev
    sudo apt install -y libgstreamer-plugins-base1.0-dev
    sudo apt install -y libgstreamer-plugins-good1.0-dev
    sudo apt install -y libgstreamer-plugins-ugly1.0-dev
    echo "Libraries for development installed."
}

# Function to install games
install_games() {
    echo "Installing games..."
    sudo apt install -y steam
    sudo apt install -y dosbox
    sudo apt install -y scummvm
    sudo apt install -y wine-stable
    sudo apt install -y playonlinux
    sudo apt install -y lxdm
    sudo apt install -y gnome-games
    sudo apt install -y kdegames
    sudo apt install -y plasma-widgets-addons
    echo "Games installed."
}

# Function to install launchers
install_launchers() {
    echo "Installing launchers..."
    sudo apt install -y gnome-launcher
    sudo apt install -y kde-launcher
    sudo apt install -y xfce4-launcher
    sudo apt install -y mate-launcher
    sudo apt install -y lxlauncher
    echo "Launchers installed."
}

# Function to install stores
install_stores() {
    echo "Installing stores..."
    sudo apt install -y gnome-software
    sudo apt install -y snap-store
    sudo apt install -y flatpak
    sudo apt install -y appstream
    sudo apt install -y appstream-index
    sudo apt install -y software-center
    echo "Stores installed."
}

# Function to install VM programs
install_vm_programs() {
    echo "Installing VM programs..."
    sudo apt install -y virt-manager
    sudo apt install -y virtualbox
    sudo apt install -y qemu
    echo "VM programs installed."
}

# Function to create and run app.py
create_and_run_app() {
    echo "Creating app.py..."

    # Get the current distribution name
    distro_name=$(lsb_release -is)
    distro="$distro_name-Rupy2.2"

    cat << EOF > /home/$USER/app.py
import sys
from PyQt6.QtWidgets import QApplication, QWidget, QVBoxLayout, QLabel, QPushButton
from platform import system, machine

class CongratsApp(QWidget):
    def __init__(self):
        super().__init__()
        self.initUI()

    def initUI(self):
        self.setWindowTitle("Congratulations")
        self.setGeometry(100, 100, 300, 150)

        layout = QVBoxLayout()

        # Get system information
        distro = "$distro"
        arch = machine()

        # Create message
        message = f"Congratulations on installing {distro} x{arch}"
        label = QLabel(message)
        layout.addWidget(label)

        # "OK" button
        ok_button = QPushButton("OK")
        ok_button.clicked.connect(self.close)
        layout.addWidget(ok_button)

        self.setLayout(layout)

if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = CongratsApp()
    window.show()
    sys.exit(app.exec())
EOF

    echo "Running app.py..."
    python3 /home/$USER/app.py
}

# Main script
echo "Welcome to NeoLinux!"

# Install PyQt6 if not already installed
install_pyqt6

# Install Snap applications
install_snap_apps

# Install Flatpak and applications
install_flatpak

# Install Java
install_java

# Install Wine and Bottles
install_wine_bottles

# Install additional packages
install_additional_pkgs

# Install PSL1GHT
install_psl1ght

# Install ADB and Fastboot
install_adb_fastboot

# Change user password
change_password

# Install KDE Plasma
install_kde_plasma

# Install other DEs
install_other_des

# Install libraries for development
install_dev_libraries

# Install games
install_games

# Install launchers
install_launchers

# Install stores
install_stores

# Install VM programs
install_vm_programs

# Create and run app.py
create_and_run_app

# System update
echo "System update..."
sudo apt update
sudo apt upgrade -y

# Completion
echo "NeoLinux 1.1 installation complete."
