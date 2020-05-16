# OAPS-Jifry User documentation


## How to install and Setup the environment
### Download the Eclipse Installer

Download Eclipse Installer from  [http://www.eclipse.org/downloads](https://eclipse.org/downloads) 

### Start the Eclipse Installer executable

For Windows users, after the Eclipse Installer executable has finished downloading it should be available in your download directory. Start the Eclipse Installer executable. You may get a security warning to run this file. If the Eclipse Foundation is the Publisher, you are good to select Run.

For Mac and Linux users, you will still need to unzip the download to create the Installer. Start the Installer once it is available.

### Select the package to install

The new Eclipse Installer shows the packages available to Eclipse users. You can search for the package you want to install or scroll through the list.

### Select your installation folder

Specify the folder where you want Eclipse to be installed. The default folder will be in your User directory.

Select the ‘Install’ button to begin the installation.

### Launch Eclipse

Once the installation is complete you can now launch Eclipse. The Eclipse Installer has done it's work. Happy coding.

### Importing file
Launch Eclipse IDE and select ‘Import’ from ‘File’ menu

In the displayed ‘Import’ dialog, expand the ‘General’ folder. Select ‘Existing’ Projects into Workspace’ and click ‘Next’

This will display the ‘Import Projects’ dialog box. Choose ‘select archive file’ option and click ‘Browse’.

Navigate to the folder of the exported file. Select the file and click ‘Open’.

In the ‘Import Projects’ dialog, ensure that browsed path is displayed. Click ‘Finish’.

Ensure that the imported project is displayed in the Eclipse IDE

### Apache Tomcat

If you do not have Apache Tomcat on your machine, you will first need to download and unzip [Apache Tomcat](http://jakarta.apache.org/tomcat/)

 Start the Eclipse WTP workbench.
Open  **Window -> Preferences -> Server -> Installed Runtimes** to create a Tomcat installed runtime.
Click on  **Add...**  to open the  **New Server Runtime**  dialog, then select your runtime under  **Apache**
Click **Next** , and fill in your **Tomcat installation directory** 
Ensure the selected **JRE** is a full JDK and is of a version that will satisfy Apache Tomcat 1.  If necessary, you can click on  **Installed JREs...**  to add JDKs to Eclipse.
Click  **Finish**  .

### JDK  Jstl On windows 10
Download from [oracle.com](https://www.oracle.com/technetwork/java/javase/downloads/index.html)
Step 1:**  Open  **C Drive > Program Files**  folder and look for  **Java** folder and open it.

Step 2:  **Inside the Java folder you will find a jdk-XX** folder, open it and open the  **bin** folder,  **copy the path of bin folder**.

Note:- Now you have to set the environment variable.

Step 3:  For that Go to **Control Panel > System and Security > System > Advanced System Setting > Environment Variables**

Step 4:Under **System variable**, you will find “**PATH**” just select it and click on **edit.** Now click on **New** and **add the bin folder location**, after that click on “**OK**“.

For the JSTL it is the same process

### mysql-connector-java

In eclipse, open **Window -> Show View -> Data Source Explorer**
Right click on the above database option and select “New” for creating the new connection from the database
Select the MySQL version to be configured
If you don’t have the JAR files added, please add it manually by clicking on the “Add Jar/Zip” button.
click on the button “Test Connection”, it will test the connection with database.

## How to use the website
### Post an article
On the website's homepage, you'll see several subjects, you can click on one of the subjects, e.g., *Physical Science*:
![screenshot1](Documents/screenshots/s1.png)

Type your **email address**, and click "**Post Article**":
![screenshot2](Documents/screenshots/s2.png)

Fill in the following required fields:
![screenshot3](Documents/screenshots/s3.png)
Note:- The file format must be PDF only.

Then, click "**Post**".

You article now is successfully posted, and you can also see the article's description by clicking on the article's name from the subject list:
![screenshot4](Documents/screenshots/s4.png)

### Edit or delete your own articles
From the navigation bar above, click on "**Author**":
![screenshot5](Documents/screenshots/s5.png)

You can login if you are already registered as an author on the website, if not, click on "**register**":
![screenshot6](Documents/screenshots/s6.png)
Note:- You should register with the same email you have used when published your articles.

![screenshot7](Documents/screenshots/s7.png)
Click "**register**", then login.

After you login, you'll see a list of articles you have published using this email you logged in with. For each article you can perform either, "**Edit**", or "**Delete**":
![screenshot8](Documents/screenshots/s8.png)

Click on "**Edit**":
![screenshot9](Documents/screenshots/s9.png)
Now you can edit the article's description.
When you finish, click "**Update**":

Finally, the highlight is updated:
![screenshot10](Documents/screenshots/s10.png)

Of course, by clicking "**Delete**", the article will be deleted from the website.

## FAQ
In this frequently asked questions section, we attempt to answer some of the special questions that you may want to ask after reading this document.
### What is OAPS-Jifry ?
**OAPS-Jifry** is a re-implementation of the **OAPS**(Open Access Publishing System)  **[TreeLib](https://github.com/youmowang/zjnuservice)**, using JSP technology. The original TreeLib was implemented using Python programming language.
### Do i need to sign-up ?
Absolutely NO.
OAPS-Jifry, just like OAPS-TreeLib is open access system, that is, you don't need to sign-up, nor login in order to post/view articles. However, in OAPS-Jifry you can register as an author by the same email you used to post an article so you can edit, or delete your articles. This is one of the features that has been newly added to this version.
### Why two implementations of the same system ?
OAPS-TreeLib originated as a **OOAD** (Object Oriented Analysis and Design) fall 2018 course project, developed by Yun Dabang, Ni Zhongjie. Then, in fall 2019, the course project of OOAD was to maintain the same project of the previous year. Due to programming language barrier — the project was written by Python and most of 2019 students didn't learn or study Python. Jifry decided to re-implement the system from scratch using what he knows best **JSP**.
### I have a question who to ask ?
If you have a question, you can email your question to (1525200991 at qq.com).
