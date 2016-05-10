function post( URL, PARAMS )
{
   var temp = document.createElement( "form" );
   temp.action = URL;
   temp.method = "post";
   temp.enctype = "multipart/form-data";
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

function file_upload()
{
   window.onload = function()
   {
      // update button
      var system_button = document.getElementById( "u5" );
      if (system_button) {
          system_button.onmouseover = function( e )
          {
              e = e || window.event;
                  var t = e.target || e.srcElement;
                  t.style.cursor = 'pointer';
                  // alert( t.id );
                  return;
          }

          system_button.onclick = function( e )
          {
             window.location.href="../../admin_page.html";
             return;
          }
      }


      // update button
      var upload_button = document.getElementById( "u16" );
      if (!upload_button) {
          return;
      }

      upload_button.onmouseover = function( e )
      {
         e = e || window.event;
         var t = e.target || e.srcElement;
         t.style.cursor = 'pointer';
         // alert( t.id );
      }

      /*
      var formObj = document.getElementById("h_submit");
      upload_button.onclick = formObj.onclick;
      return ;
      */
      upload_button.onclick = function( e )
      {
         // alert( "clk" );
         //window.location.href = "../../../admin_page.html";
         var formObj = document.getElementById("file_upload");
         if (!formObj) {
             alert("Form不存在，上传失败!");
             return;
         }

         formObj.submit();
         //formObj.click();
         return;
      }

   }
}
