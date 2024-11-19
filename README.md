.....................................................................................................................................................
THE install.sh FILE IS MAINLY TO INSTALL PACKAGES NEEDED ON SETTING UP THE MACHINE. E.G (on MacOS)
.....................................................................................................................................................




#below is just instructions on how to successfully execute the install.sh file on your machine

= first : download the file to your root location / clone the file to your root location on the terminal
= secondly: run the below command on the same location

            chmod +x install.sh    (press enter)


otherwise always make sure you specify the location of the file if is not root. e.g  (chmod +x /mylocation/install.sh)

then now you can be able to run/execute the file:

on your terminal: ./install.sh   (press enter)


.....................................................................................................................................................
BELOW IS SIMPLE STEPS TO SET UP CONNECTION TO CHEF ORGANISATION ({}."the full dns name of the organization".co.za)
......................................................................................................................................................

1. download chef-starter kit on the chef organization you want to establish connection with  (assuming you have been granted access to chef)
2. go to the file you downloaded
3. unzip the file
4. cd into unzipped folder
5. cd chef-repo
6. copy (ctrl+c) the .chef file
7. go back to your C: location
8. cd users
9. cd a-number
10. save (ctr+v) the .chef file here
11. on your terminal
12. command:  knife ssl fetch         (obviously you must be on citrix)
13. after the above command is successful, you can check the copied .chef file if now has trusted_certs file, if so. then you are good to go
14. now you can access and interact with virtual machines on chef.




..............................................................................................................................................
FOR CENTOS/RHEL LINUX DISTRIBUTIONS
...............................................................................................................................................

if having installing VSCode, you get some issues:
do the following:
1.                sudo vi /etc/yum.repos.d/vscode.repo
2.                sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
3. Add the below-given content in vscode.repo – :
                

[code]

name=Visual Studio Code

baseurl=https://packages.microsoft.com/yumrepos/vscode

enabled=1

gpgcheck=1

gpgkey=https://packages.microsoft.com/keys/microsoft.asc




4. Save and exit the vscode.repo.
5. Install the latest version of Visual Studio Code with this command – 

                sudo yum install code  



