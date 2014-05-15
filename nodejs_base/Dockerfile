FROM devinsba/supervisor_base

RUN \
  apt-get install software-properties-common && \
  add-apt-repository ppa:chris-lea/node.js && \
  apt-get update && \
  apt-get install -y nodejs && \
  npm install -g forever && \
  curl https://raw.githubusercontent.com/creationix/nvm/v0.7.0/install.sh | sh && \
  echo source ~/.nvm/nvm.sh >> /root/.bashrc

CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]
