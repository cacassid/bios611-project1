.PHONY: clean
SHELL: /bin/bash

parks_report.pdf:\
 parks_report.Rmd\

derived_data/species.csv derived_data/parks.csv:\
 source_data/species.csv\
 source_data/datasets_670_1306_parks.csv\
 tidy_source_data.R
	Rscript tidy_source_data.R