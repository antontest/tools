// 三个参数都是必需的，查找一网页中5007个类名为“cell”的元素，IE8历时1828 ~ 1844毫秒，
// IE6为4610 ~ 6109毫秒，FF3.5为46 ~ 48毫秒，opera10为31 ~ 32毫秒，Chrome为23 ~ 26毫秒，
// safari4为19 ~ 20毫秒
function getElementsByClassName( strTagName, strClassName )
{
   var arrElements = ( strTagName == "*" && document.all ) ? document.all :
   document.getElementsByTagName( strTagName );
   var arrReturnElements = new Array();
   strClassName = strClassName.replace( /\-/g, "\\-" );
   var oRegExp = new RegExp( "(^|\\s)" + strClassName + "(\\s|$)" );
   var oElement;
   for( var i = 0; i < arrElements.length; i ++ )
   {
      oElement = arrElements[i];
      if( oRegExp.test( oElement.className ) )
      {
         arrReturnElements.push( oElement );
      }
   }
   return ( arrReturnElements )
}

//  ---------------------------------------

// js获取项目根路径，如： http : // localhost : 8083 / uimcardprj
function getRootPath()
{
   // 获取当前网址，如： http : // localhost : 8083 / uimcardprj / share / meun.jsp
   var curWwwPath = window.document.location.href;
   // 获取主机地址之后的目录，如： uimcardprj / share / meun.jsp
   var pathName = window.document.location.pathname;
   var pos = curWwwPath.indexOf( pathName );
   // 获取主机地址，如： http : // localhost : 8083
   var localhostPaht = curWwwPath.substring( 0, pos );
   //alert("localhostPaht='" + localhostPaht + "'");
   // 获取带"/"的项目名，如： / uimcardprj
   //var projectName = pathName.substring( 0, pathName.substr( 1 ).indexOf( '/' ) + 1 );
   //return( localhostPaht + projectName );
   return( localhostPaht  );
}

//  ---------------------------------------

function admin_page()
{
   window.onload = function()
   {
      var uimg = new Array();
      uimg = document.getElementsByTagName( "img" );
      var utxt = new Array();
      utxt = document.getElementsByTagName( "span" );
      var len = uimg.length;
      var rootpath = getRootPath();

      for( var i = 0; i < len; i ++ )
      {
         /*utxt[i].onmouseover = function( e )
         {
            e = e || window.event;
            var t = e.target || e.srcElement;
            t.style.cursor = 'pointer';
         }*/
         /*utxt[i].onclick = function( e )
         {
            e = e || window.event;
            var t = e.target || e.srcElement;
            var namestr = t.innerHTML || t.innerText;
            switch( namestr )
            {
               case '用户管理' :
                  // alert( namestr );
                  window.location.href = rootpath + "/user_admin_page.php";
                  break;
               case '产品目录' :
                  window.location.href = rootpath + "/prod_category_page.php";
                  break;
               case '项目数据' :
                  window.location.href = rootpath + "/project_list.php";
                  break;
               case '采购合同' :
                  window.location.href = rootpath + "/po_maintain.php";
                  document.cookie = "filepath='';";
                  break;
               default :
                  // window.location.href = "../../../user_admin_page.php";
                  break;
            }
         }*/
         uimg[i].onmouseover = function( e )
         {
            e = e || window.event;
            var t = e.target || e.srcElement;
            t.style.cursor = 'pointer';
            var id_tmp = t.id;
            var u = document.getElementById( id_tmp[0] + id_tmp[1] );
            // u.style.width = imgWidth * 1.08;
            // u.style.height = imgHeight * 1.08 + 5;
            var txtIdnum = 1 + parseInt( id_tmp[1], 10 );
            var uTxt = id_tmp[0] + txtIdnum;
            var object = document.getElementById( uTxt );
            object.style.fontSize = 16 + "px";

            t.src = rootpath + "/images/admin_page/u" + id_tmp[1] + "_mouseOver.png";
            t.style.width = 140 + "px";
            t.style.height = 80 + "px";
         }

         uimg[i].onmouseleave = function( e )
         {
            e = e || window.event;
            var t = e.target || e.srcElement;
            t.style.cursor = 'pointer';
            var id_tmp = t.id;
            var u = document.getElementById( id_tmp[0] + id_tmp[1] );
            var txtIdnum = 1 + parseInt( id_tmp[1], 10 );
            var uTxt = id_tmp[0] + txtIdnum;
            var object = document.getElementById( uTxt );
            object.style.fontSize = 13 + "px";
            // alert( "../../../images/admin_page/u" + id_tmp[1] + ".png" );
            if( t.src )
            t.src = rootpath + "/images/admin_page/u" + id_tmp[1] + ".png";

            t.style.width = 130 + "px";
            t.style.height = 70 + "px";
         }

         uimg[i].onclick = function( e )
         {
            e = e || window.event;
            var t = e.target || e.srcElement;
            var id_tmp = t.id;
            var txtIdnum = parseInt( id_tmp[1], 10 );
            // alert( "id=" + id_tmp );
            // var role = getCookie( "role" );
            // alert( role );
            switch( txtIdnum )
            {
               case 0 :
               window.location.href = rootpath + "/user_admin.cgi?next_file=user_admin_page.html";
               break;
               case 2 :
               window.location.href = rootpath + "/project_list.php";
               break;
               case 4 :
               window.location.href = rootpath + "/po_maintain.html";
               document.cookie = "filepath='';";
               break;
               case 6 :
               window.location.href = rootpath + "/prod_category_page.php";
               break;
               default :
               break;
            }
         }
      }
   }
}

