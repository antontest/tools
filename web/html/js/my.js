// -------------------------------------------------------
//                 数据操作
// -------------------------------------------------------
// 数据升序排序
function  sortAscending(dataArray)
{
   var len = dataArray.length;
   var tmp = dataArray[0];
   for(var i = 0; i < len - 1; i ++ )
   {
      for(var j = 0; j < len - 1 - i; j ++ )
      {
         if(dataArray[j] > dataArray[j + 1])
         {
            tmp = dataArray[j];
            dataArray[j] = dataArray[j + 1];
            dataArray[j + 1] = tmp;
         }
      }
   }

   return dataArray;
}

// -------------------------------------------------------
//                 js提示对话框操作
// -------------------------------------------------------
// 弹出信息框
function dis(str)
{
   alert(str);
}

// 显示数组
function disArray(dataArray)
{
   var len = dataArray.length;
   for(var i = 0; i < len; i ++ )
   dis(dataArray[i]);
}

// 确认框，选择是或否
function show_confirm()
{
   var r = confirm("Press a button!");
   if (r == true)
   {
      alert("You pressed OK!");
   }
   else
   {
      alert("You pressed Cancel!");
   }
}

// 提示框, 带输入
function disp_prompt()
{
   var name = prompt("请输入您的名字", "Bill Gates")
   if (name != null && name != "")
   {
      document.write("你好！" + name + " 今天过得怎么样？")
   }
}

// -------------------------------------------------------
//                 js截取地址参数操作
// -------------------------------------------------------
// 获取地址参数
function GetArgFromHref(sArgName)
{
   var href = window.location.href;
   var args  = href.split("?");
   var retval = "";

   if(args[0] == href)
   {
      return retval;
   }
   var len = args.length;
   var str = args[len - 1];
   args = str.split("=");
   if(args.length <= 1) return retval;
   if(args[0] == sArgName || args[0] == "")
   {
      return args[1];

   }
   return retval;
}

// 获取地址参数
function GetArgsFromHref()
{
   var href = window.location.href;
   var args  = href.split("?");
   var retval = new Array();

   if(args[0] == href)
   {
      return retval;
   }
   var len = args.length;
   var str = args[len - 1];
   args = str.split("&");
   var len = args.length;
   if(len < 1) return retval;
   for(var i = 0; i < len; i ++ )
   {
      var arg = args[i].split("=");
      if(arg.length <= 1) retval[i] = "0";
      else retval[i] = arg[1];
   }
   return retval;
}

// 获取地址参数
function GetArgs()
{
   var href = window.location.href;
   var args  = href.split("?");
   var retval = new Array();

   if(args[0] == href)
   {
      return retval;
   }
   var len = args.length;
   var str = args[len - 1];
   return str;
}

// 显示数组数据
function printfArray(myarray)
{
   var len = myarray.length;
   for(var i = 0; i < len; i ++ )
   alert(myarray[i]);
}

// -------------------------------------------------------
//                 js下拉菜单操作
// -------------------------------------------------------
// 添加下拉项
function AddSelect(id, value)
{
   var a = document.getElementById(id);
   a.options[a.length] = new Option(value, '');
}
// 获取当前下拉框选项内容
function GetTextOfSelect(id)
{
   var a = document.getElementById(id);
   return a.options[a.selectedIndex].text;
}
// 清空下拉框
function ClearSelect(id)
{
   var a = document.getElementById(id);
   a.options.length = 1;
}
// 删除下拉框其中一项
function DeleteSelect(id)
{
   var a = document.getElementById(id);
   a.options.remove(a.selectedIndex);
}

// -------------------------------------------------------
//                 js操作表格
// -------------------------------------------------------
// js删除表格
function ClearTable(obj)
{
   // 按行删除
   var table = document.all(obj);
   var len = table.length;
   table[0].deleteTHead();
   for(var m = 0; m < len; m ++ )
   {
      table[m].deleteTHead();
      table[m].deleteCaption();
      table[m].deleteTFoot();
      var j = 0;
      j = table[m].rows.length;
      var count = 0;
      for(var i = j - 1; i >= 0; i -- )
      {
         table[m].deleteRow(i);
      }
      // fpr
   }
   // for
}
// function ClearTable(obj)


