FROM kalilinux/kali-rolling
RUN apt update -y && \
    apt install aria2 -y && \
    apt install supervisor -y && \
    apt install websockify -y && \
    apt install unzip -y && \
    apt install wget -y && \
    apt install curl -y && \
    curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip && \
    unzip rclone-current-linux-amd64.zip && \
    cp /rclone-*-linux-amd64/rclone /usr/bin/ && \
    chown root:root /usr/bin/rclone && \
    chmod 755 /usr/bin/rclone && \
    wget 'https://github.com/mayswind/AriaNg/archive/refs/heads/master.zip' && \
    unzip master.zip 
COPY system /system
COPY index.html /usr/share/index.html
RUN chmod +x /system/conf.d/websockify.sh
RUN chmod +x /system/supervisor.sh
RUN chmod +x /system/conf.d/aria2c.sh
CMD ["/system/supervisor.sh"]
