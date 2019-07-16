</div>
    <div class="mb-footer">
      <div class="mb-ft-cont">
        <div class="ft-logo">
          <img src="<?php bloginfo('template_directory'); ?>/picture/logo.jpg" alt="LOGO"></div>
        <p class="phone">总机：（0757）82272751</p>
        <ul class="addr">
          <li>广东省佛山市南海区狮山镇广云路33号</li>
          <li>广东省佛山市禅城区江湾一路18号</li></ul>
      </div>
      <div class="website-id">粤ICP备05008830号-1 .
        <span class="r">粤公网安备44060402000117号</span></div>
    </div>
    </div>
    <script src="<?php bloginfo('template_directory'); ?>/js/owl.carousel.min.js"></script>
    <script>var base_url = "http://web.fosu.edu.cn"; // useful for js
      </script>
    <!-- <script src="js/index-mob.js"></script> -->
    <script src="<?php bloginfo('template_directory'); ?>/js/jquery.min.js"></script>
    <script src="<?php bloginfo('template_directory'); ?>/js/owl.carousel.min.js"></script>
    <script>var base_url = "http://web.fosu.edu.cn"; // useful for js
      </script>
    <script src="<?php bloginfo('template_directory'); ?>/js/index-mb.js"></script>
    <script type="text/javascript">$(document).ready(function() {

        // $('.Nav .sub-menu').width($('.Nav>ul>li').width());
        // $('.bg').height($('.sub-menu').height());
        $('.single-content img,.art-content img').addClass('am-img-responsive');
        $('.bg').hide();
        $('.sub-menu').hide("fast");
        $('.Nav').hover(function() {
          $(".bg").slideDown("fast");
          $(".Nav .sub-menu").slideDown("fast");
        },
        function() {
          $(".bg").hide();
          $(".Nav .sub-menu").hide();
        });
        $('.Nav ul li').hover(function() {
          $(this).find('ul').addClass('nac')
        },
        function() {
          $(this).find('ul').removeClass('nac')
        });
        $('.bak').click(function() {
          //$(".MOB-Nav ul li").show();
          // $(".MOB-Nav>ul").show();
          $(".MOB-Nav").animate({
            'right': 0
          },
          300);
          $('.close').fadeIn("slow");
          $('.fuzzy').fadeIn("fast");
          $('.boot').fadeOut("fast");
          $('#gotop').fadeOut("fast");
        });
        $('.fuzzy').click(function() {
          $(".MOB-Nav").animate({
            right: '-100%'
          },
          300);
          $('.fuzzy').fadeOut("fast");
          $('.boot').fadeIn("fast");
          $('.close').fadeOut("slow");
        });

        $('.menu>li').click(function() {
          $(this).siblings('li').find('.sub-menu').slideUp("fast");
          $(this).find('.sub-menu').slideToggle("fast");
        });
        $(".MOB-Nav>ul li").show("fast");
      });</script>
  </body>
  </html>
  <?php wp_footer() ?>