echo "Installing Firefox\n\n"
sudo pacman -S firefox

echo "Installing Opera\n\n"
sudo pacman -S opera

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

echo "Installing Emacs and Sublime\n\n"
sudo pacman -S emacs
yaourt -S sublime-text-dev

echo "Installing MS Fonts\n\n"
yaourt -S ttf-ms-fonts

echo "Installing Musescore\n\n"
sudo pacman -S musescore

echo "Installing R (last version available)\n\n"
sudo pacman -S r

echo "Installing LaTeX\n\n"
sudo pacman -S texlive-most texlive-langextra
sudo pacman -S texstudio

echo "Installing Java and Eclipse\n\n"
sudo pacman -S jdk8-openjdk
sudo pacman -S eclipse-java

echo "Making Java work in R\n\n"
sudo R CMD javareconf

echo "Installing RStudio\n\n"
yaourt -S rstudio-desktop-bin

echo "Installing Python Anaconda\n\n"
cd Downloads
wget https://repo.continuum.io/archive/Anaconda3-4.4.0-Linux-x86_64.sh
bash Anaconda3-4.4.0-Linux-x86_64.sh
cd ..

echo "Installing Spotify\n\n"
gpg --keyserver hkps://pgp.mit.edu --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
yaourt -S spotify

echo "Installing some important libraries\n\n"
sudo pacman -S ntfs-3g gcc-fortran

