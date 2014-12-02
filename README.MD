# PyJenkinsCI
=========

PyJenkinsCI is a test Jenkins Continuous Integration (CI) for Python projects.
This project runs standard code quality checks, and a JMeter stress performance
test. ***This project should not be deployed into production!!!*** It is for
demonstration and learning uses only. ***Only run this locally!!!***

## Run test project
- git clone project into ~/Sites folder
- go into "/vagrant" folder, run "vagrant up"
- wait for provisioning to finish
- open browser, go to "http://127.0.0.1:8080"
- click on "discover-flask-vagrant"
- click "Build Now"
- wait for project to buid








## Add Another Jenkins Project

If you would like to add your own project, here are the steps to take:

***Create New Project***
- Item name: discover-flask-vagrant
- Freestyle Project

***Source Code Management***
- Source Code Management: Git
- Repository URL: https://github.com/apolloclark/discover-flask-vagrant

### Build
- "Add build step"
- Execute shell
- Command: "sh /vagrant/build.sh"

### Post-build Actions
***Report Violations***
- pylint: **/pylint.out

***Publish JUnit test result report***
- Test report XMLs: **/nosetests.xml

***Public Cobertura Coverage Report***
- Cobertura xml report pattern: **/coverage.xml

***Publish SLOCCount analysis results***
- SLOCCount reports: **/sloccount.sc

***Publish Performance test result report***
- Add a new report > JMeter
- Report files: **/jmeter.jtl

***Save***

***Build Now***

***Enjoy the show!***

***References***

http://www.alexconrad.org/2011/10/jenkins-and-python.html
http://bhfsteve.blogspot.com/2012/04/automated-python-unit-testing-code_27.html
http://www.wallix.org/2011/06/29/how-to-use-jenkins-for-python-development/