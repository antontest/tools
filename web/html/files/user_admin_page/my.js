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

function user_admin_page()
{
   window.onload = function()
   {
      // var tmp = document.getElementById( "u0" );
      // var imgObj = document.getElementsByName( "ax_table_cell" );

      // add button listen
      var addbutton = document.getElementById( "add_button" );
      if (addbutton)
      {
          addbutton.onmouseover = function( e )
          {
              e = e || window.event;
                  var t = e.target || e.srcElement;
                  t.style.cursor = 'pointer';
                  // alert( t.id );
          }
          addbutton.onclick = function( e )
          {
              // alert( "clk" );
              window.location.href = "user_add.cgi?next_file=user_add.html";
                  return;
          }
      }

      // admin_page listen
      var return_admin_page = document.getElementById( "uu1_img" );
      if (return_admin_page)
      {
          return_admin_page.onmouseover = function( e )
          {
              e = e || window.event;
              var t = e.target || e.srcElement;
              t.style.cursor = 'pointer';
              alert("over");
          }
          return_admin_page.onclick = function( e )
          {
              alert( "clk" );
              window.location.href = "../../../admin_page.html";
              //window.history.back();
              return;
          }
      }

      var ax_table_name_spanObj = new Array();
      var uSpan = new Array();
      uSpan = getElementsByClassName( "span", "ax_table_name_span" );
      var len = uSpan.length;

      for( i = 0; i < len; i ++ )
      {
         uSpan[i].style.color = 'blue';
         uSpan[i].onmouseover = function( e )
         {
            e = e || window.event;
            var t = e.target || e.srcElement;
            t.style.cursor = 'pointer';
         }

         uSpan[i].onclick = function( e )
         {
            e = e || window.event;
            var t = e.target || e.srcElement;
            //var pagrams = [];
            //pagrams['name'] = t.innerHTML;
            // window.location.href = "../../../user_detail.php?name=" + t.innerHTML;
            // post( "../../../user_detail.php", pagrams );
            document.cookie = "name=" + t.innerHTML + ";";
            window.location.href = "../../../user_detail.cgi?next_file=user_detail.html&user_name=" + t.innerHTML;
         }
      }

      var imgObj = new Array();
      imgObj = getElementsByClassName( "div", "ax_table_cell" );
      var len = imgObj.length;
      var uimg = new Array();
      var i = 0;
      for( i = 0; i < len; i ++ )
      uimg[i] = document.getElementById( imgObj[i].id );

      for( i = 0; i < len; i ++ )
      {
         uimg[i].onmouseover = function( e )
         {
            e = e || window.event;
            var t = e.target || e.srcElement;
            var id_tmp = t.id;
            // alert( id_tmp );
            var _num = id_tmp.indexOf( "_" );
            var imgname = id_tmp.substr( 1, _num );
            var num_div = parseInt( imgname, 10 );
            if( num_div < 10 )
            return;
            var num_img = 20 + num_div % 10;
            var imgname = "u" + num_img + "_mouseOver.png";
            // var imgobj = document.getElementById( "u" + num_div + "_img" );
            // if( imgobj )
            // imgobj.src = "../../../images/user_admin_page/" + imgname;
            // var path = "../../../images/user_admin_page/" + imgname;
            t.src = "../../../images/user_admin_page/" + imgname;
         }

         uimg[i].onmouseleave = function( e )
         {
            e = e || window.event;
            var t = e.target || e.srcElement;
            var id_tmp = t.id;
            // alert( id_tmp );
            var _num = id_tmp.length;
            var imgname = id_tmp.substr( 1, _num );
            var num_div = parseInt( imgname, 10 );
            var num_img = 0;
            if( num_div < 10 )
            return;
            else if( num_div > 10 && num_div < ( len * 2 - 10 ) )
            num_img = 20 + num_div % 10;
            else   num_img = 40 + num_div % 10;
            var imgname = "u" + num_img + ".png";
            // t.src = "../../../images/user_admin_page/" + imgname;
            var imgobj = document.getElementById( "u" + num_div + "_img" );
            var path = "../../../images/user_admin_page/" + imgname;
            if( imgobj )
            imgobj.src = path;
            //alert( path );
         }
      }
   }
}

