FROM tensorflow/tensorflow:latest-gpu-py3

EXPOSE 8888

RUN pip install jupyterlab 

#RUN apt-get update
RUN apt-get -y install git

CMD jupyter lab --port=8888 --ip=* --notebook-dir=/data --no-browser --allow-root

