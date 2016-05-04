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

function project_add()
{
   window.onload = function()
   {
      var adminObj = document.getElementById( "u1" );
      adminObj.onmouseover = function( e )
      {
         e = e || window.event;
         var t = e.target || e.srcElement;
         t.style.cursor = 'pointer';
      }
      adminObj.onclick = function( e )
      {
         window.location.href = "../../../admin_page.html";
         // window.history.back();
         return;
      }

      var adminObj = document.getElementById( "u5" );
      adminObj.onmouseover = function( e )
      {
         e = e || window.event;
         var t = e.target || e.srcElement;
         t.style.cursor = 'pointer';
      }
      adminObj.onclick = function( e )
      {
         // window.location.href = "../../../project_list.php";
         window.history.back();
         return;
      }

      var saveBtn = document.getElementById( "u19" );
      saveBtn.onmouseover = function( e )
      {
         e = e || window.event;
         var t = e.target || e.srcElement;
         t.style.cursor = 'pointer';
      }
      saveBtn.onclick = function( e )
      {
         // window.location.href = "../../../admin_page.html";
         // window.history.back();
         var proName = document.getElementById( "u9_input" ).value;
         if( proName.length < 1 )
         {
            alert( "项目部名称不能为空" );
            return;
         }

         var proShortname = document.getElementById( "u12_input" ).value;
         if( proShortname.length < 1 )
         {
            alert( "项目部短名不能为空" );
            return;
         }
         var proDes = document.getElementById( "u18_input" ).value;
         if( proDes.length < 1 )
         {
            alert( "项目部描述不能为空" );
            return;
         }

         var proIncharge = document.getElementById( "u17_input" ).value;
         var proStatus = document.getElementById( "u23_input" ).value;

         var params = Array();
         params['proName'] = proName;
         params['proShortname'] = proShortname;
         params['proDes'] = proDes;
         params['proIncharge'] = proIncharge;
         params['proStatus'] = proStatus;
         post( "../../../php/addpro.php", params );
      }
   }
}
