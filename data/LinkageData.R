#' Load TCGA Breast Cancer ATAC-seq expression matrix.
#'
#' @return ATAC-seq count
#' @export
#'
#' @examples
#' library(LinkageData)
#' BreastCancerATAC()
BreastCancerATAC <- function(){
  dir <- "data/LinkageData/Homo.ATAC"
  txt_files <- list.files(dir,pattern = "\\.rdata$")
  path <- file.path(dir,txt_files)
  data_list <- lapply(path, function(file) {
    load(file)
    data
  })
  ATAC <- do.call(rbind, data_list)
  return(ATAC)
}

#' Load MuSC ATAC-seq expression matrix.
#'
#' @return ATAC-seq count
#' @export
#'
#' @examples
#' library(LinkageData)
#' MuSCsATAC()
MuSCsATAC <- function(){
  dir <- "data/LinkageData/Mus.ATAC"
  txt_files <- list.files(dir,pattern = "\\.rdata$")
  path <- file.path(dir,txt_files)
  data_list <- lapply(path, function(file) {
    load(file)
    data
  })
  ATAC <- do.call(rbind, data_list)
  return(ATAC)
}

#' Load TCGA Breast Cancer RNA-seq expression matrix.
#'
#' @return RNA-seq count
#' @export
#'
#' @examples
#' library(LinkageData)
#' BreastCancerRNA()
BreastCancerRNA <- function(){
  dir <- "data/LinkageData/TCGA-BRCA-RNA.rdata"
  load(dir)
  return(RNA_matrix)
}


#' Load MuSC RNA-seq expression matrix.
#'
#' @return RNA-seq count
#' @export
#'
#' @examples
#' library(LinkageData)
#' MuSCsRNA()
MuSCsRNA <- function(){
  dir <- "data/LinkageData/mouse.normalize.rna.rdata"
  load(dir)
  return(mouse.RNA_matrix)
}
