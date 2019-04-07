#' 注册Rstudio插件文件
#'
#' @param addinName 插件名称
#' @param addinDescription 插件描述
#' @param addBinding  插件函数名
#' @param addinInteractive 插件是否交互模式
#'
#' @return 返回值
#' @import rstudioapi
#' @export
#'
#' @examples regAddin();
regAddin <- function(addinName='注册Rstudio插件',
                     addinDescription='注册Rstudio插件，写入inst-rstudio-addins.dcf文件.',
                     addBinding='regAddin',
                     addinInteractive='false'){
  library(rstudioapi);
  insertText(paste('Name:',addinName,sep = ' ',collapse = '\n'));
  insertText("\n");
  insertText(paste('Description:',addinDescription,sep = ' ',collapse = '\n'));
  insertText("\n");
  insertText(paste('Binding:',addBinding,sep = ' ',collapse = '\n'));
  insertText("\n");
  insertText(paste('Interactive:',addinInteractive,sep = ' ',collapse = '\n'));
  insertText("\n");
  insertText("\n");
}
