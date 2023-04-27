# Calculate NDVI in R
# Authors: Marcel Massó and Erola Fenollosa
# Date: April 2023

# 0. Install packages
library(raster) # Package for spatial analysis, required to import images

# 1. Import Red and NIR images to RStudio
imageNIR <- raster("C:/Users/zool2620/Dropbox/2022 Margarita Salas/230401 Ecotech course/VideoImageAnalysis/1199MS_20220701_DRAGNET_B_NC_2_NIR_1.TIF") # Change File Path
imageRED <- raster("C:/Users/zool2620/Dropbox/2022 Margarita Salas/230401 Ecotech course/VideoImageAnalysis/1197MS_20220701_DRAGNET_B_NC_2_R_1.TIF") # Change File Path

# Take a look at both images
plot(imageNIR, main= "NIR")
plot(imageRED, main = "RED")

# 2. Calculate NDVI as operating between two matrices
ndvi <- (imageNIR - imageRED) / (imageNIR + imageRED)

# Take a look at the NDVI Image:
plot(ndvi,  main = "NDVI")


# 3. Estimate summary metric of interest (mean, median, mode) and/or variability measure (SD, SE, CV)
print(mean(ndvi@data@values)) # Calculate the mean
print(sd(ndvi@data@values)) # Calculate the SD

# If relevant, check the distribution of the data to reconsider which would be the best central metric
hist(ndvi@data@values, main="Histogram of NDVI plot values")

