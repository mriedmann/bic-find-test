FROM centos:6

ENV PATH $PATH:/root/bin

RUN yum groupinstall -y 'Development Tools' && \
	yum clean all
	
ADD bin /root/bin

RUN	/bin/bash build-test-env-for-find.sh