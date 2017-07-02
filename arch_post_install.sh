printf "Installing Firefox\n\n"
sudo pacman -S firefox

printf "Installing Opera\n\n"
sudo pacman -S opera

printf "Installing yaourt\n\n"
sudo pacman -S --needed base-devel git wget yajl
git clone https://aur.archlinux.org/package-query.git
cd package-query
makepkg -si
cd ..
git clone https://aur.archlinux.org/yaourt.git
cd yaourt makepkg -si
cd ..
sudo rm -dR yaourt/ package-query/

printf "Installing Emacs and Sublime\n\n"
sudo pacman -S emacs
yaourt -S sublime-text-dev

printf "Installing MS Fonts\n\n"
yaourt -S ttf-ms-fonts

printf "Installing Musescore\n\n"
sudo pacman -S musescore

printf "Installing R (last version available)\n\n"
sudo pacman -S r

printf "Installing LaTeX\n\n"
sudo pacman -S texlive-most texlive-langextra
sudo pacman -S texstudio

printf "Installing Java and Eclipse\n\n"
sudo pacman -S jdk8-openjdk
sudo pacman -S eclipse-java

printf "Making Java work in R\n\n"
sudo R CMD javareconf

printf "Installing RStudio\n\n"
yaourt -S rstudio-desktop-bin

printf "Installing Python Anaconda\n\n"
cd Downloads
wget http://repo.continuum.io/archive/Anaconda3-4.4.0-Linux-x86_64.sh
bash Anaconda3-4.4.0-Linux-x86_64.sh
cd ..

printf "Installing Spotify\n\n"
gpg --keyserver hkps://pgp.mit.edu --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
yaourt -S spotify

printf "Installing some important libraries\n\n"
sudo pacman -S ntfs-3g gcc-fortran

