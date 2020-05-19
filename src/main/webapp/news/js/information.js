  //輪播圖廣告
  $( document ).ready(function( $ ) {
    $( '#informationslider' ).sliderPro({
    width: 650,
    height:320,
    imageScaleMode:"exact",
    orientation: 'vertical',//幻燈片方向 垂直
    loop: true,//是否無限循環
    autoplayDelay:2300,//播放間隔時間
    arrows: false,//是否插件幻燈片的箭頭導航按鈕。
    buttons: true,//顯示是否有按鈕
    thumbnailsPosition: 'right',//默認值：bottom。可選值：top、bottom、right和left。設置幻燈片縮略圖的位置。
    thumbnailPointer: true,
    thumbnailWidth: 500,//默認值：100。設置幻燈片縮略圖的寬度。
    thumbnailHeight:100,//默認值：80。設置幻燈片縮略圖的高度。
    });
});