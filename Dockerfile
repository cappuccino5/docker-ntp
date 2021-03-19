From registry.cn-shenzhen.aliyuncs.com/risinghf/ubuntu:18.04
MAINTAINER hu
ENV DEBIAN_FRONTEND noninteractive

RUN mkdir -p /opt/cdm/
COPY initfiles/init.sh /opt/cdm/
COPY initfiles/sync.cnf /opt/cdm/
RUN chmod a+x /opt/cdm/init.sh
RUN apt-get update && apt-get install -y ntp
RUN apt-get install -y cron

EXPOSE 123/udp

CMD ["sh","-c","/opt/cdm/init.sh* && bash"]
