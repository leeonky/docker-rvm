FROM leeonky/os-dev:ubuntu

USER root

###### RVM
RUN /bin/bash --login -c "gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 && ( \curl -sSL https://get.rvm.io | bash -s stable ) && source /etc/profile.d/rvm.sh"

#skip chrome and chromedriver
#RUN ( wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - ) && \
	#( echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list )

###### tools for install rails
RUN apt-get install -y \
	firefox \
	postgresql-server-dev-all \
	libsqlite3-dev \
	fonts-wqy-microhei \
	libqtwebkit-dev
	#google-chrome-stable \
	#chromium-chromedriver

ADD tglgemsrc $USER_HOME/.rvm/bin/
RUN sudo chmod +x $USER_HOME/.rvm/bin/tglgemsrc

USER $USER_NAME

