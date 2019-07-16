<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <meta name="renderer" content="webkit" />
    <meta name="force-rendering" content="webkit" />
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <!-- <meta name="viewport" content="width=device-width,initial-scale=1"> -->
    <meta name="keywords" content="佛山科学技术学院,佛山大学,lambda工作室,凌达工作室">
    <meta name="description" content="佛山科学技术学院，原佛山大学，国家硕士学位授予单位，全日制本科大学，坐落于国家历史文化名城——广东省佛山市。已发展成为一所拥有理学、经济学、法学、教育学、文学、工学、农学、医学、管理学、艺术学等学科门类，...">
    <title>
<?php if ( is_home() ) {   
    bloginfo('name');   
    } elseif ( is_category() ) {   
    single_cat_title(); echo " - "; bloginfo('name');   
    } elseif (is_single() || is_page() ) {   
    single_post_title(); echo "佛山科学技术学院 | 欢迎您！";   
    } elseif (is_search() ) {   
    echo "搜索结果"; echo " - "; bloginfo('name');   
    } elseif (is_404() ) {   
    echo '页面未找到!';   
    } else {   
    wp_title('',true);   
    } 
?>
</title>
    <link rel="shortcut icon" href="http://web.fosu.edu.cn/wp-content/themes/fosu2019/images/favicon.ico" type="image/x-icon" />
    <link href="<?php bloginfo('template_directory'); ?>/css/common-pc.css" type="text/css" rel="stylesheet" />
    <!-- 主页 -->
    <link rel="stylesheet" href="<?php bloginfo('template_directory'); ?>/css/index-pc.css">
    <link rel="stylesheet" href="<?php bloginfo('template_directory'); ?>/css/owl.carousel.min.css">
    <!-- 单独样式 -->
    <!-- 空 不填-->
    <script src="<?php bloginfo('template_directory'); ?>/js/jquery.min.js"></script>
    <!--[if lt IE 9]>
      <script src="<?php bloginfo('template_directory'); ?>/js/respond.min.js"></script>
    <![endif]-->
    <script>var _hmt = _hmt || []; (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?737248e8a6d0ec2e24bb8cfc179a8bc4";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
      })();</script>
  </head>
  <?php wp_head() ?>