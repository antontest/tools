function post( URL, PARAMS )
{
   var temp = document.createElement( "form" );
   temp.action = URL;
   temp.method = "post";
   temp.style.display = "none";
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
   // 获取带"/"的项目名，如： / uimcardprj
   //var projectName = pathName.substring( 0, pathName.substr( 1 ).indexOf( '/' ) + 1 );
   return( localhostPaht );
}

//  ---------------------------------------

function homepage()
{
   window.onload = function( e )
   {
      var rootpath = getRootPath();
      var loginObj = document.getElementById( "u12_input" );
      loginObj.onclick = function( e )
      {
         e = e || window.event;
         var t = e.target || e.srcElement;
         var userObj = document.getElementById( "u10_input" );
         var uid = userObj.value;
         if( uid.length < 1 )
         {
            alert( "用户名不能为空!" );
            return;
         }

         var pwdObj = document.getElementById( "u11_input" );
         var pwd = pwdObj.value;
         if( pwd.length < 1 )
         {
            alert( "密码不能为空!" );
            return;
         }

         var params = Array();
         params['uid'] = uid;
         params['pwd'] = pwd;
         /*
         params['next_file'] = "htmlcontrol.html";
         */
         //alert(rootpath + "/php/login.php");
         post( rootpath + "/login.cgi", params );
      }
   }
}
