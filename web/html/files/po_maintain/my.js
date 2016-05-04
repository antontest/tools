function post( URL, PARAMS )
{
   var temp = document.createElement( "form" );
   temp.action = URL;
   temp.method = "post";
   temp.style.display = "none";
   temp.style.enctype = "multipart/form-data";
   for ( var x in PARAMS )
   {
      var opt = document.createElement( "textarea" );
      opt.name = x;
      opt.value = PARAMS[x];
      // alert( opt.name )
      temp.appendChild( opt );
   }
   document.body.appendChild( temp );
   temp.submit();
   return temp;
}

//  ---------------------------------------

// �����������Ǳ���ģ�����һ��ҳ��5007������Ϊ��cell����Ԫ�أ�IE8��ʱ1828 ~ 1844���룬
// IE6Ϊ4610 ~ 6109���룬FF3.5Ϊ46 ~ 48���룬opera10Ϊ31 ~ 32���룬ChromeΪ23 ~ 26���룬
// safari4Ϊ19 ~ 20����
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

// FX获取文件路径方法
function readFileFirefox( fileBrowser )
{
   try
   {
      netscape.security.PrivilegeManager.enablePrivilege( "UniversalXPConnect" );
   }
   catch ( e )
   {
      alert( '无法访问本地文件，由于浏览器安全设置。为了克服这一点，请按照下列步骤操作：(1)在地址栏输入"about:config";(2) 右键点击并选择 New->Boolean; (3) 输入"signed.applets.codebase_principal_support" （不含引号）作为一个新的首选项的名称;(4) 点击OK并试着重新加载文件' );
      return;
   }
   var fileName = fileBrowser.value;
   // 这一步就能得到客户端完整路径。下面的是否判断的太复杂，还有下面得到ie的也很复杂。
   var file = Components.classes["@mozilla.org/file/local;1"]
   .createInstance( Components.interfaces.nsILocalFile );
   try
   {
      // Back slashes for windows
      file.initWithPath( fileName.replace( /\//g, "\\\\" ) );
   }
   catch( e )
   {
      if ( e.result != Components.results.NS_ERROR_FILE_UNRECOGNIZED_PATH ) throw e;
      alert( "File '" + fileName + "' cannot be loaded: relative paths are not allowed. Please provide an absolute path to this file." );
      return;
   }
   if ( file.exists() == false )
   {
      alert( "File '" + fileName + "' not found." );
      return;
   }


   return file.path;
}

//  ---------------------------------------

// 根据不同浏览器获取路径
function getvl( obj )
{
   // 判断浏览器
   var Sys =
   {
   }
   ;
   var ua = navigator.userAgent.toLowerCase();
   var s;
   ( s = ua.match( /msie ([\d.]+)/ ) ) ? Sys.ie = s[1] :
   ( s = ua.match( /firefox\/([\d.]+)/ ) ) ? Sys.firefox = s[1] :
   ( s = ua.match( /chrome\/([\d.]+)/ ) ) ? Sys.chrome = s[1] :
   ( s = ua.match( /opera.([\d.]+)/ ) ) ? Sys.opera = s[1] :
   ( s = ua.match( /version\/([\d.]+).*safari/ ) ) ? Sys.safari = s[1] : 0;
   var file_url = "";
   if( Sys.ie <= "6.0" )
   {
      // ie5.5, ie6.0
      file_url = obj.value;
   }
   else if( Sys.ie >= "7.0" )
   {
      // ie7, ie8
      obj.select();
      obj.blur();
      file_url = document.selection.createRange().text;
   }
   else if( Sys.firefox )
   {
      // fx
      // file_url = document.getElementById( "file" ).files[0].getAsDataURL(); // 获取的路径为FF识别的加密字符�
      file_url = readFileFirefox( obj );
      // alert( file_url );
   }
   else if( Sys.chrome )
   {
      file_url = obj.value;
   }

   // alert( file_url );
   return file_url;
}

//  ---------------------------------------

function setCookie( name, value )
{
   var Days = 30;
   var exp = new Date();
   exp.setTime( exp.getTime() + Days * 24 * 60 * 60 * 1000 );
   document.cookie = name + "=" + escape ( value ) + ";expires=" + exp.toGMTString();
}

//  ---------------------------------------

function getCookie( name )
{
   var arr, reg = new RegExp( "(^| )" + name + "=([^;]*)(;|$)" );

   if( arr = document.cookie.match( reg ) )

   return unescape( arr[2] );
   else
   return null;
}

//  ---------------------------------------

function delCookie( name )
{
   var exp = new Date();
   exp.setTime( exp.getTime() - 1 );
   var cval = getCookie( name );
   if( cval != null )
   document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
}

//  ---------------------------------------

function po_maintain()
{
   window.onload = function( e )
   {
      // admin_page listen
      var return_admin_page = document.getElementById( "u5" );
      return_admin_page.onmouseover = function( e )
      {
         e = e || window.event;
         var t = e.target || e.srcElement;
         t.style.cursor = 'pointer';
      }
      return_admin_page.onclick = function( e )
      {
         // alert( "clk" );
         window.location.href = "../../../admin_page.html";
         // window.history.back();
         return;
      }

      var fileObj = document.getElementById( "u15_input" );
      fileObj.onchange = function( e )
      {
         e = e || window.event;
         var t = e.target || e.srcElement;
         var urlObj = document.getElementById( "u15_input" );
         var url = getvl( urlObj );
         // alert( url );
         if( url.indexOf( "xls", 0 ) == - 1 )
         {
            //urlObj.value = '';
            alert( "请选择正确的excel文档!" );
            return;
         }
         // document.cookie = "filepath=" + encodeURI( url ) + ";";
         /* var params = Array();
         params['filepath'] = url;
         post( "../../../po_maintain.php", params ); */
      }

      var upload = document.getElementById( "u16" );
      upload.onmouseover = function( e )
      {
         e = e || window.event;
         var t = e.target || e.srcElement;
         t.style.cursor = 'pointer';
      }
      upload.onclick = function( e )
      {
         // window.location.href = "../../../admin_page.html";
         // window.history.back();
         var urlObj = document.getElementById( "u15_input" );
         var url = urlObj.value;
         // var url = getCookie( "filepath" );
         // url = decodeURI( url );
         if( url.indexOf( "xls", 0 ) == - 1 || url == '' )
         {
            alert( "请选择正确的excel文档!" );
            return;
         }
         /* setCookie( 'clkupdateBtn', 1 );
         var params = Array();
         params[''] = name; */
         // window.location.href = "../../../po_maintain.php";
         // post( "../../../po_maintain.php", );
         var tmp = document.getElementById( "file" );
         tmp.click();
         return;
      }

      var addObj = new Array();
      addObj = getElementsByClassName( "span", "addlink" );
      var len = addObj.length;

      for( i = 0; i < len; i ++ )
      {
         addObj[i].onmouseover = function( e )
         {
            e = e || window.event;
            var t = e.target || e.srcElement;
            t.style.cursor = 'pointer';
         }

         addObj[i].onclick = function( e )
         {
            e = e || window.event;
            var t = e.target || e.srcElement;
            var id_tmp = t.id;
            setCookie( "proname", encodeURI( id_tmp ) );
            window.location.href = "../../../project_add.php";
         }
      }

      var okbutton = document.getElementById( "uok" );
      if( okbutton == null )
      return;
      okbutton.onmouseover = function( e )
      {
         e = e || window.event;
         var t = e.target || e.srcElement;
         t.style.cursor = 'pointer';
      }
      okbutton.onclick = function( e )
      {
         var procount = getCookie( "project_namecount" );
         //alert(parseInt( procount ) );
         if( parseInt( procount ) > 0 )
         {
            alert( "请首先添加尚不存在的项目部?" );
            return;
         }
         window.location.href = "../../../php/addDataTomysqlFromExcel.php";
         // alert( "input file url = " + url );
         return;
      }
   }
}