// -------------------------------------------------------
//                 js操作复选框
// -------------------------------------------------------
// 获取被选中的复选框的name值
function GetCheckedName()
{
   var str = document.all('check');
   var len = str.length;
   if(len < 1)
   return;
   var ids = new Array();
   var idnum = 0;
   // var id = "";
   for (i = len - 1; i >= 0; i -- )
   {
      if(str[i].checked == true)
      {
         // chestr += str[i].value + ",";
         var tb = document.getElementById(str[i].name);
         ids[idnum] = str[i].name;
         idnum ++ ;
         // document.getElementById("customers").deleteRow(str[i].name);
      }
      // if
   }
   // for

   return ids;
}

// 删除复选框选中的行数据
function AllCheckboxstate(urlstr)
{
   // 管理员确认删除数据，防止误删除
   var r = confirm("是否要删除数据？");
   if (r == false)
   return ;

   var str = document.all('check');
   var len = str.length;
   if(len < 1)
   return;
   var ids = new Array();
   var idnum = 0;
   // var id = "";
   for (i = len - 1; i >= 0; i -- )
   {
      if(str[i].checked == true)
      {
         // chestr += str[i].value + ",";
         var tb = document.getElementById(str[i].name);
         ids[idnum] = str[i].name;
         idnum ++ ;
         // document.getElementById("customers").deleteRow(str[i].name);
      }
      // if
   }
   // for
   var num = ids.length;
   if(num < 1)
   return;
   // alert(num);
   var tmp = "";
   for(j = 0; j < num - 1; j ++ )
   tmp += ids[j] + "a";
   tmp += ids[num - 1];
   // alert(tmp);
   window.location.href = urlstr + tmp;
}
// function AllCheckboxstate()

// 检测网页离开
function checkLeave()
{
   // event.returnValue = "确定离开当前页面吗？";
   // alert(event.returnValue);
   var   n   =   window.event.screenX   -   window.screenLeft;
   var   b   =   n   >   document.documentElement.scrollWidth - 20;
   if(b   &&   window.event.clientY   <   0   ||   window.event.altKey)
   {
      // alert("是关闭而非刷新");
      window.event.returnValue   =   "是否关闭？";
   }
   else
   {
      // alert("是刷新而非关闭");
   }
}
// checkLeave

// 修改用户信息
function modifyUserInfo(urlstr)
{
   var str = document.all('check');
   var len = str.length;
   if(len < 1)
   return;
   var ids = new Array();
   var idnum = 0;
   // var id = "";

   for (i = len - 1; i >= 0; i -- )
   {
      if(str[i].checked == true)
      {
         // chestr += str[i].value + ",";
         var tb = document.getElementById(str[i].name);
         ids[idnum] = str[i].name;
         idnum ++ ;
         // document.getElementById("customers").deleteRow(str[i].name);
      }
      // if
   }
   // for

   if(ids.length < 1 || ids[idnum - 1] == 0 || ids[idnum - 1] == '')
   return;
   // alert(ids[idnum - 1]);
   // return;
   window.location.href = urlstr + ids[idnum - 1];
}
// modifyUserInfo

// login_succ根据权限跳转指定页面
function isgoto(o, per)
{
   var name = o.name;
   switch(name)
   {
      case '0' :
         if(per != '0')
         {
            alert('对不起,没有相应权限!');
            return FALSE;
         }
         window.location.href = '../php/userinfo.php';
         return TRUE;
      case '1' :
         if(per != '1')
         {
            alert('对不起,没有相应权限!');
            return FALSE;
         }
         return TRUE;
      case '2' :
         if(per != '2')
         {
            alert('对不起,没有相应权限!');
            return FALSE;
         }
         window.location.href = '../php/prodetail.php';
         return TRUE;
      case '3' :
         if(per != '3')
         {
            alert('对不起,没有相应权限!');
            return FALSE;
         }
         return TRUE;
      default :
         return FALSE;
   }
   // switch
}

