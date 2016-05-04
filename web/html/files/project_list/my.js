function project_list()
{
   window.onload = function()
   {
      // admin_page listen
      var return_user_admin_page = document.getElementById( "u1" );
      return_user_admin_page.onmouseover = function( e )
      {
         e = e || window.event;
         var t = e.target || e.srcElement;
         t.style.cursor = 'pointer';
      }
      return_user_admin_page.onclick = function( e )
      {
         // alert( "clk" );
         window.location.href = "../../../admin_page.html";
         //window.history.back();
         return;
      }
      
      //add button
      var addBtn = document.getElementById( "addpro" );
      addBtn.onmouseover = function( e )
      {
         e = e || window.event;
         var t = e.target || e.srcElement;
         t.style.cursor = 'pointer';
      }
      addBtn.onclick = function( e )
      {
         // alert( "clk" );
         window.location.href = "../../../project_add.php";
         //window.history.back();
         return;
      }
   }
}
