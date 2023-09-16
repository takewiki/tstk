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


#' 返回包名
#'
#' @return 返回值
#' @export
#'
#' @examples
#' pkgName_get()
pkgName_get <- function() {
  #判断文件是否存在
  flag = file.exists("./DESCRIPTION")
  if (flag){
    data_desc = readLines("./DESCRIPTION")
    data_package = data_desc[1]
    list_name = strsplit(data_package," ")
    value_name = list_name[[1]]
    ncount= length(value_name)
    res = value_name[ncount] 
  }else{
    res <- NULL
  }
  return(res)
 
}




#' 返回包的版本号
#'
#' @return 返回值
#' @export
#'
#' @examples
#' pkgVersion_get()
pkgVersion_get <- function() {
  #判断文件是否存在
  flag = file.exists("./DESCRIPTION")
  if (flag){
    data_desc = readLines("./DESCRIPTION")
    data_package = data_desc[4]
    list_name = strsplit(data_package," ")
    value_name = list_name[[1]]
    ncount= length(value_name)
    res = value_name[ncount] 
  }else{
    res <- NULL
  }
  return(res)
  
}



#' 代码推荐至github
#'
#' @param github_userName github用户名
#' @param branch 分支
#'
#' @return 返回值
#' @export
#'
#' @examples
#' pkg_push2Github()
pkg_push2Github <- function(github_userName='takewiki',branch='main') {
  #添加代码文件
  system(paste0("git add ."))
  #提交代码
  pkg_version = pkgVersion_get()
  system(paste0("git commit -m 'v",pkg_version,"'"))
  #推动至服务器
  pkg_name = pkgName_get()
  system(paste0("git remote add origin git@github.com:",github_userName,"/",pkg_name,".git"))
  #创建分支
  system(paste0("git branch -M ",branch,""))
  system(paste0("git push -u origin ",branch,""))
  
}