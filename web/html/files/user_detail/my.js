function post(URL, PARAMS)
{
   var temp = document.createElement("form");
   temp.action = URL;
   temp.method = "post";
   temp.style.display = "none";
   for (var x in PARAMS)
   {
      var opt = document.createElement("textarea");
      opt.name = x;
      opt.value = PARAMS[x];
      // alert(opt.name)
      temp.appendChild(opt);
   }
   document.body.appendChild(temp);
   temp.submit();
   return temp;
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

function user_detail()
{
   window.onload = function()
   {
      // update button
      var updatebutton = document.getElementById("u16");
      updatebutton.onmouseover = function(e)
      {
         e = e || window.event;
         var t = e.target || e.srcElement;
         t.style.cursor = 'pointer';
         // alert(t.id);
      }
      updatebutton.onclick = function(e)
      {
         // window.location.href = "../../../php/modify.php";
         // document.getElementById("update").click();
         var name = "";
         var nickname = "";
         var pwd = "";
         var email = "";
         if( ! (name = document.getElementById("u3_input").value))
         {
            alert("用户名不能为空！");
            return;
         }
         if( ! (nickname = document.getElementById("u8_input").value))
         {
            alert("昵称不能为空！");
            return;
         }
         if( ! (pwd = document.getElementById("u14_input").value))
         {
            alert("密码不能为空！");
            return;
         }
         if( ! (email = document.getElementById("u15_input").value))
         {
            alert("电子邮件不能为空！");
            return;
         }

         // var arrayName = Array('name', 'nickname', 'pwd', 'email', 'role');
         var params = Array();
         params['name'] = name;
         params['nickname'] = nickname;
         params['pwd'] = pwd;
         params['role'] = document.getElementById("u9_input").value;
         params['email'] = email;
         params['status'] = document.getElementById("u32_input").value;;
         var ori_name = getCookie('name');
         var ori_nickname = getCookie('nick_name');
         var ori_user_pwd = getCookie('user_pwd');
         var ori_email = getCookie('email');
         var ori_role_id = getCookie('role_id');
         var ori_user_id = getCookie('user_id');
         var ori_user_status = getCookie('user_status');
         if(ori_name==name && ori_nickname==nickname && ori_user_pwd == pwd && ori_email == email
             && ori_role_id == params['role'] && ori_user_status == params['status'])
         {
            window.history.back();
         }
         else post("../../../php/modify.php", params);    
      }

      // delete button
      var deletebutton = document.getElementById("u18");
      deletebutton.onmouseover = function(e)
      {
         e = e || window.event;
         var t = e.target || e.srcElement;
         t.style.cursor = 'pointer';
         // alert(t.id);
      }
      deletebutton.onclick = function(e)
      {
         if(confirm("确认删除该用户？"))
         window.location.href = "../../../php/deluser.php";
         return;
      }

      // admin_page listen
      var return_admin_page = document.getElementById("u20");
      return_admin_page.onmouseover = function(e)
      {
         e = e || window.event;
         var t = e.target || e.srcElement;
         t.style.cursor = 'pointer';
      }
      return_admin_page.onclick = function(e)
      {
         // alert("clk");
         window.location.href = "../../../admin_page.html";
         return;
      }

      // admin_page listen
      var return_user_admin_page = document.getElementById("u24");
      return_user_admin_page.onmouseover = function(e)
      {
         e = e || window.event;
         var t = e.target || e.srcElement;
         t.style.cursor = 'pointer';
      }
      return_user_admin_page.onclick = function(e)
      {
         // alert("clk");
         // window.location.href = "../../../user_admin_page.php";
         window.history.back();
         return;
      }
   }
}
