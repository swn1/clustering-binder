FROM andrewosh/binder-python-3.5:latest

MAINTAINER Stephen Nuchia <snuchia@gmail.com>

RUN mkdir /home/main/notebooks
RUN chown main:main /home/main/notebooks
WORKDIR /home/main/notebooks

USER root
RUN apt-get update
ADD * /home/main/notebooks/
RUN chown -R main:main $HOME/notebooks
USER main

RUN find $HOME/notebooks -name '*.ipynb' -exec ipython trust {} \;

ADD environment.yml environment.yml
RUN conda env create -n binder
RUN echo "export PATH=/home/main/anaconda2/envs/binder/bin/:/home/main/anaconda3/envs/binder/bin/:$PATH" >> ~/.binder_start
RUN conda install -n binder jupyter
RUN /bin/bash -c "source activate binder && python -m ipykernel install --user"
RUN mkdir /home/main/.jupyter
RUN echo "c.NotebookApp.token = ''" >> /home/main/.jupyter/jupyter_notebook_config.py'

USER main
WORKDIR $HOME/notebooks
