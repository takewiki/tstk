#' install from tongji
#'
#' @param pkg pkgname
#'
#' @return return value
#' @export
#'
#' @examples
#' install_china_tongji()
install_china_tongji <- function(pkg) {
  repo <- .libPaths()[2] 
  libsrc <-"https://mirrors.tongji.edu.cn/CRAN/"
  install.packages(pkg,repo,libsrc)
  
}