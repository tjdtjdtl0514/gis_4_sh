FROM python:3.9.0

WORKDIR /home/

RUN echo "testing123"

RUN git clone https://github.com/tjdtjdtl0514/gis_4_sh.git

WORKDIR /home/gis_4_sh/

RUN echo "SECRET_KEY=aslkdmfaiwngoiansdoifm23oi#$" > .env

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient


EXPOSE 8000

CMD ["bash", "-c","python manage.py collectstatic --noinput --settings=gis_4_sh.settings.deploy && python manage.py migrate --settings=gis_4_sh.settings.deploy && gunicorn gis_4_sh.wsgi --env DJANGO_SETTINGS_MODULE=gis_4_sh.settings.deploy --bind 0.0.0.0:8000"]