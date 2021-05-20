FROM 
RUN apt update -y && \
    apt install aria2 && \
    apt install supervisor && \
    apt install websockify && \
    apt install unzip && \
    apt install wget && \
    apt install curl && \
    

COPY system /system
RUN chmod +x /system/conf.d/websockify.sh
RUN chmod +x /system/supervisor.sh

CMD ["/system/supervisor.sh"]