// input获取文件完整路径
function getFullPath(obj)
{
   if(obj)
   {
      // ie
      if (window.navigator.userAgent.indexOf("MSIE") >= 1)
      {
         obj.select();
         return document.selection.createRange().text;
      }
      // firefox
      else if(window.navigator.userAgent.indexOf("Firefox") >= 1)
      {
         if(obj.files)
         {
            try
            {
               netscape.security.PrivilegeManager.enablePrivilege( 'UniversalFileRead' )
            }
            catch (err)
            {
               // need to set signed.applets.codebase_principal_support to true
            }
            return obj.value;
         }
         return obj.value;
      }
      return obj.value;
   }
}

// FX获取文件路径方法
function readFileFirefox(fileBrowser)
{
   try
   {
      netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
   }
   catch (e)
   {
      alert('无法访问本地文件，由于浏览器安全设置。为了克服这一点，请按照下列步骤操作：(1)在地址栏输入"about:config";(2) 右键点击并选择 New->Boolean; (3) 输入"signed.applets.codebase_principal_support" （不含引号）作为一个新的首选项的名称;(4) 点击OK并试着重新加载文件');
      return;
   }
   var fileName = fileBrowser.value;
   // 这一步就能得到客户端完整路径。下面的是否判断的太复杂，还有下面得到ie的也很复杂。
   var file = Components.classes["@mozilla.org/file/local;1"]
   .createInstance(Components.interfaces.nsILocalFile);
   try
   {
      // Back slashes for windows
      file.initWithPath( fileName.replace(/\//g, "\\\\") );
   }
   catch(e)
   {
      if (e.result != Components.results.NS_ERROR_FILE_UNRECOGNIZED_PATH) throw e;
      alert("File '" + fileName + "' cannot be loaded: relative paths are not allowed. Please provide an absolute path to this file.");
      return;
   }
   if ( file.exists() == false )
   {
      alert("File '" + fileName + "' not found.");
      return;
   }
   return file.path;
}
// 根据不同浏览器获取路径
function getvl()
{
   // 判断浏览器
   var Sys =
   {
   }
   ;
   var ua = navigator.userAgent.toLowerCase();
   var s;
   (s = ua.match(/msie ([\d.]+)/)) ? Sys.ie = s[1] :
   (s = ua.match(/firefox\/([\d.]+)/)) ? Sys.firefox = s[1] :
   (s = ua.match(/chrome\/([\d.]+)/)) ? Sys.chrome = s[1] :
   (s = ua.match(/opera.([\d.]+)/)) ? Sys.opera = s[1] :
   (s = ua.match(/version\/([\d.]+).*safari/)) ? Sys.safari = s[1] : 0;
   var file_url = "";
   if(Sys.ie <= "6.0")
   {
      // ie5.5, ie6.0
      file_url = document.getElementById("file").value;
   }
   else if(Sys.ie >= "7.0")
   {
      // ie7, ie8
      var file = document.getElementById("file");
      //file.select();
      file_url = document.selection.createRange().text;
   }
   else if(Sys.firefox)
   {
      // fx
      // file_url = document.getElementById("file").files[0].getAsDataURL(); // 获取的路径为FF识别的加密字符串
      file_url = readFileFirefox(document.getElementById("file"));
      //document.getElementById("temp").value = file_url;
   }
   // alert(file_url);
   //document.getElementById("showpath").innerHTML = "获取文件域完整路径为：" + file_url;
   return file_url;
}

function settmp(name,nickname,pwd,email,role)
{
    //alert("nasdf");
    /*session.setAttribute("name",name);
    session.setAttribute("nickname",nickname);
    session.setAttribute("pwd",pwd);
    session.setAttribute("email",email);
    session.setAttribute("rolename",role);
    window.location.href="../php/modify.php";*/
    //alert(role);
    
    window.location.href="../php/modify.php?name="+name+"&nickname="+nickname+"&pwd="+pwd+"&email="+email+"&role="+role;
}
