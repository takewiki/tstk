#' 测试问题点 
#'
#' @param point 问题点
#'
#' @return 返回值
#' @export
#'
#' @examples
#' debug_print
debug_print <- function(point='bug1') {
  res = paste0("检测点:",point,":-",as.character(Sys.time()))
  print(res)
  
}