<?php
    define('PO_ROOT', substr(dirname(__FILE__), 0));
    include PO_ROOT.'./php/SQLHelper.php'; 
    
    $per = getSessionArg("role");
    #showInfo("per=" . $per);
    if($per!='0')
    {
        echo "<script>alert('权限不够');</script>";
        returnLastHtml();
        #echo  "<META  HTTP-EQUIV=\"Refresh\" CONTENT=\"0; URL=adduser2.html\">";
        return;
    }
    
    setSessionArg("role",$per);
    setcookie("proaddName",urlencode("采购合同数据上传"));
?>

<!DOCTYPE html>
<html>
  <head>
    <title>po_maintain</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <link href="resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet"/>
    <link href="resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
    <link href="data/styles.css" type="text/css" rel="stylesheet"/>
    <link href="files/po_maintain/styles.css" type="text/css" rel="stylesheet"/>
    <!--<script src="files/po_maintain/data.js"></script>-->
    <script src="files/po_maintain/my.js"></script>
    <script type="text/javascript">
        po_maintain();
    </script>
  </head>
  <body>
    <div id="base" class="">

      <!-- InitexcelShape (Shape) -->
      <div id="u0" class="ax_shape" data-label="InitexcelShape">
        <!--<img id="u0_img" class="img " src="images/po_maintain/initexcelshape_u0.png"/>-->
        <!-- Unnamed () -->
        <div id="u1" class="text">
          <p><span>&nbsp;</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u2" class="ax_shape">
        <img id="u2_img" class="img " src="images/po_maintain/u2.png"/>
        <!-- Unnamed () -->
        <div id="u3" class="text">
          <p><span>&nbsp;</span></p>
        </div>
      </div>

      <!-- Unnamed (Horizontal Line) -->
      <div id="u4" class="ax_horizontal_line">
        <img id="u4_start" class="img " src="resources/images/transparent.gif" alt="u4_start"/>
        <img id="u4_end" class="img " src="resources/images/transparent.gif" alt="u4_end"/>
        <img id="u4_line" class="img " src="images/admin_page/u8_line.png" alt="u4_line"/>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u5" class="ax_paragraph">
        <img id="u5_img" class="img " src="resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u6" class="text">
          <p><span>系统管理</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u7" class="ax_paragraph">
        <img id="u7_img" class="img " src="resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u8" class="text">
          <p><span>&gt;</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u9" class="ax_paragraph">
        <img id="u9_img" class="img " src="resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u10" class="text">
          <p><span>采购合同数据上传</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u11" class="ax_paragraph">
        <img id="u11_img" class="img " src="images/po_maintain/u11.png"/>
        <!-- Unnamed () -->
        <div id="u12" class="text">
          <p><span>采购合同汇总数据上传 </span><span>Excel</span></p>
        </div>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u13" class="ax_paragraph">
        <img id="u13_img" class="img " src="resources/images/transparent.gif"/>
        <!-- Unnamed () -->
        <div id="u14" class="text">
          <p><span>Excel文件</span></p>
        </div>
      </div>

      <form action="upload.php" method="post" enctype="multipart/form-data">

      <!-- Unnamed (Text Field) -->
      <div id="u15" class="ax_text_field">
        <input id="u15_input" type="file" name="file"/>
      </div>

      <!-- Unnamed (Shape) -->
      <div id="u16" class="ax_shape">
        <img id="u16_img" class="img " src="images/po_maintain/u16.png"/>
        <!-- Unnamed () -->
        <div id="u17" class="text" onclick="file.click()" >
          <p><span>上传</span></p>
          <input type="submit" name="submit" id="file" value="上传" style="border:0;border-style:none;display: none;"/>
        </div>
      </div>
      </form>
      
      <?php
        FilePreview();
        #setcookie("proaddName",urlencode("采购合同数据上传"));
      ?>
      
      
    </div>
  </body>
</html>
