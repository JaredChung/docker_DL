FROM tensorflow/tensorflow:latest-gpu-py3

ARG USE_PYTHON_3_NOT_2
ARG _PY_SUFFIX=${USE_PYTHON_3_NOT_2:+3}
ARG PYTHON=python${_PY_SUFFIX}
ARG PIP=pip${_PY_SUFFIX}

RUN ${PIP} install jupyter matplotlib
RUN ${PIP} install jupyterlab
RUN ${PIP} install jupyter_http_over_ws
#RUN jupyter serverextension enable --py jupyter_http_over_ws

RUN mkdir -p /tf/tensorflow-tutorials && chmod -R a+rwx /tf/
RUN mkdir /.local && chmod a+rwx /.local
RUN apt-get install -y --no-install-recommends wget
COPY readme-for-jupyter.md README.md
RUN apt-get autoremove -y && apt-get remove -y wget
EXPOSE 8888

RUN ${PYTHON} -m ipykernel.kernelspec

#RUN apt-get update
RUN apt-get -y install git

CMD jupyter lab --port=8888 --ip=0.0.0.0 --allow-root --no-browser

