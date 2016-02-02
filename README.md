A simple django, uwsgi, nginx Docker image.

docker-compose.yml
`docker-compose up`

To run this image, mount your django up in the `code` directory eg:

`docker run --name your_job_name -p 80:80 -v /path/to/your/app:/code wesleycharlesblake/django-uwsgi-nginx-docker`

You will want to change the `nginx-app.conf` and update the `server_name` directive to your apps domain, and uwsgi.ini to point to your wsgi app.

Currently `docker-compose.yml` can link to a postgres image, update your app settings to use a postgres backend, and uncomment the db related directives in docker-compose.

If you have any suggestions please let me know 
