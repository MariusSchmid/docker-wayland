FROM ubuntu:22.04



# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive


# Update Ubuntu Software repository
RUN apt update
RUN apt upgrade -y
RUN apt install weston -y
RUN apt install wget ca-certificates -y
RUN wget -O "/usr/share/keyrings/xpra.asc" https://xpra.org/gpg.asc
RUN cd /etc/apt/sources.list.d;wget https://raw.githubusercontent.com/Xpra-org/xpra/master/packaging/repos/jammy/xpra.sources
RUN apt update -y ;apt install xpra -y
RUN apt install xorg openbox -y



# RUN useradd -G video -m -s /bin/bash developer
# RUN apt install -y sudo
# RUN sudo usermod -aG wheel developer && echo '%wheel ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers


# USER developer
# WORKDIR /home/developer
# COPY weston.ini /home/developer/.config/weston.ini

RUN useradd -m -d /home/developer developer 
RUN install -m 700 -o developer -g developer -d /run/user/developer

USER developer
WORKDIR /home/developer
COPY weston.ini /home/developer/.config/weston.ini


COPY /entrypoint.sh /opt
EXPOSE 3389
ENTRYPOINT ["/opt/entrypoint.sh"]

USER root

# RUN useradd -ms /bin/bash apprunner
# USER apprunner