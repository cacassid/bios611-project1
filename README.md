BIOS 611 Project 1
------------------
This repo will eventually contain an analysis of chosen dataset


Using This Project
-----------------
You will need Docker. You need to be able to run docker as your user
    > docker build . -t project1-env
    > docker run -v `pwd`:/home/rstudio - p 8787:8787 -e PASSWORD = <yourpassword> -t project1-env

Introduction
-----------------


Datasets
-----------------
The datasets used are publicly available on Kaggle.
 They can be downloaded at: https://www.kaggle.com/nationalparkservice/park-biodiversity?select=species.csv 

The datasets include information about each of the US National Parks, including park location and size as well as a catalog of species that reside in each park.  


Preliminary Figures
------------------

Makefile 

----------------- 
The Makefile is an excellent place to look to get a feel for the project.