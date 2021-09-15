FROM python:3.9.0

WORKDIR /home/

RUN git clone https://github.com/tjdtjdtl0514/gis_4_sh.git

WORKDIR /home/gis_4_sh/

RUN echo "SECRET_KEY=aslkdmfaiwngoiansdoifm23oi#$" > .env

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN python manage.py migrate

RUN python manage.py collectstatic

EXPOSE 8000

CMD ["gunicorn","gis_4_sh.wsgi","--bind","0.0.0.0:8000"]