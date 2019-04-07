#' 插入黑底白字页
#'
#' @return 返回值
#' @export
#'
#' @examples insertInversePage();
insertInversePage <- function(){
  rstudioapi::insertText('---\n')
  rstudioapi::insertText('class: inverse, center, middle\n\n')
  rstudioapi::insertText('# 新的一页\n')

}
