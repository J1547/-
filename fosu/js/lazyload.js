
//lazyload
(function ($){
    $(document).ready(function(){

        var original='data-original';//原地址名称
        var imgs=$('img['+original+'].lazy');//获取所有有data-original属性的img图片
        var distance=20;//距离浏览器底部多少px加载

        function load(){//加载函数
            if(imgs.length>0){//若还有元素
                var wheight=$(window).height();//可视区高度
                var stop=$(document).scrollTop();//滚动条高度
                var buttop=wheight+stop;//当前底部高度

                imgs.each(function(){//遍历所有图片
                    var etop=$(this).offset().top;//元素距离顶部高度
                    var ebtop=etop-buttop;//元素距离底部高度

                    if(ebtop<=distance){//满足加载条件
                        $(this).attr('src',$(this).attr(original));//设置地址
                        $(this).removeAttr(original);//移除属性
                    }
                });

                imgs=imgs.filter('img['+original+']');//移除已加载的对象
            }
        }

        load();

        $(window).scroll(function(){//窗口滚动事件
            load();
        });
    });
})(jQuery);