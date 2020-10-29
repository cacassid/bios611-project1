FROM rocker/verse
MAINTAINER Caitlin Cassidy <cacassid@email.unc.edu>
RUN echo "Hello World"
RUN R -e "install.packages('tidyverse')"
RUN R -e "install.packages('ggpubr')"
RUN R -e "install.packages('jtools')"
RUN R -e "install.packages('olsrr')"
RUN R -e "install.packages('gbm')"
RUN R -e "install.packages('cluster')"
RUN R -e "install.packages('knitr')"
RUN R -e "install.packages('Rtsne')"
RUN R -e "install.packages('MLmetrics')"
RUN R -e "install.packages('e1071')"
RUN R -e "install.packages('caret')"
RUN apt update -y && apt install -y python3-pip
RUN pip3 install jupyter jupyterlab
RUN pip3 install numpy pandas sklearn plotnine matplotlib pandasql bokeh