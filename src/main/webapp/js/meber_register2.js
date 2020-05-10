// 導覽列功能設定
class StickyNavigation {
  constructor() {
    this.currentId = null;
    this.currentTab = null;
    this.tabContainerHeight = 70;
    let self = this;
    $(".et-hero-tab").click(function () {
      self.onTabClick(event, $(this));
    });
    $(window).scroll(() => {
      this.onScroll();
    });
    // $(window).resize(() => {
    //   this.onResize();
    // });
  }

  onScroll() {
    this.checkTabContainerPosition();
    // this.findCurrentTabSelector();
  }

  // 固定延展功能
  checkTabContainerPosition() {
    let offset =
      $(".et-hero-tabs").offset().top +
      $(".et-hero-tabs").height() -
      this.tabContainerHeight;
    if ($(window).scrollTop() > offset) {
      $(".et-hero-tabs-container").addClass("et-hero-tabs-container--top");
    } else {
      $(".et-hero-tabs-container").removeClass("et-hero-tabs-container--top");
    }
  }
}

window.addEventListener("load", doFirst);

function doFirst() {
  new StickyNavigation();

  // 置頂鈕移動時間設定
  $(function () {
    // 當點擊這個按鈕，自動捲動到網頁最上方，0.333秒完成捲動的動作
    $("#backtop").click(function () {
      $("html,body").animate({ scrollTop: 0 }, 333);
    });

    $(window)
      .scroll(function () {
        if ($(this).scrollTop() > 50) {
          $("#backtop").fadeIn(222);
        } else {
          $("#backtop").stop().fadeOut(222);
        }
      })
      .scroll();
  });
}




