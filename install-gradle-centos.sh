#Install gradle on redhat/centos linux
#ref https://gist.github.com/parzonka/9371885#file-install-gradle-centos-sh

# installs to /opt/gradle
# existing versions are not overwritten/deleted
# seamless upgrades/downgrades
# $GRADLE_HOME points to latest *installed* (not released)
gradle_version=1.11
wget -N http://services.gradle.org/distributions/gradle-${gradle_version}-all.zip
unzip gradle-${gradle_version}-all.zip -d /opt
gradle_path=/opt/gradle-${gradle_version}
sudo ln -sfn gradle-${gradle_version} ${gradle_path}
sudo printf "export GRADLE_HOME=${gradle_path}\nexport PATH=\$PATH:\$GRADLE_HOME/bin" > /etc/profile.d/gradle.sh
. /etc/profile.d/gradle.sh
# check installation
gradle -v