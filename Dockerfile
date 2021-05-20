FROM 
RUN chmod +x /system/conf.d/websockify.sh
RUN chmod +x /system/supervisor.sh

CMD ["/system/supervisor.sh"]
