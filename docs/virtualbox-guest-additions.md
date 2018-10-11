VirtualBox Preferences
----------------------

1. File
2. Preferences
3. Default Machine Folder

Windows Guest Additions
-----------------------

1. Install Windows
2. UAC
3. Devices -> Insert Guest Additions CD image
4. Install Guest Additions
5. Devices -> Optical Drives -> Remove disk from virtual drive
6. Devices -> Shared Folders -> Shared Folders Settings
7. Add new shared folder
8. Folder Path `D:\VirtualBox Shared`
9. Make Permanent `True`
10. Access `\\Vboxsvr\VirtualBox Shared`
11. Snapshot

Linux Guest Additions
------------------------

1. Start virtual machine
2. Press `Right Ctrl` + `F1`, then `Right Ctrl` + `F7`
3. Install Guest Additions

        sudo apt install virtualbox-guest-utils

4. Devices -> Shared Folders -> Shared Folders Settings
5. Add new shared folder
6. Folder Path `D:\VirtualBox Shared`
7. Mount the folder in the Linux guest

        sudo mount -t vboxsf VirtualBox_Shared /mnt

References
----------

http://wiki.archlinux.org/index.php/VirtualBox#Enable_shared_folders

Further reading
---------------

http://unix.stackexchange.com/questions/310620/-/429134
