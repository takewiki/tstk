#' 插入PPT的结构
#'
#' @return 返回值
#' @export
#' @import rstudioapi
#' @examples  insertImageTexts();
insertImageTexts <- function(){
  insertText('.pull-left[\n');
  insertText(' \n');
  insertText(' ![图片说明](./img/img_file.png)\n')
  insertText(' \n')
  insertText(']\n')
  insertText(' \n')
  insertText('.pull-right[\n')
  insertText(' \n')
  insertText('1. text1\n')
  insertText(' \n')
  insertText('1. text2\n')
  insertText(' \n')
  insertText('1. text3\n')
  insertText(' \n')
  insertText('1. text4\n')
  insertText(' \n')
  insertText('1. text5\n')
  insertText(' \n')
  insertText('1. text6\n')
  insertText(' \n')
  insertText(']\n')

}


