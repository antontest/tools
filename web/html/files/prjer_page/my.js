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

function prjer_page()
{
   window.onload = function()
   {
      var searchBnt = document.getElementById( "u52" );
      searchBnt.onmouseover = function( e )
      {
         e = e || window.event;
         var t = e.target || e.srcElement;
         t.style.cursor = 'pointer';
      }
      searchBnt.onclick = function( e )
      {
         var project_name = document.getElementById( "u7_input" ).value;
         var cate_name = document.getElementById( "u30_input" ).value;
         var model_name = document.getElementById( "u31_input" ).value;
         var brand_name = document.getElementById( "u32_input" ).value;
         var plan_code = document.getElementById( "u51_input" ).value;
         var prd_count_from = document.getElementById( "u37_input" ).value;
         var prd_count_to = document.getElementById( "u40_input" ).value;
         var budget_price_from = document.getElementById( "u45_input" ).value;
         var budget_price_to = document.getElementById( "u48_input" ).value;
         var plan_date_from = document.getElementById( "u16_input" ).value;
         var plan_date_to = document.getElementById( "u19_input" ).value;
         var approve_date_from = document.getElementById( "u22_input" ).value;
         var approve_date_to = document.getElementById( "u25_input" ).value;
         setCookie("project_name",encodeURI(project_name));
         setCookie("cate_name",encodeURI(cate_name));
         setCookie("model_name",encodeURI(model_name));
         setCookie("brand_name",encodeURI(brand_name));
         setCookie("plan_code",encodeURI(plan_code));
         setCookie("prd_count_from",encodeURI(prd_count_from));
         setCookie("prd_count_to",encodeURI(prd_count_to));
         setCookie("budget_price_from",encodeURI(budget_price_from));
         setCookie("budget_price_to",encodeURI(budget_price_to));
         setCookie("plan_date_from",encodeURI(plan_date_from));
         setCookie("plan_date_to",encodeURI(plan_date_to));
         setCookie("approve_date_from",encodeURI(approve_date_from));
         setCookie("approve_date_to",encodeURI(approve_date_to));
         location.reload(true);   
      }
   }
}
