#基于的基础镜像
FROM python:3.6.15-slim-buster
RUN echo "source /etc/profile" >> ~/.bashrc
# 设置时区
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone
RUN apt-get update && apt-get -y install cron vim iputils-ping

RUN mkdir -p /ddns
COPY . /ddns
WORKDIR /ddns
RUN pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple

RUN cp crontab /etc/cron.d/crontab
RUN chmod 0644 /etc/cron.d/crontab
RUN /usr/bin/crontab /etc/cron.d/crontab

CMD ["cron", "-f"]
