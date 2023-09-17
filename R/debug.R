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


#' 创建debug文件夹
#'
#' @return 返回值
#' @export
#'
#' @examples
#' debug_create()
debug_create <- function() {
  if(!dir.exists('./debug')){
    dir.create('./debug')
  }
  
}

#' 创建debug文件夹
#'
#' @return 返回值
#' @export
#'
#' @examples
#' debug2_create()
debug2_create <- function() {
  if(!dir.exists('./debug2')){
    dir.create('./debug2')
  }
  
}



#' 创建debug文件夹
#'
#' @return 返回值
#' @export
#'
#' @examples
#' debug2_create()
inst_create <- function() {
  if(!dir.exists('./inst')){
    dir.create('./inst')
  }
  
}