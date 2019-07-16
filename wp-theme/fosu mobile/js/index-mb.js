$(function(){

  /*======= 功能函数定义 =======*/

  /**
   * [tab切换]
   * @param  {[Object]} options [对象包含以下]
   *  $tabX: tab的X元素集合
      $tabY: tab的Y元素集合
      event: 触发切换的事件类型，默认'mouseover',
      xAtName: 当前X激活的类名，默认'active',
      yAtName: 当前Y激活的类名，默认'active-box',
      autoPlay: 自动轮播切换栏目，默认false
      timeout: 自动轮播切换间隔，默认5000ms
      hasMore: 是否支持MORE切换，默认false
      moreSelec: MORE的选择字符串，默认'.column-more'
      moreList: MORE的链接集合，默认空
   */
  function tab(options){
    var opts = $.extend({}, tab.DEFAULTS, options);
    if(opts.hasMore){ // 是否支持MORE的HREF值切换
      var oMore = $(opts.moreSelec);
    }
    opts.$tabX.each(function(i){
      $(this).on(opts.event, function(){
        setActive(i);
      })
    });
    
    if(opts.autoPlay){  // 自动轮播时
      var len = opts.$tabX.length;
      var time;
      if(len>1)
      {
        var _i = 0;
        function autoloop(){
          _i = ++_i<len ? _i : 0;
          setActive(_i);
        }
        time = setInterval(autoloop, opts.timeout);
        opts.$tabY.each(function(i){
          $(this).on('mouseover', function(){
            clearInterval(time);
          }).on('mouseout', function(){
            time = setInterval(autoloop, opts.timeout);
          })
        });
      }
    }

    function setActive(i){
      opts.$tabX.removeClass(opts.xAtName).eq(i).addClass(opts.xAtName);
      opts.$tabY.removeClass(opts.yAtName).eq(i).addClass(opts.yAtName);
      
      oMore && oMore.attr('href', opts.moreList[i]);
      
    }
  }
  tab.DEFAULTS = {
    $tabX: '',
    $tabY: '',
    event: 'mouseover',
    xAtName: 'active',
    yAtName: 'active-box',
    autoPlay: false,
    timeout: 4000,
    hasMore:false,
    moreSelec:'.column-more',
    moreList:[]
  };

  /*======= 基本使用 =======*/

  /*
    首页幻灯片
   */
  $bigSlider = $(".big-slider");
  $bigSlider.owlCarousel({
    items:1,
    nav: true,
    navText:['',''],
    loop: true,
    autoplay: true,
    autoplayTimeout: 5000,
    autoplayHoverPause: true,
    smartSpeed:1000,
    lazyLoad: true
  });

  $bigSlider.on('changed.owl.carousel', function(e) {
    // 幻灯片切换后的..
    $cur_item = e.page.index;
    $('.slider-box .banner li').removeClass('active').eq($cur_item).addClass('active');
  });

  /*
    新闻头条幻灯片
   */
  $(".min-slider").owlCarousel({
    items:1,
    loop: true,
    // autoplay: true,
    // autoplayTimeout: 3800,
    // autoplayHoverPause: true,
    lazyLoad: true
  });

  /*
    栏目Tab切换
   */
  // console.log(window.base_url);
  tab({
    $tabX: $('.tab-first-title>h3'),
    $tabY: $('.tab-first-content>ul'),
    autoPlay: true,
    timeout: 4000,
    hasMore: true,
    moreSelec:'.t-m-first',
    moreList:[window.base_url+'/school-news', window.base_url+'/xueyuan-news', window.base_url+'/video-news']
  });


  tab({
    $tabX: $('.tab-second-title>h3'),
    $tabY: $('.tab-second-content>ul'),
    autoPlay: true,
    timeout: 4000,
    hasMore: true,
    moreSelec:'.t-m-second',
      moreList:[window.base_url+'/news-publication', 'http://web.fosu.edu.cn/gzc', window.base_url+'/academic-forecast']
  });

 
  /*
    在F12控制台打印招人信息
   */
  try {
      window.console && window.console.log &&
       (console.log("一张网页，要经历怎样的过程，才能抵达用户面前？\n一位新人，要经历怎样的成长，才能站在技术之巅？\n探寻这里的秘密；\n体验这里的挑战；\n成为这里的主人；\n加入澜达网络，加入我们，你，可以影响世界。\n"),console.log("请将简历发送至 %c lambdass@163.com（ 邮件标题请以“姓名-应聘XX职位-来自浏览器console”命名）", "color:red"), console.log("公司介绍：http://www.lambdass.com/"))
  } catch(e) {}

})