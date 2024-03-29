

#' 修改com
#'
#' @param mdl_name 名称
#' @param mdl_dir  修改路径名
#'
#' @return 返回值
#' @export
#'
#' @examples
#' mdl_tidy
mdlCom_tidy <- function(mdl_dir='/home/hulilei/mdls/',mdl_name = 'mdlStarNight') {
  type='Com'
  
  #项目路径
  full_path = paste0(mdl_dir,mdl_name,'/',mdl_name,type)
  #修改项目文件
  rproj_old ='mdlDemoCom.Rproj'
  rproj_new = paste0(mdl_name,type,'.Rproj')
  from = paste0(full_path,'/',rproj_old)
  to = paste0(full_path,'/',rproj_new)
  if(file.exists(from)){
    #如果文件存在的话，就进行修改
    file.rename(from,to)
  }
  #修改DESCRIPTION文件
  desc_filePath = paste0(full_path,'/','DESCRIPTION')
  if(file.exists(desc_filePath)){
    #修改文件
    data_desc = readLines(desc_filePath)
    data_desc[1] = paste0("Package: ",mdl_name,type,"")
    data_desc[2] = paste0("Type: DMS")
    data_desc[3] = paste0("Title: ",mdl_name,type," mudule for reshape data solutions.")
    data_desc[4] = paste0("Version: 1.0.0")
    writeLines(data_desc,desc_filePath)
    
  }
  #修改global.R
  global_filePath = paste0(full_path,'/','global.R')
  data_global = readLines(global_filePath)
  data_global[7] = paste0("module_id ='",mdl_name,type,"'")
  writeLines(data_global,global_filePath)
  #重命名ui.R
  ui_old ='mdlDemoCom_ui.R'
  ui_new = paste0(mdl_name,type,"_ui.R")
  ui_fullPath_old = paste0(full_path,'/',ui_old)
  ui_fullPath_new = paste0(full_path,'/',ui_new)
  if(file.exists(ui_fullPath_old)){
    #如果存在UI文件,则进行修改
    file.rename(from = ui_fullPath_old,to = ui_fullPath_new)
  }
  #修改文件内容
  data_ui = readLines(ui_fullPath_new)
  data_ui[4] <- paste0("tabItem(tabName = \"",mdl_name,type,"\",")
  data_ui[8] <- paste0("                                    id='tabSet_",mdl_name,type,"',height = '300px',"   )
  writeLines(data_ui,ui_fullPath_new)
  #重命名server.R
  server_old ='mdlDemoCom_server.R'
  server_new = paste0(mdl_name,type,"_server.R")
  server_fullPath_old = paste0(full_path,'/',server_old)
  server_fullPath_new = paste0(full_path,'/',server_new)
  if(file.exists(server_fullPath_old)){
    #如果存在UI文件,则进行修改
    file.rename(from = server_fullPath_old,to = server_fullPath_new)
  }

  
  
}



#' 修改com
#'
#' @param mdl_name 名称
#' @param version 版本
#' @param author 作者
#' @param mdl_dir 模块目录
#'
#' @return 返回值
#' @export
#'
#' @examples
#' mdl_tidy
mdlServer_tidy <- function(mdl_dir='/home/hulilei/mdls/',mdl_name = 'mdlStarNight',version='1.0.0',author='hulilei') {
  type='Server'
  
  #项目路径
  full_path = paste0(mdl_dir,mdl_name,'/',mdl_name,type)
  #修改项目文件
  rproj_old ='mdlDemoServer.Rproj'
  rproj_new = paste0(mdl_name,type,'.Rproj')
  from = paste0(full_path,'/',rproj_old)
  to = paste0(full_path,'/',rproj_new)
  if(file.exists(from)){
    #如果文件存在的话，就进行修改
    file.rename(from,to)
  }
  
  #修改DESCRIPTION
  desc_filePath = paste0(full_path,'/','DESCRIPTION')
  data_desc = readLines(desc_filePath)
  data_desc[1] = paste0("Package: ",mdl_name,type,"" )
  data_desc[3] = paste0("Title: ",type," Package For DMS ",mdl_name," Module in R" )
  data_desc[4] = paste0("Version: ",version,"" )
  data_desc[5] = paste0("Author: ",author,"")
  data_desc[6] = paste0("Maintainer: hulilei <hulilei@takewiki.com.cn>")
  writeLines(data_desc,desc_filePath)
  #更新文件
  #删除演示数据
  file_help = paste0(full_path,"/R/hello.R")
  if(file.exists(file_help)){
    file.remove(file_help)
  }
  #同步删除hello生成的帮助手册md
  file_rd = paste0(full_path,"/man/hello.Rd")
  if(file.exists(file_rd)){
    file.remove(file_rd)
  }
  #删除namespace重新生成
  file_namespace =  desc_filePath = paste0(full_path,'/','NAMESPACE')
  if(file.exists(file_namespace)){
    file.remove(file_namespace)
  }
  #更新文件
  devtools::document(pkg = full_path)
  #重新安装包
  devtools::install(pkg = full_path)
  res <- TRUE
  return(res)
  
}

