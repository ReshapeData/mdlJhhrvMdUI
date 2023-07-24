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
#' AcctUI()
AcctUI <- function(tabTitle ='科目',
                          colTitles =c('操作区','','显示区'),
                          widthRates =c(6,6,12),
                          func_left = AcctUI_left,
                          func_right =AcctUI_right,
                          func_bottom = AcctUI_bottom
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
#' AcctUI_left()
AcctUI_left <- function() {


  res <- shiny::tagList(


    tsui::uiTemplate(templateName = '基础资料模板表'),
    tsui::mdl_file(id = 'file_expInfo_Acct',label ='请上传文件' ),

    shiny::actionButton(inputId = 'btn_preview_Acct',label = '文件预览'),
    shiny::actionButton(inputId = 'btn_Update_Acct',label = '更新科目'),
    

  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' AcctUI_bottom()
AcctUI_right <- function() {
  res <- shiny::tagList(
    shiny::actionButton(inputId = 'btn_view_Acct',label = '科目信息查询'),
    tsui::mdl_download_button(id = 'dl_dataview_Acct',label = '下载科目')
    



  )
  return(res)

}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' AcctUI_bottom()
AcctUI_bottom <- function() {
  res <- shiny::tagList(
    tsui::uiScrollX(tsui::mdl_dataTable(id = 'mdlJHmd_Acct_resultView',label ='预览结果显示' )
                    ),
    tsui::uiScrollX(
                    tsui::mdl_dataTable(id = 'dl_dataview_Acct',label ='科目查询显示' )
    )
    
  )
  return(res)

}
