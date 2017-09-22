echo "Installing Firefox\n\n"
sudo pacman -S firefox opera gst-plugins-ugly
echo "\n\n"

echo "Installing yaourt\n\n"
sudo pacman -S --needed base-devel git wget yajl
git clone https://aur.archlinux.org/package-query.git
cd package-query
makepkg -si
cd ..
git clone https://aur.archlinux.org/yaourt.git
cd yaourt 
makepkg -si
cd ..
sudo rm -dR yaourt/ package-query/
echo "\n\n"

echo "Installing Emacs and Sublime\n\n"
sudo pacman -S emacs
yaourt -S sublime-text-dev
echo "\n\n"

echo "Installing MS Fonts\n\n"
yaourt -S ttf-ms-fonts
echo "\n\n"

echo "Installing Musescore\n\n"
sudo pacman -S musescore
echo "\n\n"

echo "Installing R (last version available) and Tex and JDK and Eclipse\n\n"
sudo pacman -S r texlive-most texlive-langextra texstudio jdk8-openjdk eclipse-java
echo "\n\n"

echo "Making Java work in R\n\n"
sudo R CMD javareconf
echo "\n\n"

echo "Installing RStudio\n\n"
yaourt -S rstudio-desktop-bin
echo "\n\n"

echo "Installing Python Anaconda\n\n"
cd Downloads
wget https://repo.continuum.io/archive/Anaconda3-4.4.0-Linux-x86_64.sh
bash Anaconda3-4.4.0-Linux-x86_64.sh
cd ..
yaourt -S libselinux
echo "\n\n"

echo "Installing Spotify\n\n"
gpg --keyserver hkps://pgp.mit.edu --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
yaourt -S spotify
echo "\n\n"

echo "Installing some important libraries\n\n"
sudo pacman -S ntfs-3g gcc-fortran
echo "\n\n"

echo "DONE!!!"
