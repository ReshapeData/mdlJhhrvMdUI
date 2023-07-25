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
#' WorkcenterUI()
WorkcenterUI <- function(tabTitle ='责任中心',
                          colTitles =c('操作区','','显示区'),
                          widthRates =c(6,6,12),
                          func_left = WorkcenterUI_left,
                          func_right =WorkcenterUI_right,
                          func_bottom = WorkcenterUI_bottom
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
#' WorkcenterUI_left()
WorkcenterUI_left <- function() {


  res <- shiny::tagList(


    tsui::uiTemplate(templateName = '04 责任中心模板表'),
    tsui::mdl_file(id = 'file_expInfo_Workcenter',label ='请上传文件' ),

    shiny::actionButton(inputId = 'btn_preview_Workcenter',label = '文件预览'),
    shiny::actionButton(inputId = 'btn_Update_Workcenter',label = '更新责任中心')
  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' WorkcenterUI_bottom()
WorkcenterUI_right <- function() {
  res <- shiny::tagList(
    
    shiny::actionButton(inputId = 'btn_view_Workcenter',label = '责任中心信息查询'),
    tsui::mdl_download_button(id = 'mdlJHmd_Workcenter_resultView',label = '下载责任中心')



  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' WorkcenterUI_bottom()
WorkcenterUI_bottom <- function() {
  res <- shiny::tagList(
    tsui::uiScrollX(tsui::mdl_dataTable(id = 'mdlJHmd_Workcenter_resultView',label ='结果显示' ))
  )
  return(res)

}
