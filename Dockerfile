FROM daocloud.io/leeonky/centos-7:1.0

###### tools for rvm install
RUN sudo yum -y install \
	which

###### RVM
ADD rvm_install.sh $DEV_HOME/rvm_install.sh
RUN /bin/bash --login $DEV_HOME/rvm_install.sh && \
	rm -f $DEV_HOME/rvm_install.sh

ADD ruby_install $DEV_HOME/ruby_install
RUN /bin/bash --login $DEV_HOME/ruby_install

RUN sudo chmod +x $DEV_HOME/.rvm/bin/tglgemsrc

