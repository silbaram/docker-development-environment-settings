FROM python:3.9.12
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
COPY code/requirements.txt /code/
RUN pip install -r requirements.txt

COPY ./code/ /code/

