#' 创建R包路径
#'
#' @param path_name 路径名称
#'
#' @return 返回值
#' @export
#'
#' @examples
#' pkgPath_create()
pkgPath_create <- function(path_name='debug') {
  full_path = paste0("./",path_name,"")

    if(!dir.exists(full_path)){
      dir.create(full_path)
    }
}