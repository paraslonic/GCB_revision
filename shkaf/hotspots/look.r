setwd("D:/slon/work/GCB_revision/shkaf/hotspots")
library(data.table)
complexity <- fread("NC_011993.1.txt",skip = 1)
plot(complexity$position, complexity$complexity, type="l")

IQR(complexity$complexity)
#upper <- quantile(complexity$complexity, 0.9)+1.5*(quantile(complexity$complexity, 0.9)-quantile(complexity$complexity, 0.1))
#upper <- median(complexity$complexity, 0.9)+1.5*(quantile(complexity$complexity, 0.9)-quantile(complexity$complexity, 0.1))
upper <- quantile(complexity$complexity, 0.75)+1.5*(quantile(complexity$complexity, 0.75)-quantile(complexity$complexity, 0.25))

hotspots <- which(complexity$complexity > upper)
points(complexity$position[hotspots], rep(-0.5,length(hotspots)), pch=16, cex = 0.5, col = "red")

coldspots <- which(complexity$complexity < quantile(complexity$complexity, 0.25)-IQR(complexity$complexity))
points(complexity$position[coldspots], rep(-0.5,length(coldspots)), pch=16, cex = 0.5, col = "blue")
