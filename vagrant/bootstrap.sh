#!/usr/bin/env bash

# Update Apt-get
sudo apt-get update

# Install various dependencies
sudo apt-get -y install build-essential libreadline-gplv2-dev libncursesw5-dev
sudo apt-get -y install libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev
sudo apt-get -y install libbz2-dev sshpass git-core sloccount


# Install Jenkins
# @see https://wiki.jenkins-ci.org/display/JENKINS/Installing+Jenkins+on+Ubuntu
wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get -y update
sudo apt-get -y install jenkins

# Startup Jenkins
sudo service jenkins start


# Install Jenkins plugins
# @see https://wiki.phpmyadmin.net/pma/Jenkins_Setup
# @see http://updates.jenkins-ci.org/download/plugins/
# @see /var/lib/jenkins/plugins/

# Install Plugins
echo "Installing Jenkins plugins..."
sudo wget -q http://updates.jenkins-ci.org/latest/performance.hpi -P /var/lib/jenkins/plugins/
sudo wget -q http://updates.jenkins-ci.org/latest/cobertura.hpi -P /var/lib/jenkins/plugins/
sudo wget -q http://updates.jenkins-ci.org/latest/violations.hpi -P /var/lib/jenkins/plugins/
sudo wget -q http://updates.jenkins-ci.org/latest/sloccount.hpi -P /var/lib/jenkins/plugins/

# Install Github Plugins, and dependencies
sudo wget -q http://updates.jenkins-ci.org/latest/github-api.hpi -P /var/lib/jenkins/plugins/
sudo wget -q http://updates.jenkins-ci.org/latest/git-client.hpi -P /var/lib/jenkins/plugins/
sudo wget -q http://updates.jenkins-ci.org/latest/scm-api.hpi -P /var/lib/jenkins/plugins/
sudo wget -q http://updates.jenkins-ci.org/latest/matrix-project.hpi -P /var/lib/jenkins/plugins/
sudo wget -q http://updates.jenkins-ci.org/latest/git.hpi -P /var/lib/jenkins/plugins/
sudo wget -q http://updates.jenkins-ci.org/latest/github.hpi -P /var/lib/jenkins/plugins/
echo "Done installing Jenkins plugins."
sudo chmod -R 0777 /var/lib/jenkins/plugins


# copy over project setup
sudo cp -r /vagrant/discover-flask-vagrant/ /var/lib/jenkins/jobs/discover-flask-vagrant/
sudo chmod -R 777 /var/lib/jenkins/jobs/discover-flask-vagrant/

# restart Jenkins
sudo service jenkins restart
# sudo /etc/init.d/jenkins restart

# Install JMeter
sudo apt-get -y install jmeter
