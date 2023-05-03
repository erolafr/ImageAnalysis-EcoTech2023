# Import RGB image in R to estimate vegetation indexes
# Authors: Erola Fenollosa
# Date: April 2023

# 0. Install packages
install.packages("imager")
library(imager)

# Package vignette
# http://dahtah.github.io/imager/

# 1. Import RGB image to RStudio
imageRGB<- load.image("C:/Users/zool2620/Dropbox/2022 Margarita Salas/230401 Ecotech course/VideoImageAnalysis/1206MS_20220701_DRAGNET_B_N_2_RGB_1.jpeg")

# Take a look at the picture
plot(imageRGB)

# Access each channel
plot(R(imageRGB))
plot(G(imageRGB))
plot(B(imageRGB))

# Calculate NGRDVI

NGRDVI <- (G(imageRGB) -R(imageRGB)) / (G(imageRGB) +R(imageRGB))

mean(NGRDVI)
plot(NGRDVI)

# Calculate reed Green index
RGIndex <- R(imageRGB) / G (imageRGB)
plot(RGIndex)
