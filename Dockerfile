FROM siutin/ubuntu-rvm:v2.3.1_20161018

# Install Smartstack (Synapse + Nerve)
RUN /bin/bash -l -c 'gem install amq-protocol'
RUN /bin/bash -l -c 'gem install synapse'
RUN /bin/bash -l -c 'gem install nerve'

# Install haproxy
RUN sudo apt-get update && sudo apt-get -y install software-properties-common curl
RUN sudo add-apt-repository ppa:vbernat/haproxy-1.6
RUN sudo apt-get update && sudo apt-get -y install haproxy

#RUN mkdir -p /smartstack
ADD . /smartstack

#初始化haproxy文件权限
RUN sudo chmod a+w /etc/haproxy/haproxy.cfg

CMD ["bash", "/smartstack/start-up.sh"]
