FROM ubuntu:18.04

# install apt-add-repository
RUN apt update && apt install -y software-properties-common iputils-ping less

# install ansible
RUN apt update && apt install -y ansible

# install netcat
RUN apt install netcat -y

# disable strict check of target identity. Use with care in production!
RUN echo "    StrictHostKeyChecking no" >> /etc/ssh/ssh_config
RUN echo "    UserKnownHostsFile=/dev/null" >> /etc/ssh/ssh_config

# add user stefan
# RUN mkdir -p /home/stefan/
RUN useradd --no-log-init -rmU ansible

# activate user ansible
USER ansible

# set work directory
WORKDIR /home/ansible/playbooks

# ENTRYPOINT [ "ansible" ]
# CMD ip addr show eth0 | grep inet 
CMD /bin/bash