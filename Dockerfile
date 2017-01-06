FROM andrewosh/binder-python-3.5:latest

MAINTAINER Stephen Nuchia <snuchia@gmail.com>

ADD environment.yml environment.yml
RUN conda env create -n binder
RUN echo "export PATH=/home/main/anaconda2/envs/binder/bin/:/home/main/anaconda3/envs/binder/bin/:$PATH" >> ~/.binder_start
RUN conda install -n binder jupyter
RUN /bin/bash -c "source activate binder && python -m ipykernel install --user"
RUN mkdir /home/main/.jupyter
RUN echo "c.NotebookApp.password = ''" >> /home/main/.jupyter/jupyter_notebook_config.py
