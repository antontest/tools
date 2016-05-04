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

function prod_category_page()
{
   window.onload = function()
   {
      var adminObj = document.getElementById( "u38" );
      adminObj.onmouseover = function( e )
      {
         e = e || window.event;
         var t = e.target || e.srcElement;
         t.style.cursor = 'pointer';
      }
      adminObj.onclick = function( e )
      {
         window.location.href = "../../../admin_page.html";
         //window.history.back();
      }

      var addButton = document.getElementById( "u12" );
      addButton.onmouseover = function( e )
      {
         e = e || window.event;
         var t = e.target || e.srcElement;
         t.style.cursor = 'pointer';
      }
      addButton.onclick = function( e )
      {
         window.location.href = "../../../admin_page.html";
      }


      var selectObj = document.getElementById( "u36" );
      selectObj.onmouseover = function( e )
      {
         e = e || window.event;
         var t = e.target || e.srcElement;
         t.style.cursor = 'pointer';
      }
      selectObj.onclick = function( e )
      {
         /* var pagrams = [];
         pagrams['cate'] = document.getElementById( 'u27_input' ).value;
         pagrams['model'] = document.getElementById( 'u28_input' ).value;
         pagrams['brand'] = document.getElementById( 'u29_input' ).value;
         var urlstr = "../../../prod_category_page.php?" + "cate=" + encodeURIComponent( catename )
         + "&model=" + encodeURIComponent( modelname ) + "&brand=" + encodeURIComponent( brandname );
         window.location.href = urlstr;
         // post( "../../../prod_category_page.php", pagrams ); */
         // document.cookie = "cate=" + document.getElementById( 'u27_input' ).value + ";model=" + document.getElementById( 'u28_input' ).value + ";brand=" + document.getElementById( 'u29_input' ).value + ";";
         e = e || window.event;
         var t = e.target || e.srcElement;
         if( t.onclick == false )
         return;

         document.cookie = "cate=" + document.getElementById( 'u5_input' ).value + ";";
         document.cookie = "model=" + document.getElementById( 'u11_input' ).value + ";";
         document.cookie = "brand=" + document.getElementById( 'u8_input' ).value + ";";
         window.location.href = "../../../prod_category_page.php";
      }
   }

}
