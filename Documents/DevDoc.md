# Welcome to OAPS-Jifry

**OAPS-Jifry** is a re-implementation of [OAPS](https://github.com/youmowang/zjnuservice) by Yun Dabang, and Ni Zhongjie, as OOAD Fall 2018 course project, using [JSP](https://en.wikipedia.org/wiki/JavaServer_Pages) technology.


# How to contribute

Currently, this project is maintained by team **MIJC** (Mahdi,IBRAHIM,Jifry, and Clive) and everyone else is welcomed to join us and help us to improve the project by any means.

## Add Your Information to the Contributor List

Clone the main repository:

    $git clone https://github.com/lanlab-org/OAPS-Jifry
Edit the **README.md** file, append your:

> github account - Name - Student ID

to the contributor list.

Then, add your changes to the master repository, 

    $git add .
commit the changes, 

    $git commit -m "your commit message"
   and push them to the master repository.

    $git push origin master
## Development Plan with KanBan
For more information about the project's maintenance progress and to get a visual representation of the whole plan, see  [the project board on Kanboard](http://118.25.96.118/kanboard/?controller=BoardViewController&action=readonly&token=80ecf8f431a8dfafbc437dbc621b98d1c37c02790fd89f9cedc49a4c8d36).
If you would like to join us on KanBoard, contact (lanhui at zjnu.edu.cn) to create an account for you, then contact (1525200991 at qq.com) to invite you to our project borad.
## Which Area in the Project to Contribute to

If you wish to contribute to the source code see section **"Project Environment"**.
However, if you wish to contribute to the project's documentation, homepage, etc, of the non-source-code-related areas. You can skip **"Project Environment"** section.

## Project Environment

This project was developed using JSP and a number of other libraries and components. In order to run the project on your machine; you'll need to setup the appropriate environment.
The following is a list of the current running environment:
* [Eclipse Jee 2019-09 IDE](https://www.eclipse.org/downloads/packages/release/2019-09/r)
* [Apache Tomcat v7.0](https://tomcat.apache.org/download-70.cgi)
* [JDK-13](https://www.oracle.com/java/technologies/javase-jdk13-downloads.html)
* [Jstl-1.2](https://www.oracle.com/technetwork/java/index-137889.html)
* [mysql-connector-java-8.0.12](https://dev.mysql.com/downloads/connector/j/)
* [commons-fileupload-1.3](http://commons.apache.org/proper/commons-fileupload/download_fileupload.cgi)
* [commons-io-2.4](https://commons.apache.org/proper/commons-io/download_io.cgi)

**NOTE**: This is the current running system environment, there might be newer versions of any component, and you might use newer versions if you like.
Also we would like to assume that you know how to setup the aforementioned components. If not, you can look it up on the internet.

After you have finished setting up the environment, and everything is up and running, see the following section to understand our contribution policy.
## Follow the Feature-branching Workflow

In this collaborative project development, we are trying to protect the central repository from unreasonable changes that may break the whole system, or may cause inconsistency in the repository. Hence, we follow the feature-branching workflow (please, see this section *[The feature-branching workflow](https://github.com/spm2020spring/TeamCollaborationTutorial/blob/master/team.rst)* for a tutorial on how to get started with this technique).
Simply, any change you may would like to do must be done on a separate branch, so that the change you made is being reviewed by a number of contributors to spot any problems or point some bugs in the change it self before it gets approved.
After the change you made is approved, the change then will be merged to the central repository.
**Each branch should be dedicated to a single change.**
## Report a Bug
Use this [Bugzilla bug-tracker list](http://118.25.96.118/bugzilla/buglist.cgi?component=Jifry&list_id=305&product=OAPS&resolution=---) to file bugs on OAPS-Jifry.
