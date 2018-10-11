VirtualBox Preferences
----------------------

File -> Preferences -> Default Machine Folder

Windows Guest Additions
-----------------------

1. Install Windows
1. UAC
1. Devices -> Insert Guest Additions CD image
1. Install Guest Additions
1. Devices -> Optical Drives -> Remove disk from virtual drive
1. Devices -> Shared Folders -> Shared Folders Settings
1. Add new shared folder
1. Folder Path `D:\VirtualBox Shared`
1. Make Permanent `True`
1. Access `\\Vboxsvr\VirtualBox Shared`
1. Snapshot

Linux Guest Additions
------------------------

1. Start virtual machine
1. Press `Right Ctrl` + `F1`, then `Right Ctrl` + `F7`
1. Install Guest Additions

        sudo apt install virtualbox-guest-utils

1. Devices -> Shared Folders -> Shared Folders Settings
1. Add new shared folder
1. Folder Path `D:\VirtualBox Shared`
1. Mount the folder in the Linux guest

        sudo mount -t vboxsf VirtualBox_Shared /mnt

References
----------

http://wiki.archlinux.org/index.php/VirtualBox#Enable_shared_folders

Further reading
---------------

http://unix.stackexchange.com/questions/310620/-/429134
