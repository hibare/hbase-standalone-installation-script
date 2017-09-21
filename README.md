=================================================================================
+               Install Apache Hbase on UBUNTU in standalone mode               +
=================================================================================
                       mmm  mmmmm          mmmm m     m
                     m"   " #   "#  m""#m "   "# "m m" 
                     #      #mmmm" #  mm#     m"  "#"  
                     #      #   "m # #  #   m"     #   
                      "mmm" #    " #m """ m#mmmm   #   
                                    "mmm               
                
                    Developed by: Shubham Hibare (CR@2Y)
                        website: http://hibare.in
                    Linkedin: https://linkedin.com/in/hibare
                        Github: https://hibare.github.io
                            License: MIT License
=================================================================================
What it is?
It is a shell script to install Apache Hbase on UBUNTU in standalone mode. This script is tested on UBUNTU 16.04 LTS and works perfectly on the test machine. 
This shell script is expected to work on any version of UBUNTU.

How to use this script?
Step 1: Clone this repository. After cloning, you'll have these three files in the directory: install.sh, LICENSE.txt and README.md. 

Step 2: Download the latest version of JDK for Linux and Apache Hbase. After downloading copy these two files to the directory where above three files resides.
At the end of this step you'll have five files in the directory.

Step 3: Open install.sh file using your favorite text editor like vim, nano or gedit.
Go to line numbered 48 and replace "jdk-8u112-linux-x64.tar.gz" (without quotes) with the name of the JDK file you have just downloaded. Now go to line numbered 66 and replace "hbase-0.94.8.tar.gz" (without quotes) with the name of the Hbase file you have just downloaded.

Step 4: Fire-up a terminal and get super user access (root access). Navigate to the directory where the above files resides and run the command "sh install.sh" (without quotes). Sit back and relax. Wait for the installation process to complete which usually takes not more than 10 minutes. When the process is complete without any errors use standard Hbase commands to interct with Apache Hbase.

Disclaimer: Author of this script is not responsible for any damage caused to your system from using this script. Use this script at your own risk.

Note: For any errors and queries contact from here- http://hibare.in.
