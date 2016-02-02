A simple django, uwsgi, nginx Docker image.

docker-compose.yml
`docker-compose up`

To run this image, mount your django up in the `code` directory eg:

`docker run --name your_job_name -p 80:80 -v /path/to/your/app:/code wesleycharlesblake/django-uwsgi-nginx-docker`
