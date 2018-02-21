echo "Installing Firefox"
echo ""
sudo pacman -S firefox opera gst-plugins-ugly
echo ""

echo "Installing yaourt"
echo ""
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
echo ""

echo "Installing Emacs and Sublime"
echo ""
sudo pacman -S emacs
yaourt -S sublime-text-dev
echo ""

echo "Installing MS Fonts"
echo ""
yaourt -S ttf-ms-fonts
echo ""

echo "Installing Musescore"
echo ""
sudo pacman -S musescore
echo ""

echo "Installing R (last version available) and Tex and JDK and Eclipse"
echo ""
sudo pacman -S r texlive-most texlive-langextra texstudio jdk8-openjdk eclipse-java
echo ""

echo "Making Java work in R"
echo ""
sudo R CMD javareconf
echo ""

echo "Installing RStudio"
echo ""
yaourt -S rstudio-desktop-bin
echo ""

echo "Packages necessary to R leaflet"
echo ""
yaourt -S udunits gdal proj
echo ""

echo "Installing Python Anaconda"
echo ""
cd Downloads
wget https://repo.continuum.io/archive/Anaconda3-5.1.0-Linux-x86_64.sh
bash Anaconda3-5.1.0-Linux-x86_64.sh
cd ..
yaourt -S libselinux
echo ""

echo "Installing Spotify"
echo ""
gpg --keyserver hkps://pgp.mit.edu --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
yaourt -S spotify
echo ""

echo "Installing Skype"
echo ""
yaourt -S skypeforlinux-stable-bin
echo ""

echo "Installing some important libraries"
echo ""
sudo pacman -S ntfs-3g gcc-fortran auctex pandoc pandoc-citeproc pandoc-crossref
echo ""

echo "DONE!!!"
