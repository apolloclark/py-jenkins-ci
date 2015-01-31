#!/bin/bash

# setup folder, permissions
cd /var/www

# run tests
pylint -f parseable project/ > pylint.out
nosetests --with-xcoverage --with-xunit --all-modules --traverse-namespace --cover-package=project --cover-inclusive --cover-erase -x tests.py > /dev/null
clonedigger --cpd-output -o clonedigger.xml project > /dev/null
sloccount --duplicates --wide --details . | fgrep -v .svn > sloccount.sc || :

# copy over test results
export TEST_FOLDER="vagrant@192.168.1.2:/var/lib/jenkins/jobs/discover-flask-vagrant/workspace/"
sshpass -p "vagrant" scp -o StrictHostKeyChecking=no pylint.out $TEST_FOLDER
sshpass -p "vagrant" scp nosetests.xml $TEST_FOLDER
sshpass -p "vagrant" scp coverage.xml $TEST_FOLDER
sshpass -p "vagrant" scp clonedigger.xml $TEST_FOLDER
sshpass -p "vagrant" scp sloccount.sc $TEST_FOLDER

ps aux

exit 0