#' 修改UI
#'
#' @param mdl_dir  目标
#' @param mdl_name 名称
#' @param version 版本
#' @param author 作者
#'
#' @return 返回值
#' @export
#'
#' @examples
#' mdlUI_tidy
mdlUI_tidy <- function(mdl_dir='/home/hulilei/mdls/',mdl_name = 'mdlStarNight',version='1.0.0',author='hulilei') {
  type='UI'
  mdl_dir = 
  #项目路径
  full_path = paste0(mdl_dir,mdl_name,'/',mdl_name,type)
  #修改项目文件
  rproj_old ='mdlDemoUI.Rproj'
  rproj_new = paste0(mdl_name,type,'.Rproj')
  from = paste0(full_path,'/',rproj_old)
  to = paste0(full_path,'/',rproj_new)
  if(file.exists(from)){
    #如果文件存在的话，就进行修改
    file.rename(from,to)
  }
  
  #修改DESCRIPTION
  desc_filePath = paste0(full_path,'/','DESCRIPTION')
  data_desc = readLines(desc_filePath)
  data_desc[1] = paste0("Package: ",mdl_name,type,"" )
  data_desc[3] = paste0("Title: ",type," Package For DMS ",mdl_name," Module in R" )
  data_desc[4] = paste0("Version: ",version,"" )
  data_desc[5] = paste0("Author: ",author,"")
  data_desc[6] = paste0("Maintainer: hulilei <hulilei@takewiki.com.cn>")
  writeLines(data_desc,desc_filePath)
  #删除演示数据
  file_help = paste0(full_path,"/R/hello.R")
  if(file.exists(file_help)){
    file.remove(file_help)
  }
  #同步删除hello生成的帮助手册md
  file_rd = paste0(full_path,"/man/hello.Rd")
  if(file.exists(file_rd)){
    file.remove(file_rd)
  }
  #删除namespace重新生成
  file_namespace =  desc_filePath = paste0(full_path,'/','NAMESPACE')
  if(file.exists(file_namespace)){
    file.remove(file_namespace)
  }
  #更新文件
  devtools::document(pkg = full_path)
  #重新安装包
  devtools::install(pkg = full_path)
  res <- TRUE
  return(res)
  
}

#' 修改r
#'
#' @param mdl_dir  目标
#' @param mdl_name 名称
#' @param version 版本
#' @param author 作者
#'
#' @return 返回值
#' @export
#'
#' @examples
#' mdlr_tidy
mdlr_tidy <- function(mdl_dir='/home/hulilei/mdls/',mdl_name = 'mdlStarNight',version='1.0.0',author='hulilei') {
  type='r'
  
  #项目路径
  full_path = paste0(mdl_dir,mdl_name,'/',mdl_name,type)
  #修改项目文件
  rproj_old ='mdlDemor.Rproj'
  rproj_new = paste0(mdl_name,type,'.Rproj')
  from = paste0(full_path,'/',rproj_old)
  to = paste0(full_path,'/',rproj_new)
  if(file.exists(from)){
    #如果文件存在的话，就进行修改
    file.rename(from,to)
  }
  
  #修改DESCRIPTION
  desc_filePath = paste0(full_path,'/','DESCRIPTION')
  data_desc = readLines(desc_filePath)
  data_desc[1] = paste0("Package: ",mdl_name,type,"" )
  data_desc[3] = paste0("Title: ",type," Package For DMS ",mdl_name," Module in R" )
  data_desc[4] = paste0("Version: ",version,"" )
  data_desc[5] = paste0("Author: ",author,"")
  data_desc[6] = paste0("Maintainer: hulilei <hulilei@takewiki.com.cn>")
  writeLines(data_desc,desc_filePath)
  #删除演示数据
  file_help = paste0(full_path,"/R/hello.R")
  if(file.exists(file_help)){
    file.remove(file_help)
  }
  #同步删除hello生成的帮助手册md
  file_rd = paste0(full_path,"/man/hello.Rd")
  if(file.exists(file_rd)){
    file.remove(file_rd)
  }
  #删除namespace重新生成
  file_namespace =  desc_filePath = paste0(full_path,'/','NAMESPACE')
  if(file.exists(file_namespace)){
    file.remove(file_namespace)
  }
  #更新文件
  devtools::document(pkg = full_path)
  #重新安装包
  devtools::install(pkg = full_path)
  res <- TRUE
  return(res)
  
}

