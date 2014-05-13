FROM dockerfile/supervisor

RUN \
  echo "deb http://www.rabbitmq.com/debian/ testing main" >> /etc/apt/sources.list.d/rabbit.list && \
  wget http://www.rabbitmq.com/rabbitmq-signing-key-public.asc && \
  apt-key add rabbitmq-signing-key-public.asc && \
  rm rabbitmq-signing-key-public.asc && \
  apt-get update && \
  apt-get install -y rabbitmq-server && \
  apt-get install -y openssh-server && \
  rabbitmq-plugins enable rabbitmq_management && \
  mkdir -p /var/run/sshd && \
  echo "[{rabbit, [{loopback_users, []}]}]." > /etc/rabbitmq/rabbitmq.config && \
  echo "root:password" | chpasswd && \
  sed -i.bak -e 's/PermitRootLogin without-password/PermitRootLogin yes/g' /etc/ssh/sshd_config

ADD rabbit.conf /etc/supervisor/conf.d/rabbit.conf
ADD rabbit.sh /bin/rabbit.sh
RUN chmod u+x /bin/rabbit.sh
ADD ssh.conf /etc/supervisor/conf.d/ssh.conf

EXPOSE 5672 15672 25672 22

CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]
