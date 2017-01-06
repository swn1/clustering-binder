FROM andrewosh/binder-python-3.5:latest

MAINTAINER Stephen Nuchia <snuchia@gmail.com>

RUN mkdir /home/main/.jupyter
RUN echo "c.NotebookApp.password = ''" >> /home/main/.jupyter/jupyter_notebook_config.py'
