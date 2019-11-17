#!/bin/bash

# anaconda
pyenv install anaconda3-5.1.0
pyenv global anaconda3-5.1.0

# jupyterthemes
pip install jupyterthemes

# jupyter_contrib_nbextensions
conda install -c conda-forge jupyter_contrib_nbextensions

# jupyter-vim-binding
git clone https://github.com/lambdalisue/jupyter-vim-binding ~/.anyenv/envs/pyenv/versions/anaconda3-5.1.0/share/jupyter/nbextensions/vim_binding
