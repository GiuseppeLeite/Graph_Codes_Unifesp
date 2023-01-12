# Library
library(ggplot2)

# Load the data
Data <- read.delim("Bar_Plot_Z_Score_IPA_Data.txt")


# Create the graphs

C1 <- ggplot(Data, aes(x = reorder(factor(Diseases_or_Functions_Annotation), 
                                   N_Molecules), y= N_Molecules, 
                       fill = Z.score)) + 
  geom_bar(stat = "identity") +   coord_flip() + 
  theme_classic() + 
  scale_fill_gradient2(low = "blue",
                         mid = "white",
                         high="#CD0000",
                         midpoint = 0)
C1

# Save the graph

dev.copy(tiff,"barplot_zscore.tiff",width=7, height=6, units="in",res=600)
dev.off()
