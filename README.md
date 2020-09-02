BIOS 611 Project 1
------------------
This repo will eventually contain an analysis of chosen dataset

Introduction
-----------------
The United States has 62 National Parks. Data on 56 of the parks were provided by the National Park Service. Because of the varying geography of the U.S., the parks vary greatly in terms of their biodiversity. Biodiversity refers to the variety and variability of species in an ecosystem. Biodiversity is important for maintaining healthy ecosystems. 

In this project, we will look at the amounts of different species and compare these amounts across the parks. For instance, which parks have more species of mammals? Which parks have more species of birds, plants or even algae? We will also evaluate the correlations and generate models to understand relationships between the numbers of different species. For example, does a greater number of vascular plant species predict a greater number of mammal species? 

We will develop and produce engaging figures to allow the user to understand our results. 

Datasets
-----------------
The datasets used are publicly available on Kaggle. They can be downloaded at: https://www.kaggle.com/nationalparkservice/park-biod

The datasets include information about each of the US National Parks, including park location and size as well as a catalog of species that reside in each park.  

Preliminary Figures
------------------
(INSERT FIGURES HERE)
Scatterplot of Birds vs Mammals
[](figures/BirdsvMammals.png)

Using This Project
-----------------
You will need Docker. 
You need to be able to run docker as your current user.
You'll need to first build the container:
    > docker build . -t project1-env
The Docker container is based on rocker/verse. To run rstudio server: 
    > docker run -v `pwd`:/home/rstudio - p 8787:8787 -e PASSWORD = <yourpassword> -t project1-env
Then connect to the machine on port 8787.

Makefile 
-----------------
The Makefile is an excellent place to look to get a feel for the project.