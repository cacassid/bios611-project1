BIOS 611 Project 1
------------------
This repo will eventually contain an analysis of chosen dataset


Using This Project
-----------------
You will need Docker. You need to be able to run docker as your user
    > docker build . -t project1-env
    > docker run -v `pwd`:/home/rstudio - p 8787:8787 -e PASSWORD = <yourpassword> -t project1-env