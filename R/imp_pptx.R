
#' 导入Microsoft PowerPoint PPTX
#'
#' @param pptx_file pptx完整的文件路径
#' @param author 作者，默认为hulilei
#'
#' @return 返回值
#' @import slidex
#' @export
#'
#' @examples imp_pptx('aa.pptx','hulilei');
imp_pptx <- function(pptx_file,author='hulilei'){
  convert_pptx(path = pptx_file, author = author);

}

