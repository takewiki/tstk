#' 向R包中写入目录文件
#'
#' @return 返回值
#' @export
#'
#' @examples
#' toc4pkg 
toc4pkg <- function() {
  cat(paste(dir('R'),collapse = '\n'),file = 'readme.txt');
  
}