#!/bin/bash

# Проверка на root
if [ "$(id -u)" -ne 0 ]; then
    echo "Запустите скрипт от root (sudo)!" >&2
    exit 1
fi

# Обновление системы
echo "🔄 Обновление системы..."
apt update && apt upgrade -y

# Установка базовых пакетов (KDE Plasma)
echo "📦 Установка KDE Plasma..."
apt install -y kubuntu-desktop sddm

# Включение SDDM (графический вход)
systemctl enable sddm

# Установка дополнительных программ
echo "📦 Установка софта..."
apt install -y \
    chromium-browser neofetch python3 python3-pip steam firefox telegram-desktop discord obs-studio qbittorrent \
    virtualbox retroarch libreoffice gcc vlc flatpak snapd \
    pcsx2 rpcs3

# Установка эмуляторов (из PPA)
echo "🕹️ Установка эмуляторов..."
add-apt-repository -y ppa:flexiondotorg/ares
apt update
apt install -y ares

# Настройка Flatpak и Snap
echo "📦 Настройка Flatpak и Snap..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
systemctl enable --now snapd.socket

# Установка тем (Win11, macOS)
echo "🎨 Установка тем KDE..."
git clone --depth=1 https://github.com/yeyushengfan258/Win11OS-kde /tmp/Win11OS-kde
cd /tmp/Win11OS-kde
./install.sh
cd ~

git clone --depth=1 https://github.com/yeyushengfan258/We10XOS-kde /tmp/We10XOS-kde
cd /tmp/We10XOS-kde
./install.sh
cd ~

# Установка иконок
echo "🖼️ Установка иконок..."
git clone --depth=1 https://github.com/yeyushengfan258/Win11-icon-theme /tmp/Win11-icons
cd /tmp/Win11-icons
./install.sh
cd ~

git clone --depth=1 https://github.com/yeyushengfan258/BigSur-icon-theme /tmp/BigSur-icons
cd /tmp/BigSur-icons
./install.sh
cd ~

# GTK-темы (для совместимости)
git clone --depth=1 https://github.com/vinceliuice/WhiteSur-gtk-theme /tmp/WhiteSur
cd /tmp/WhiteSur
./install.sh
cd ~

# Установка обоев
echo "🌄 Установка обоев..."
mkdir -p /usr/share/wallpapers/NeoLinux
curl -L "https://example.com/your-wallpaper.jpg" -o /usr/share/wallpapers/NeoLinux/default.jpg
chmod 644 /usr/share/wallpapers/NeoLinux/default.jpg

# Настройка KWin (закруглённые углы)
echo "🔧 Настройка KWin (закруглённые углы)..."
mkdir -p ~/.config
cat > ~/.config/kwinrc <<EOL
[Windows]
BorderlessMaximizedWindows=true
CornerRadius=12
EOL

# Установка zapret (обход блокировок)
echo "🔓 Установка zapret..."
git clone https://github.com/bol-van/zapret /tmp/zapret
cd /tmp/zapret
./install.sh
cd ~

# Готово!
echo "✅ Neo Linux установлен! Перезагрузите систему."
