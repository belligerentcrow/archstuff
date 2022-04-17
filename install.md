# Partition and essential set-up - the "hard stuff"

$ ping gnu.org
    >makes sure that the internet connection works

$ timedatectl set-ntp true  
    >sync the clock

$ lsblk 
    >shows attached devices
    >pay attention to name and size columns

$ cfdisk /dev/sda
    >enter partition mode
    >if virtualmachine choose dos label, else look it up
    >128M of boot partition (make it bootable and primary)
    >then partition the rest (make it primary)
    >check again lsblk after 

$ mkfs.ext4 /dev/sda1 

$ mkfs.ext4 /dev/sda2

$ mount /dev/sda2 /mnt 
    >mounts primary

$ mkdir /mnt/boot
    >creates directory for the boot

$ mount /dev/sda1 /mnt/boot
    > check with lsblk


# Pacstrap startup 

$ pacstrap /mnt base base-devel vim linux linux-firmware firefox man-db man-pages
    > base = tools; base-devel = more tools; linux = kernel; linux-firmware = firmware, duh; vim = text editor; firefox = just cause; 
(dmenu rxvt-unicode ranger pcmanfm code cmatrix) for later

# Some more set-up before the fun stuff

$ genfstab /mnt 
    > generate a file that the os will load on boot

$ genfstab -U /mnt >> /mnt/etc/fstab 
    > spit it out into a file 

# Chrooting away + some more tools

$ arch-chroot /mnt /bin/bash
    > from the virtual cddrive into the arch installation! try pwd or ls 

$ pacman -S networkmanager grub neofetch
    > install the networkmanager and also grub for grubbing startup, neofetch because it's the law

$ systemctl enable NetworkManager 
    > enable internet at startup

$ grub-install /dev/sda
    > not sda1 or sda2. just sda.

$ grub-mkconfig -o /boot/grub/grub.cfg
    > check the output, make sure there are no errors and that it says "found initrd/linux image" 


# Some security + more file setup

$ passwd 
    > choose a password for the root user

$ vim /etc/locale.gen
    > generate the locale (the language)
    > search and decomment your choice (es: en_US ISO-8859-1 and also en_US.UTF-8 UTF-8)
    > :wq!

$ locale-gen
    >it generates it 

$ vim /etc/locale.conf
    > type: "LANG=en-US.UTF-8" without the "", or whatever language u want to use, then :wq

$ vim /etc/hostname
    > set hostname
    > just type the name, like "archie" without "", then :wq

$ ln -sf /usr/share/zoneinfo/Europe/Rome /etc/localtime
    > link the correct timezone
    > tab to autocomplete
    > connects it to localtime

optional: change keymap
$ vim /etc/vconsole.conf
    > type "KEYMAP=*", where * is your chosen layout, without ""s. Then :wq
 
$ exit
    >de-chrooting

$ reboot 
    > just cause

# User stuff

    >login (as root, with your chosen password), neofetch for good measure

$ useradd -mg wheel YOURUSERNAME
    > create an user 
    > -m is to create the useful home directories, -g is to specify the group we want to add the user to 

$ passwd YOURUSERNAME
    > sets the user password

$ vim /etc/sudoers
    > give the user sudo priviledges
    > go to "Uncomment to allow members of group wheel to execute any command" and uncomment %wheel ALL=(ALL) ALL  
    > also add "Defaults !tty_tickets" without ""s if you want the system not to ask you again the password for using sudo if you've used it recently
    > :wq! 

$
# Graphical environment! I'm going with i3-gaps

$ sudo pacman -S xorg-server xorg-xinit 
    > needed to install graphical stuff + font + file managers

$ sudo pacman -S i3 
    >choose i3-gaps, i3blocks, i3lock, i3status 

$ sudo pacman -S ttf-inconsolata pcmanfm ranger rxvt-unicode dmenu picom  lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings feh imagemagick python-pip python-pywal git expac yajl cairo libxcb python2 xcb-proto xcb-util-image xcb-util-wm xcb-util-xrm jsoncpp

$ sudo systemctl enable lightdm 

# install yay and polybar

$ cd && mkdir -p /tmp/yay_install && cd /tmp/yay_install

$ git clone https://aur.archlinux.org/yay.git && cd yay 

$ makepkg -si 

$ cd 

$ rm -rf /tmp/yay_install

$ sudo pacman -S 

$ yay -S polybar-git
$

# Solving some more issues

$ xrandr 
    > see what the monitor's name is and the display options

$ xrandr --output MONITORNAME --mode PREFERREDDISPLAYOPTION

# copy the dot config files from github
