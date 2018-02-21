echo "Installing Firefox\n"
sudo pacman -S firefox opera gst-plugins-ugly
echo "\n"

echo "Installing yaourt\n"
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
echo "\n"

echo "Installing Emacs and Sublime\n"
sudo pacman -S emacs
yaourt -S sublime-text-dev
echo "\n"

echo "Installing MS Fonts\n"
yaourt -S ttf-ms-fonts
echo "\n"

echo "Installing Musescore\n"
sudo pacman -S musescore
echo "\n"

echo "Installing R (last version available) and Tex and JDK and Eclipse\n"
sudo pacman -S r texlive-most texlive-langextra texstudio jdk8-openjdk eclipse-java
echo "\n"

echo "Making Java work in R\n"
sudo R CMD javareconf
echo "\n"

echo "Installing RStudio\n"
yaourt -S rstudio-desktop-bin
echo "\n"

echo "Packages necessary to R leaflet\n"
yaourt -S udunits gdal proj
echo "\n"

echo "Installing Python Anaconda\n"
cd Downloads
wget https://repo.continuum.io/archive/Anaconda3-5.1.0-Linux-x86_64.sh
bash Anaconda3-5.1.0-Linux-x86_64.sh
cd ..
yaourt -S libselinux
echo "\n"

echo "Installing Spotify\n"
gpg --keyserver hkps://pgp.mit.edu --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
yaourt -S spotify
echo "\n"

echo "Installing Skype"
yaourt -S skypeforlinux-stable-bin

echo "Installing some important libraries\n"
sudo pacman -S ntfs-3g gcc-fortran auctex pandoc pandoc-citeproc pandoc-crossref
echo "\n"

echo "DONE!!!"
