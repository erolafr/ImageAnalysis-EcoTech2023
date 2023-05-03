# File renaming for the multispectral
# Pictures are coded with numbers ending 0-5 for each single picture, 
# they correspond to the following channels: "RGB", "B", "G", "R", "RE", "NIR"

# Specify the folder containing the files to rename
folder_path <- "C:/Users/zool2620/Downloads/Multispectral/Multispectral"


# Get the list of files in the folder
file_names <- list.files(path = folder_path, full.names = TRUE)

# Loop through all files in the folder
for (file_name in file_names) {
  # Check if the file is a regular file (not a directory or symlink)
  if (file.info(file_name)$isdir == FALSE) {
    # Extract the last digit of the file name (assuming it's a single digit)
    last_digit <- substr(file_name, nchar(file_name) - 4, nchar(file_name) - 4)
    # Define the suffix to add based on the last digit
    suffix <- switch(last_digit,
                     "0" = "RGB",
                     "1" = "B",
                     "2" = "G",
                     "3" = "R",
                     "4" = "RE",
                     "5" = "NIR",
                     "")
    # Get the original extension of the file
    file_ext <- tools::file_ext(file_name)
    # Rename the file by appending the suffix and preserving the original extension
    new_file_name <- paste0(gsub(paste0("\\.", file_ext), paste0(suffix, ".", file_ext), basename(file_name)))
    file.rename(file_name, file.path(folder_path, new_file_name))
  }
}

