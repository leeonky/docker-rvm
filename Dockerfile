FROM leeonky/os-dev

USER $USER_NAME

###### tools for rvm install
RUN sudo yum -y install \
	which

###### RVM
RUN /bin/bash --login -c "gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 && ( \curl -sSL https://get.rvm.io | bash -s stable ) && source /home/$USER_NAME/.rvm/scripts/rvm"

###### tools for install rails
RUN sudo yum install -y \
	firefox \
	postgresql-devel \
	sqlite-devel.x86_64 \
	wqy-microhei-fonts \
	qtwebkit-devel && \
	sudo ln -s /usr/lib64/qt4/bin/qmake /usr/bin/qmake

ADD tglgemsrc $USER_HOME/.rvm/bin/
RUN sudo chmod +x $USER_HOME/.rvm/bin/tglgemsrc

