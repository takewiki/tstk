
#' 更新文档
#'
#' @return 返回值
#' @export
#'
#' @examples updateScriptFiles();
updateScriptFiles <- function(){
  #删除演示数据
  if(file.exists('R/hello.R')){
    file.remove('R/hello.R')
  }
  #同步删除hello生成的帮助手册md
  if(file.exists('man/hello.Rd')){
    file.remove('man/hello.Rd')
  }
  #删除namespace重新生成
  if(file.exists('NAMESPACE')){
    file.remove('NAMESPACE')
  }
  #更新文件
  devtools::document()
}
