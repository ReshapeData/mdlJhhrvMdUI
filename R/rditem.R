#' 按纽生成生成器界面
#'
#' @param colTitles  主页标题
#' @param widthRates 左右比例
#' @param func_left 左函数
#' @param func_right 右函数
#' @param tabTitle 标题
#' @param func_bottom  下面一栏
#'
#' @return 返回值
#' @import tsui
#' @export
#'
#' @examples
#' RditemUI()
RditemUI <- function(tabTitle ='研发项目',
                          colTitles =c('操作区','','显示区'),
                          widthRates =c(6,6,12),
                          func_left = RditemUI_left,
                          func_right =RditemUI_right,
                          func_bottom = RditemUI_bottom
) {

  #三栏式设置，可以复制
  res = tsui::uiGen3(tabTitle = tabTitle,colTitles =colTitles,widthRates = widthRates,func_left = func_left,func_right = func_right,func_bottom = func_bottom )
  return(res)

}





#' 请输入文件
#'
#' @return 返回值
#' @export
#'
#' @examples
#' RditemUI_left()
RditemUI_left <- function() {


  res <- shiny::tagList(


    tsui::uiTemplate(templateName = '基础资料模板表'),
    tsui::mdl_file(id = 'file_expInfo_Rditem',label ='请上传文件' ),

    shiny::actionButton(inputId = 'btn_preview_Rditem',label = '文件预览'),
    shiny::actionButton(inputId = 'btn_Update_Rditem',label = '更新研发项目')

  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' RditemUI_bottom()
RditemUI_right <- function() {
  res <- shiny::tagList(
    
    shiny::actionButton(inputId = 'btn_view_Rditem',label = '研发项目信息查询'),
    tsui::mdl_download_button(id = 'dl_dataview_Rditem',label = '下载研发项目')



  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' RditemUI_bottom()
RditemUI_bottom <- function() {
  res <- shiny::tagList(
    tsui::uiScrollX(tsui::mdl_dataTable(id = 'mdlJHmd_Rditem_resultView',label ='结果显示' )),
    tsui::uiScrollX(
      tsui::mdl_dataTable(id = 'dl_dataview_Rditem',label ='研发项目查询显示' )
    )
  )
  return(res)

}
