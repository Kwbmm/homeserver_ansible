FROM debian:latest

RUN apt update && apt install openssh-server python3 sudo cron vim -y
RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 test \
    && echo 'test:test' | chpasswd \
    && mkdir /home/ubuntu/.ssh \
    && chown test:root /home/ubuntu/.ssh

RUN service ssh start

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
