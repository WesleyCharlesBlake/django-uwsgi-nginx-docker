FROM ubuntu:precise
FROM python:2.7

maintainer Wesley Blake <wesley@stratotechnology.com

#RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y build-essential git
RUN apt-get install -y python python-dev python-setuptools
RUN apt-get install -y nginx supervisor
RUN easy_install pip

# install uwsgi now because it takes a little while
RUN pip install uwsgi

# install nginx
RUN apt-get install -y python-software-properties software-properties-common
RUN apt-get update
RUN add-apt-repository -y ppa:nginx/stable

# install our code
ADD . /code/

ADD requirements.txt /code/

# RUN pip install
RUN pip install -r /code/requirements.txt

#sort out perms
RUN chown -R www-data:www-data /code

# setup all the configfiles
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN rm /etc/nginx/sites-enabled/default
RUN ln -s /code/nginx-app.conf /etc/nginx/sites-enabled/
RUN ln -s /code/supervisor-app.conf /etc/supervisor/conf.d/

WORKDIR /code

EXPOSE 80 22
CMD ["supervisord", "-n"]
