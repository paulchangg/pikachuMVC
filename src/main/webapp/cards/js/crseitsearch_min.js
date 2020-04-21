 // --------------------------------------------------------
    // 變數定義區
    // --------------------------------------------------------
    // 起始步驟
    var beginStepIdx = 1;
    // 結束步驟
    var endStepIdx = 6
    // 目前顯示步驟 1
    var currentStepIdx = 1;

    // --------------------------------------------------------
    // 函數定義區
    // --------------------------------------------------------
    // 處理按鈕的顯示或隱藏邏輯
    function handleForBtnVisibility(stepIdx) {
      //  如果目前的步驟剛好是起始步驟，
      if (stepIdx === beginStepIdx) {
        // 隱藏上一步按鈕
        $('#prevBtn').css({ display: 'none' });
        // 將下一步改爲開始
        $('#nextBtn').html('開始');
        // 目前的步驟是第一步就不需要在繼續往下執行囉，所以 return 結束這一回合
        return
      } else {
        //  如果目前的步驟不是起始步驟，顯示上一步按鈕
        $('#prevBtn').css({ display: 'inline-block' });
        // 將下一步改爲『下一題』
        $('#nextBtn').html('下一題');
      }

      // 如果目前的步驟剛好是結束步驟
      if (stepIdx === endStepIdx) {
        // 將下一步改爲『完成』
        $('#nextBtn').html('完成');
      } else {
        // 將下一步改爲『下一題』
        $('#nextBtn').html('下一題');
      }
    }

    function switchTo(stepIdx) {
      // 處理按鈕的顯示或隱藏邏輯
      handleForBtnVisibility(stepIdx);

      // 先將所有的步驟隱藏
      $('.step').removeClass('active');

      // 在把目前要顯示的那個步驟 show 出來
      $('.step' + stepIdx).addClass('active');

      //  當目前步驟爲最後步驟的下一步，就送出表單囉
      if (stepIdx === endStepIdx + 1) {
        $('#myModal').modal('hide');
        // 送出表單
        $('#my-form').submit()

      }
    }

    function btnEventHandler() {
      //  點擊下一個按鈕
      $('#nextBtn').on('click', function () {
        currentStepIdx++;
        switchTo(currentStepIdx);
      });

      //  點擊上一個按鈕
      $('#prevBtn').on('click', function () {
        // 步驟 - 1
        currentStepIdx--;
        switchTo(currentStepIdx);
      });
    }

    // --------------------------------------------------------
    // 執行區
    // --------------------------------------------------------
    // 當點擊按鈕時執行 ...
    var startbtn=document.getElementById('cradeitsearchmine_btn');
    startbtn.addEventListener("click",function(){
      btnEventHandler();
      $('#cradeitsearchmine_myModal').modal('show'); 
    },false) 

    // 預設是第一步，所以先隱藏上一步的按鈕
    $('#prevBtn').css({ display: 'none' });