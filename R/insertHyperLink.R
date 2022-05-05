#' 插入超连接
#'
#' @return 返回值
#' @export
#'
#' @examples insertHyperLink();
insertHyperLink <-function(){
  rstudioapi::insertText('[文字描述](url_here)\n')
}
