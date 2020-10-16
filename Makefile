.PHONY: clean
SHELL: /bin/bash

parks_report.pdf:\
 parks_report.Rmd\
 figures/lat_figure.rds\
 figures/scatter1.rds\
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

figures/scatter_arrange.png figures/scatter_arrange.rds:\
 derived_data/counts_area_sl.csv\
 scatter_figures.R
	Rscript scatter_figures.R

figures/dot_plot_e.png figures/dot_plot_e.rds:\
 derived_data/conservation_park_info.csv\
 dot_figures.R
	Rscript dot_figures.R

figures/dot_plot_c.png figures/dot_plot_c.rds:\
 derived_data/conservation_park_info.csv\
 dot_figures.R
	Rscript dot_figures.R

figures/glm_figure.png figures/glm_figure.rds:\
 derived_data/best_subset.csv\
 glm_figures.R
	Rscript glm_figures.R

figures/glm_figure2.png figures/glm_figure2.rds:\
 derived_data/counts_area_sl.csv\
 glm_figures.R
	Rscript glm_figures.R
