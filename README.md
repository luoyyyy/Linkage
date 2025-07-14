![](man/figures/shiny-logo1.png)

[![](https://img.shields.io/badge/shiny-linkage-green.svg)](https://xulabgdpu.org.cn/linkage/) [![](https://img.shields.io/badge/doi-10.1101/2024.04.24.590756-green.svg)](https://doi.org/10.1101/2024.04.24.590756) [![](https://img.shields.io/badge/devel%20version-1.2.0-green.svg)](https://github.com/linkage)

<img src="man/figures/imgfile.png" align="right" height="200" style="float:right; height:200px;"/>

Linkage is a user-friendly, interactive, open-source R-Shiny web application for exploring and visualizing potential gene cis-regulatory elements (CREs) based on ATAC-seq and RNA-seq data. Users can upload customized data or re-analysis public datasets, then obtain genome-wide CREs with simple clicks. All the CREs are predicted from multi-omics sequencing data, rather than being experimentally determined. The main feature for Linkage is to identify potential CREs for the whole genome by performing canonical correlation analysis between each quantitative chromatin accessibility measure and the quantitative expression level across all samples. Additional modules are developed to allow users to perform more systematic and deeper analysis for the gene regulatory landscape.

![](man/figures/pinpeline.png) The Shiny application is additionally hosted at <https://xulabgdpu.org.cn/linkage>.


## Linkage Installation & Running Guide

### 1. Download Linkage Source Code  
  You can obtain the source code in either of the following ways:
  + Clone the GitHub repository:
      ```bash
        git clone https://github.com/luoyyyy/Linkage.git
      ```
    Or

   + Download the ZIP file from : [https://github.com/luoyyyy/Linkage](https://github.com/luoyyyy/Linkage).

   
  
### 2. Install Required R Packages & Run Linkage
There are two recommended methods to install dependencies and run the Shiny app.  
+ **Method 1**: Manual Package Installation  
1.Open your R or RStudio environment.  
2.Install the required packages:  
ℹ️ A complete list of packages and versions can be found in the [sessionInfo](https://github.com/luoyyyy/Linkage/blob/main/sessionInfo) file.
    ```r
    install.packages(c("shiny","shinyBS","ggplot2","BSgenome","clusterProfiler","rtracklayer"," BiocIO","XVector","wordcloud2","plotly","enrichplot","visNetwork","lubridate","forcats","stringr","purrr","readr","tidyr","tibble","tidyverse","igraph",""Gviz,"GenomicRanges","GenomeInfoDb","IRanges","S4Vectors","BiocGenerics","dplyr","ggpmisc","ggpp","data.table","shinyWidgets","shinycssloaders","shinydashboardPlus","shinydashboard","BSgenome.Hsapiens.UCSC.hg38","DT",))
    ```  
    3.Put the downloaded files into the corresponding folders to match the structure below:
    ```pgsql
    Linkage/
    |- www/
    |- extdata/
    |- ui.R
    |- server.R
    |- global.R
    ```
    4.Run the application from the Linkage directory:
    ```r
    shiny::runApp("Linkage")
    ```
    
 + **Method 2**: Use renv to Reproduce the Project Environment     
 1.In your R environment, create or open a new R project in the Linkage directory.  
 2.Install renv and initialize the environment:
    ```r
   install.package("renv")
   renv::init()
    ```  
    3.Replace the generated renv.lock and .Rprofile files with those provided in the GitHub repository.  
    4.Restore the project environment: 
    ```r
    renv::restore()
     ```  
     ⚠️ If any package fails to install, you may install it manually, then re-run renv::restore().    
    5.Ensure the following directory structure is present:
    ```pgsql
    Linkage/
    ├── renv/
    ├── renv.lock
    ├── .Rprofile
    ├── www/
    ├── extdata/
    ├── ui.R
    ├── server.R
    └── global.R
    ```
    6.Run the Shiny application:
      ```r
      shiny::runApp(".")
      ```
## Authors
Please do not hesitate to post an issue or contact the authors :

Siwen Xu: siwxu@gdpu.edu.cn

Yuyan Luo : 1620218029@qq.com