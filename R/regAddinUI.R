#' 注册Rstudio Addin插件UI功能
#'
#' @return 返回值
#' @include regAddin.R
#' @import shiny
#' @import miniUI
#' @export
#'
#' @examples regAddinUI();
regAddinUI <-  function() {

  # Our ui will be a simple gadget page, which
  # simply displays the time in a 'UI' output.
  ui <- miniPage(
    gadgetTitleBar("Rstudio Addin Register"),
    miniContentPanel(
      textInput("AddinName", "插件名称"),
      textInput("AddinDescription", "插件功能详细描述"),
      textInput("AddinBuilding", "插件函数名称"),
      selectInput("AddinInteractive", "插件运行方式:",
                  c("控制台" = "true",
                    "脚本" = "false"))

  ))

  server <- function(input, output, session) {


    observeEvent(input$done, {
    regAddin(input$AddinName,input$AddinDescription,input$AddinBuilding,input$AddinInteractive);
      stopApp()
    })

  }

  # We'll use a pane viwer, and set the minimum height at
  # 300px to ensure we get enough screen space to display the clock.
  viewer <- paneViewer(300)
  runGadget(ui, server, viewer = viewer)

}



#' 创建数据中台模块
#'
#' @return 返回值
#' @include regAddin.R
#' @import shiny
#' @import miniUI
#' @include mdlDms.R
#' @export
#'
#' @examples
#' #
mdlCreateUI <-  function() {
  
  # Our ui will be a simple gadget page, which
  # simply displays the time in a 'UI' output.
  ui <- miniPage(
    gadgetTitleBar("创建DMS数据中台模块"),
    miniContentPanel(
      textInput("moduleName", "模块名称")
      
    ))
  
  server <- function(input, output, session) {
    
    
    observeEvent(input$done, {
      tstk::mdl_create(input$moduleName);
      stopApp()
    })
    
  }
  
  # We'll use a pane viwer, and set the minimum height at
  # 300px to ensure we get enough screen space to display the clock.
  viewer <- paneViewer(300)
  runGadget(ui, server, viewer = viewer)
  
}