#' 修改r
#'
#' @param mdl_dir  目标
#' @param mdl_name 名称
#' @param version 版本
#' @param author 作者
#'
#' @return 返回值
#' @export
#'
#' @examples
#' mdlr_tidy
mdlPkg_tidy <- function(mdl_dir='/home/hulilei/mdls/',mdl_name = 'mdlStarNight',version='1.0.0',author='hulilei') {
  type='Pkg'
  
  #项目路径
  full_path = paste0(mdl_dir,mdl_name,'/',mdl_name,type)
  #修改项目文件
  rproj_old ='mdlDemoPkg.Rproj'
  rproj_new = paste0(mdl_name,type,'.Rproj')
  from = paste0(full_path,'/',rproj_old)
  to = paste0(full_path,'/',rproj_new)
  if(file.exists(from)){
    #如果文件存在的话，就进行修改
    file.rename(from,to)
  }
  
  #修改DESCRIPTION
  desc_filePath = paste0(full_path,'/','DESCRIPTION')
  data_desc = readLines(desc_filePath)
  data_desc[1] = paste0("Package: ",mdl_name,type,"" )
  data_desc[3] = paste0("Title: ",type," Package For DMS ",mdl_name," Module in R" )
  data_desc[4] = paste0("Version: ",version,"" )
  data_desc[5] = paste0("Author: ",author,"")
  data_desc[6] = paste0("Maintainer: hulilei <hulilei@takewiki.com.cn>")
  writeLines(data_desc,desc_filePath)
  #删除演示数据
  file_help = paste0(full_path,"/R/hello.R")
  if(file.exists(file_help)){
    file.remove(file_help)
  }
  #同步删除hello生成的帮助手册md
  file_rd = paste0(full_path,"/man/hello.Rd")
  if(file.exists(file_rd)){
    file.remove(file_rd)
  }
  #删除namespace重新生成
  file_namespace =  desc_filePath = paste0(full_path,'/','NAMESPACE')
  if(file.exists(file_namespace)){
    file.remove(file_namespace)
  }
  #更新文件
  devtools::document(pkg = full_path)
  #重新安装包
  devtools::install(pkg = full_path)
  #针对git进行修改
  # system2(paste0("git add ",full_path,""))
  # system2(paste0("git commit -m 'v",version,"'"))
  # git_cmd = paste0("git remote add origin git@github.com:takewiki/",mdl_name,type,".git")
  # system2(git_cmd)
  # system2("git branch -M main")
  # system2("git push -u origin main")
  
  
  res <- TRUE
  return(res)
  
}


#' 创建DMS模块 
#'
#' @param mdl_dir   模块目录
#' @param mdl_name 模块名称
#' @param demo_dir 模板目录
#' @param demo_name 模板名称
#' @param type  模板类型
#'
#' @return 返回值
#' @export
#'
#' @examples
#' mdl_create()
mdl_create <- function(mdl_name = 'mdlStarNight',mdl_dir = '/home/hulilei/mdls/',
                       demo_dir = '/home/hulilei/mdls/mdlDemo/',demo_name = 'mdlDemo',type=c('Com','Pkg','r','Server','UI')) {
  mdl_fullName = paste0(mdl_dir,mdl_name)
  mdl_dir_demo = paste0(demo_dir,demo_name,type)
  mdl_dir_prj = paste0(mdl_fullName,'/',mdl_name,type)
  mdl_dir_temp = paste0(mdl_fullName,'/',demo_name,type)
  # 创建项目目录
  if(!dir.exists(mdl_fullName)){
    dir.create(mdl_fullName)
  }
  #如果存在复制过来demo模板数据需要删除,则需要删除
  lapply(mdl_dir_temp, function(dir_path){
    if(dir.exists(dir_path)){
      #删除目录
      unlink(dir_path,recursive = T)
    }
  })
  
  #复制模
  file.copy(from=mdl_dir_demo,to=mdl_fullName,overwrite = T,recursive = T)
  #如果目标项目文件已经存在，则需要进行删除
  lapply(mdl_dir_prj, function(dir_path){
    if(dir.exists(dir_path)){
      #删除目录
      unlink(dir_path,recursive = T)
    }
  })
  #重命名
  file.rename(mdl_dir_temp,mdl_dir_prj)
  #针对文件做进一步的处理
  mdlCom_tidy(mdl_dir = mdl_dir,mdl_name = mdl_name)
  mdlUI_tidy(mdl_dir = mdl_dir,mdl_name = mdl_name)
  mdlServer_tidy(mdl_dir = mdl_dir,mdl_name = mdl_name)
  mdlPkg_tidy(mdl_dir = mdl_dir,mdl_name = mdl_name)
  mdlr_tidy(mdl_dir = mdl_dir,mdl_name = mdl_name)
  
  res <- TRUE
  return(res)
}