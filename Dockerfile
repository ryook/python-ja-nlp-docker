FROM python:3-slim

WORKDIR /opt/app

RUN apt-get update \
    && apt-get install -y gcc \
    && apt-get install -y --fix-missing g++

COPY requirements.txt /opt/app
COPY sudachi_config/ /opt/app/sudachi_config/

RUN pip install -r requirements.txt
RUN sudachipy ubuild -o /usr/local/lib/python3.9/site-packages/sudachipy/resources/user.dic  sudachi_config/user_dict.txt
RUN cp sudachi_config/sudachi.json /usr/local/lib/python3.9/site-packages/sudachipy/resources/sudachi.json


RUN useradd -r -m appusr

USER appusr
WORKDIR /home/appusr
COPY jupyter_notebook_config.py /home/appusr/.jupyter/
