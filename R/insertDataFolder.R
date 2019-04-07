#' 插入data-raw文件夹
#'
#' @return 返回值
#' @export
#'
#' @examples insertDataRawFolder();
insertDataRawFolder <- function(){
  devtools::use_data_raw()
}
