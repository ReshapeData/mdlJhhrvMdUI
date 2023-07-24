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
#' AcctreclassUI()
AcctreclassUI <- function(tabTitle ='重分类',
                        colTitles =c('操作区','','显示区'),
                        widthRates =c(6,6,12),
                        func_left = AcctreclassUI_left,
                        func_right =AcctreclassUI_right,
                        func_bottom = AcctreclassUI_bottom
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
#' AcctreclassUI_left()
AcctreclassUI_left <- function() {


  res <- shiny::tagList(
    tsui::uiTemplate(templateName = '基础资料模板表'),
    tsui::mdl_file(id = 'file_expInfo_Acctreclass',label ='请上传文件' ),


    shiny::actionButton(inputId = 'btn_preview_Acctreclass',label = '文件预览'),

    shiny::actionButton(inputId = 'btn_Update_Acctreclass',label = '更新重分类'),
    

  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' AcctreclassUI_bottom()
AcctreclassUI_right <- function() {
  res <- shiny::tagList(
    
    
    shiny::actionButton(inputId = 'btn_view_Acctreclass',label = '重分类信息查询'),
    tsui::mdl_download_button(id = 'dl_dataview_Acctreclass',label = '下载重分类')



  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' AcctreclassUI_bottom()
AcctreclassUI_bottom <- function() {
  res <- shiny::tagList(
    tsui::uiScrollX(tsui::mdl_dataTable(id = 'mdlJHmd_Acctreclass_resultView',label ='结果显示' )),
    tsui::uiScrollX(
      tsui::mdl_dataTable(id = 'dl_dataview_Acctreclass',label ='重分类查询显示' )
    )
  )
  return(res)

}
