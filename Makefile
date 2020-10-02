.PHONY: clean
SHELL: /bin/bash

parks_report.pdf:\
 parks_report.Rmd\
 figures/lat_figure.rds
 figures/scatter1.rds
 figures/scatter2.rds
	R -e "rmarkdown::render('parks_report.Rmd', output_format = 'pdf_document')"
	
 
derived_data/counts_area_sl.csv:\
 source_data/species.csv\
 source_data/datasets_670_1306_parks.csv\
 build_tidy_dataset.R
	Rscript build_tidy_dataset.R

figures/lat_figure.png figures/lat_figure.rds:\
 derived_data/counts_area_sl.csv\
 lat_figure.R
	Rscript lat_figure.R
	
figures/scatter1.png figures/scatter1.rds:\
 derived_data/counts_area_sl.csv\
 scatter_figures.R
	Rscript scatter_figures.R
	
figures/scatter2.png figures/scatter2.rds:\
 derived_data/counts_area_sl.csv\
 scatter_figures.R
	Rscript scatter_figures.R

derived_data/species.csv derived_data/parks.csv:\
 source_data/species.csv\
 source_data/datasets_670_1306_parks.csv\
 tidy_source_data.R
	Rscript tidy_source_data.R