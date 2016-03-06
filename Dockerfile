FROM centos:7

ENV PATH $PATH:/root/bin

RUN yum groupinstall -y 'Development Tools' && \
	yum install -y selinux-devel wget glibc.i686 libSM.i686 && \
	yum clean all

RUN wget http://mriedmann.github.io/MAKEDEV-3.23-1.tar.gz && \
	echo "2E44218FB2AC69B847F1ECBFA823210E MAKEDEV-3.23-1.tar.gz" > MD5SUM && \
	md5sum -c MD5SUM
	
RUN	tar -xzvf MAKEDEV* && \
	cd MAKEDEV* && \
	make && make install-bin
	
ADD bin /root/bin

RUN	/bin/bash build-test-env-for-find.sh
