$(document).ready(function() {
    //手機板選單功能，數字為手機板選單要出現的寬度
    mobileMenuInit(1000);

    //上方主選單.menu的功能
    menuInit();

    //啟動選單上購物車下拉列表
    gocartBtnInit();

    //按鈕切換class功能
    toggleBtnInit();

    //側選單開合
    sideNavInit();

    //語系下拉 ( *** 沒有下拉請註解這行 *** )
    languageMenuInit('.site-header .language');

    //TOP按鈕的功能
    gotopBtnInit();

    //單選/多選按鈕點了會加上ckecked的class功能
    labelCkeckedInit();

    //驗證碼換圖
    imgcodeInit();
    
    //登入的燈箱
    $('.fancybox-login').fancybox({
        margin: 5,
        padding: 0,
        width: '100%',
        maxWidth: 890,
        type: 'iframe',
        helpers: {
            overlay : {
                css : {
                    'background' : 'rgba(0,0,0,0.9)'
                }
            }
        },
    });
});
// $(window).load(function() {
//     $(window).on('scroll', function() {
//         //捲動超過banner時，header會縮小
//         if ($(this).scrollTop() > 160){
//             $('body').addClass('header-change');
//         } else {
//             $('body').removeClass('header-change');
//         }
//     }).scroll();
// });