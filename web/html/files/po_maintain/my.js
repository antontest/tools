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
      var updatebutton = document.getElementById( "u16" );
      if (!updatebutton) {
          return;
      }

      updatebutton.onmouseover = function( e )
      {
         e = e || window.event;
         var t = e.target || e.srcElement;
         t.style.cursor = 'pointer';
         // alert( t.id );
      }

      updatebutton.onclick = function( e )
      {
         // alert( "clk" );
         window.location.href = "../../../admin_page.html";
         return;
      }

   }
}
