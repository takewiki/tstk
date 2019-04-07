#' 插入加载数据包
#'
#' @return 返回值
#' @export
#'
#' @examples insertLibraryEx();
insertLibraryEx <- function(){
  rstudioapi::insertText("tsda::libraryEx(c('lib_name'));\n")
}
