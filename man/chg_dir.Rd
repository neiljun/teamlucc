% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/chg_dir.R
\name{chg_dir}
\alias{chg_dir}
\title{Change Direction Image for CVAPS}
\usage{
chg_dir(t1p, t2p, filename, overwrite = FALSE, verbose = FALSE, ...)
}
\arguments{
\item{t1p}{time 0 posterior probability \code{Raster*}}

\item{t2p}{time 1 posterior probability \code{Raster*}}

\item{filename}{(optional) filename for output change direction
\code{RasterLayer}}

\item{overwrite}{whether to overwrite existing files (otherwise an error 
will be raised)}

\item{verbose}{whether to print detailed status messages}

\item{...}{additional parameters to pass to rasterEngine}
}
\value{
\code{Raster*} object with change direction image
}
\description{
This code calculate the change direction image for the Change Vector 
Analysis in Posterior Probability Space (CVAPS) method of Chen et al. 2011.  
Use the change direction image in conjunction with the change magnitude 
image from \code{chg_dir}, and \code{DFPS} to use the Double Window Flexible 
Pace Search method (Chen et al. 2003) to determine the threshold to use to 
map areas of change and no-change.
}
\examples{
\dontrun{
t0_train_data <- get_pixels(L5TSR_1986, L5TSR_1986_2001_training, "class_1986",training=.6)
t0_model <- train_classifier(t0_train_data)
t0_preds <- classify(L5TSR_1986, t0_model)
t1_train_data <- get_pixels(L5TSR_2001, L5TSR_1986_2001_training, "class_2001", training=.6)
t1_model <- train_classifier(t1_train_data)
t1_preds <- classify(L5TSR_2001, t1_model)
t0_t1_chgdir <- chg_dir(t0_preds$probs, t1_preds$probs)
}
}
\references{
Chen, J., P. Gong, C. He, R. Pu, and P. Shi. 2003.
Land-use/land-cover change detection using improved change-vector analysis.
Photogrammetric Engineering and Remote Sensing 69:369-380.

Chen, J., X. Chen, X. Cui, and J. Chen. 2011. Change vector analysis in 
posterior probability space: a new method for land cover change detection.  
IEEE Geoscience and Remote Sensing Letters 8:317-321.
}

