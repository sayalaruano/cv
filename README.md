CV made with [pagedown](https://pagedown.rbind.io) R package
================

View at [sayalaruano.github.io/cv](https://sayalaruano.github.io/).

## Structure 

The main files and directories are:

- `sayalaruano_cv.Rmd`: Source template for the cv.
- `render_cv.R`: R script for rendering both pdf and html version of CV at the same time (From `nstrayer/cv`.)
	- `index.html`: Final output of CV in html format.  
	- `sayalaruano_cv.pdf`: Final output of CV in pdf format.  
- `CV_printing_functions.R`: Auxiliar funtion of `render_cv.R` function. (From `nstrayer/cv`.)
- `css/`: Directory containing the custom CSS files to add styles (From `nstrayer/cv`.)
- `parsing_functions.R`: Functions used to parse and properly format position data. (From `nstrayer/cv`.)
- `gather_data.R`: Functions to store the position info from google sheets (From `nstrayer/cv`.)

## Acknowledgments

Special thanks to [Nick Strayer](http://nickstrayer.me) for providing his [pagedown CV template on GitHub](https://github.com/nstrayer/cv) and adding customization instructions.

