# Library

library(pheatmap)

# Load the data

The_34_Log2FC <- read.delim("The_34_Log2FC.txt", row.names=1)


# defines the color breaks manually for color transition

col_breaks = unique(c(seq(-0.9,-0.1,length=100), #156079
                      seq(-0.1,0.1,length=100), #c6ccd0
                      seq(0.1,0.8,length=100))) #a63715

# Create the Heatmap and Save the graph

pheatmap(The_34_Log2FC, #Name of the dataset
         cluster_rows = T, # Determining if rows should be clustered
         cluster_cols = F, # Determining if columns should be clustered
         filename = "The_34_Log2FC.tiff", #Name under which the graph will be saved in your directory
         cutree_rows = 4, # number of clusters the rows are divided into
         width = 3, # Determining the output file width in inches
         height = 6, # Determining the output file height in inches
         fontsize = 8, #base fontsize for the plot
         color = colorRampPalette(c("#156079", "#c6ccd0", "#a63715"))(n = 299),
         show_rownames = T, # Specifying if column names are be shown
         annotation_legend = FALSE, # showing if the legend for annotation tracks should be drawn
         legend=T, # logical to determine if legend should be drawn or not.
         breaks = col_breaks,  # enable color transition at specified limits
         border_color = "white")


