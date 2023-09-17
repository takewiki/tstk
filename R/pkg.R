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


#' 设置包的版本号
#'
#' @return 返回值
#' @export
#'
#' @examples
#' pkgVersion_set()
pkgVersion_set <- function() {
  #判断文件是否存在
  flag = file.exists("./DESCRIPTION")
  if (flag){
    version_origin = pkgVersion_get()
    if(version_origin <='1.0.0'){
      version_origin = '1.0.0'
    }
    data_desc = readLines("./DESCRIPTION")
    data_desc[4] <- paste0("Version: ",version_origin,"")
    writeLines(data_desc,"./DESCRIPTION")
    res <- TRUE
  }else{
    res <- FALSE
  }
  return(res)
  
}



#' 代码推荐至github
#'
#' @param github_userName github用户名
#' @param branch 分支
#' @param init 初始化
#'
#' @return 返回值
#' @include dms.R
#' @export
#'
#' @examples
#' pkg_push2Github()
pkg_push2Github <- function(github_userName='takewiki',branch='main',init=TRUE) {
  #添加代码文件
  system(paste0("git add ."))
  #提交代码
  pkg_version = pkgVersion_get()
  system(paste0("git commit -m 'v",pkg_version,"'"))
  #推动至服务器
  pkg_name = pkgName_get()
  #添加相关操作
  dms_token = dmsToken_get()
  if(init){
    #创建repo
    github::repo_create(dms_token = dms_token,userName = github_userName,repoName = pkg_name)
    # 本地添加远程地址
    system(paste0("git remote add origin git@github.com:",github_userName,"/",pkg_name,".git"))
  }
  
  #创建分支
  system(paste0("git branch -M ",branch,""))
  system(paste0("git push -u origin ",branch,""))
  #发布新版本
  github::release_create(dms_token = dms_token,userName = github_userName,repoName = pkg_name,tagName = paste0('v',pkg_version))
  #重启会话,此时将刷新git页签
  rstudioapi::restartSession()
  
}



#' 代码推荐至github的main分支
#'
#' @return 返回值
#' @export
#'
#' @examples
#' pkg_push2Github()
pkg_push2Github_main_init <- function() {
 pkg_push2Github(branch = 'main',init = TRUE)
  
}

#' 代码推荐至github的main分支
#'
#' @return 返回值
#' @export
#'
#' @examples
#' pkg_push2Github()
pkg_push2Github_main_update <- function() {
  pkg_push2Github(branch = 'main',init = FALSE)
  
}

#' 代码推荐至github的master分支
#'
#' @return 返回值
#' @export
#'
#' @examples
#' pkg_push2Github()
pkg_push2Github_master_init <- function() {
  pkg_push2Github(branch = 'master',init = TRUE)
  
}



#' 代码推荐至github的master分支
#'
#' @return 返回值
#' @export
#'
#' @examples
#' pkg_push2Github()
pkg_push2Github_master_update <- function() {
  pkg_push2Github(branch = 'master',init = FALSE)
  
}

#' 智能同步至github
#'
#' @return 返回值
#' @export
#'
#' @examples
#' pkg_push2Github_auto()
pkg_push2Github_auto <- function() {
  
  pkg_version = pkgVersion_get()
  pkg_name = pkgName_get()
  init = pkg_version <='1.0.0'
  if(tsdo::left('tstk',2) =='ts'){
    branch ='master'
  }else{
    branch = 'main'
  }
  pkg_push2Github(branch = branch,init = init)
}





#' 更新ReshapeDataFork版本
#'
#' @return 返回值
#' @export
#'
#' @examples
#' pkg_fork2Github()
pkg_fork2Github <- function() {
  dms_token = dmsToken_get()
  pkg_version = pkgVersion_get()
  pkg_name = pkgName_get()
  github::flow_fork(dms_token = dms_token,userName = 'takewiki' ,repoName = pkg_name,collaboratorName ='ReshapeData' ,tagName =pkg_version ,minute = 1)
}


#' Fork版本发布
#'
#' @return 返回值
#' @export
#'
#' @examples
#' pkg_forkRelease()
pkg_forkRelease <- function() {
  dms_token = dmsToken_get()
  pkg_version = pkgVersion_get()
  pkg_name = pkgName_get()
  github::release_create(dms_token = dms_token,userName = 'ReshapeData',repoName = pkg_name,tagName = pkg_version)
}

#' R包结构优化
#'
#' @return 返回值
#' @export
#'
#' @examples
#' pkg_optimum()
pkg_optimum <- function(){
  #data_create
  debug_create()
  #设置测试2
  debug2_create
  #测试
  insertTestFolder()
  #data-raw
  insertDataRawFolder()
  #设置版本号
  pkgVersion_set()
  
}