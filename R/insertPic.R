#' 插入图片
#'
#' @return 返回值
#' @export
#'
#' @examples insertPic();
insertPic <- function(){
  rstudioapi::insertText('![图片说明](./img/pic_file_name.png)\n')
}
