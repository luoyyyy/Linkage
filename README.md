![](man/figures/shiny-logo1.png)

[![](https://img.shields.io/badge/shiny-linkage-green.svg)](https://xulabgdpu.org.cn/linkage/) [![](https://img.shields.io/badge/doi-10.1101/2024.04.24.590756-green.svg)](https://doi.org/10.1101/2024.04.24.590756) [![](https://img.shields.io/badge/devel%20version-1.2.0-green.svg)](https://github.com/linkage)

<img src="man/figures/imgfile.png" align="right" height="200" style="float:right; height:200px;"/>

Linkage is a user-friendly, interactive, open-source R-Shiny web application for exploring and visualizing potential gene cis-regulatory elements (CREs) based on ATAC-seq and RNA-seq data. Users can upload customized data or re-analysis public datasets, then obtain genome-wide CREs with simple clicks. All the CREs are predicted from multi-omics sequencing data, rather than being experimentally determined. The main feature for Linkage is to identify potential CREs for the whole genome by performing canonical correlation analysis between each quantitative chromatin accessibility measure and the quantitative expression level across all samples. Additional modules are developed to allow users to perform more systematic and deeper analysis for the gene regulatory landscape.

![](man/figures/pinpeline.png) The Shiny application is additionally hosted at [https://xulabgdpu.cpolar.top/Linkage](https://xulabgdpu.cpolar.top/Linkage/).


## Local Installation (Optional)

### 1. Download Linkage Source Code
You can obtain the source code in either of the following ways:
  + Clone the GitHub repository:
    ```bash
    git clone https://github.com/luoyyyy/Linkage.git
    ```
    Or

   + Download the ZIP file from: [https://github.com/luoyyyy/Linkage](https://github.com/luoyyyy/Linkage).  
   The downloaded folder should be named Linkage-main.


   
  
### 2. Install Required R Packages & Run Linkage
+ **Manual Package Installation**    
1.Open your R or RStudio environment.  
2.Install the required packages:  
    ```r
    install.packages(c("shiny","shinyBS","ggplot2","wordcloud2","plotly","enrichplot","visNetwork","lubridate","forcats","stringr","purrr","readr","tidyr","tibble","tidyverse","igraph", "dplyr","ggpmisc","ggpp","data.table","shinyjs","ggupset","ggimage","ggpubr","shinyWidgets","shinycssloaders","shinydashboardPlus","shinydashboard","DT"))
    
    if (!requireNamespace("BiocManager", quietly = TRUE))
        install.packages("BiocManager")  

    BiocManager::install(c("clusterProfiler","rtracklayer","BiocIO","XVector","BSgenome","BSgenome.Hsapiens.UCSC.hg38","GenomicRanges","GenomeInfoDb","IRanges","S4Vectors", "BiocGenerics","Gviz","ChIPseeker","motifmatchr","org.Hs.eg.db","org.Mm.eg.db","TxDb.Mmusculus.UCSC.mm10.knownGene","BSgenome.Mmusculus.UCSC.mm10"))
    ```    
    ℹ️ A complete list of packages and versions can be found in the [sessionInfo](https://github.com/luoyyyy/Linkage/blob/main/sessionInfo) file.  
    3.Run the application from the directory:
    ```r
    shiny::runApp("/path/to/Linkage-main")
    ```
   
## Authors
Please do not hesitate to post an issue or contact the authors :

Siwen Xu: siwxu@gdpu.edu.cn

Yuyan Luo : 1620218029@qq.com
