#' 导入包
#'
#' @param conn 连接
#' @param FappId 软件程序
#'
#' @return
#'
#' @examples
#' importPkgs()
importPkgs <- function(conn=tsda::conn_rds('rdbe'),FappId ='system') {
sql <- paste0(" select  FPkgName from t_md_pkgs
 where FappId ='",FappId,"' and Fshow =1")  
data = tsda::sql_select(conn,sql)
ncount = nrow(data)
if(ncount >0){
  pkgs = data$FPkgName
  res <- pacman::p_load(char = pkgs)
}

  
}

#' 加载包
#'
#' @param app_id 
#'
#' @return 返回值
#' @export
#'
#' @examples
#'import() 
import <- function(app_id) {
  #加载所有系统包
  importPkgs()
  #加载程序相关包
  importPkgs(FappId = app_id)
  
  
}