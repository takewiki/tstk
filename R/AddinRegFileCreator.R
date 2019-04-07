#' 创建插件的注册文件
#'
#' @return 返回值
#' @export
#'
#' @examples AddinRegFileCreator();
AddinRegFileCreator <- function(){
  if(!dir.exists('./inst')){
    dir.create('./inst');
  }
  if(!dir.exists("./inst/rstudio")){
    dir.create("./inst/rstudio");
  }
  if(!file.exists("./inst/rstudio/addins.dcf")){
    file.create("./inst/rstudio/addins.dcf");
  }

}
