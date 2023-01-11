# library
library(ggplot2)
library(tidyverse)
library(RColorBrewer)

# Read data
CIBERSORTx_Job38_Results <- read.delim("CIBERSORTx_Job38_Results.txt")

# Drop Columns

CIBERSORTx_Job38_Results$P.value <- NULL
CIBERSORTx_Job38_Results$Correlation <- NULL
CIBERSORTx_Job38_Results$RMSE <- NULL
CIBERSORTx_Job38_Results$Absolute.score..sig.score. <- NULL


# Pivot Longer

DATA_cells <- CIBERSORTx_Job38_Results %>%
  pivot_longer(!Mixture, names_to = "Cells", values_to = "count")

# Define the number of colors you want

nb.cols <- 22
mycolors <- colorRampPalette(brewer.pal(8, "Set1"))(nb.cols)

# Stacked barchart

ggp <- ggplot(DATA_cells,            # Create ggplot2 plot scaled to 1.00
              aes(x = Mixture,
                  y = count,
                  fill = Cells, width = 1)) + # Width bar
  geom_bar(position = "fill", stat = "identity") + 
  scale_fill_manual(values = mycolors) + # RColorBrewer palettes
  theme_minimal() + # Add a theme
  scale_y_continuous(labels = scales::percent_format()) + # Scaled to 100%
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) # # Rotate the Legend


  
print(ggp)                              


# Saving  

dev.copy(tiff,"Cibersort.tiff",width=15, height=6, units="in",res=600)
dev.off()
