FROM centos:7 

RUN yum -y install openssh-server openssh-clients
RUN yum -y install passwd
RUN useradd remote_user 
RUN echo "mavenir"| passwd remote_user --stdin
RUN mkdir /home/remote_user/.ssh
RUN chmod 700 /home/remote_user/.ssh

COPY remote-key.pub /home/remote_user/.ssh/authorized_keys

RUN chown remote_user:remote_user -R /home/remote_user/.ssh/ 
RUN chmod 600 /home/remote_user/.ssh/authorized_keys


RUN /usr/sbin/sshd-keygen 

CMD /usr/sbin/sshd -D 
