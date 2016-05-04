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

function user_add()
{
   window.onload = function()
   {
      // update button
      var updatebutton = document.getElementById( "u18" );
      updatebutton.onmouseover = function( e )
      {
         e = e || window.event;
         var t = e.target || e.srcElement;
         t.style.cursor = 'pointer';
         // alert( t.id );
      }
      updatebutton.onclick = function( e )
      {
         // window.location.href = "../../../php/modify.php";
         // document.getElementById( "update" ).click();
         var name = "";
         var nickname = "";
         var pwd = "";
         var email = "";
         if( ! ( name = document.getElementById( "u3_input" ).value ) )
         {
            alert( "用户名不能为空！" );
            return;
         }
         var charname1 = name.toLowerCase();
         var len = name.length;
         for ( var i = 0; i < len; i ++ )
         {
            var charname = charname1.charAt( i );
            if ( ! ( charname >= 0 && charname <= 9 ) && ( ! ( charname >= 'a' && charname <= 'z' ) ) && ( charname != '_' ) )
            {
               alert( "姓名包含非法字母，只能包含字母，数字，和下划线" );
               return false;
            }
         }
         if( ! ( nickname = document.getElementById( "u8_input" ).value ) )
         {
            alert( "姓名不能为空！" );
            return;
         }
         if( ! ( pwd = document.getElementById( "u14_input" ).value ) )
         {
            alert( "密码不能为空！" );
            return;
         }
         if( ! ( email = document.getElementById( "u15_input" ).value ) )
         {
            alert( "电子邮件不能为空！" );
            return;
         }

         //var email = document.form1.text4.value;
         var sw = email.indexOf( "@", 0 );
         var sw1 = email.indexOf( ".", 0 );
         var tt = sw1 - sw;
         if ( email.length == 0 )
         {
            alert( "电子邮件不能位空" );
            return false;
         }
         if ( email.indexOf( "@", 0 ) == - 1 )
         {
            alert( "电子邮件格式不正确，必须包含@符号！" );
            return false;
         }
         if ( email.indexOf( "com", 0 ) == - 1 )
         {
            alert( "电子邮件格式不正确，邮件地址没有com！" );
            return false;
         }
         if ( email.indexOf( ".", 0 ) == - 1 )
         {
            alert( "电子邮件格式不正确，必须包含.符号!" );
            return false;
         }
         if ( tt == 1 )
         {
            alert( "邮件格式不对。@和.不可以挨着！" );
            return false;
         }
         if ( sw > sw1 )
         {
            alert( "电子邮件格式不正确，@符号必须在.之前" );
            return false;
         }

         // var arrayName = Array( 'name', 'nickname', 'pwd', 'email', 'role' );
         var params = Array();
         params['name'] = name;
         params['nickname'] = nickname;
         params['pwd'] = pwd;
         params['role'] = document.getElementById( "u9_input" ).value;
         params['email'] = email;
         params['status'] = document.getElementById( "u32_input" ).value;
         post( "../../../php/adduser.php", params );

         /* alert( name );
         alert( nickname );
         alert( pwd );
         alert( params['role'] );
         alert( email ); */
      }

      // delete button
      /* var deletebutton = document.getElementById( "u18" );
      deletebutton.onmouseover = function( e )
      {
      e = e || window.event;
      var t = e.target || e.srcElement;
      t.style.cursor = 'pointer';
      // alert( t.id );
      }
      deletebutton.onclick = function( e )
      {
      if( confirm( "确认删除该用户？" ) )
      window.location.href = "../../../php/deluser.php";
      return;
      } */

      // admin_page listen
      var return_admin_page = document.getElementById( "u20" );
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
         return;
      }

      // admin_page listen
      var return_user_admin_page = document.getElementById( "u24" );
      return_user_admin_page.onmouseover = function( e )
      {
         e = e || window.event;
         var t = e.target || e.srcElement;
         t.style.cursor = 'pointer';
      }
      return_user_admin_page.onclick = function( e )
      {
         // alert( "clk" );
         // window.location.href = "../../../user_admin_page.php";
         window.history.back();
         return;
      }
   }
}
