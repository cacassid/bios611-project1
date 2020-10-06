FROM rocker/verse
MAINTAINER Caitlin Cassidy <cacassid@email.unc.edu>
RUN echo "Hello World"
RUN R -e "install.packages('tidyverse')"
RUN R -e "install.packages('ggpubr')"
RUN R -e "install.packages('jtools')"
RUN R -e "install.packages('olsrr')"