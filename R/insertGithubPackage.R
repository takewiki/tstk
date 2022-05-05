#' 插入Github中的R包
#'
#' @return 返回值
#' @export
#'
#' @examples insertGithubPackage();
insertGithubPackage <- function(){
  rstudioapi::insertText("devtools::install_github('user_name/pkg_name');\n")
}
