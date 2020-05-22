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
      } 
      // else {
      //   // 將下一步改爲『下一題』
      //   $('#nextBtn').html('下一題');
      // }
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
        $('#cradeitsearchmine_myModal').modal('hide');
        
        var mm = document.getElementById("mm");
        while (mm.firstChild) {
         mm.removeChild(mm.lastChild);
          }
        // 送出表單
        $.ajax({
            url: '/pikachuMVC/cards/cradeitsearch_minecredit',                        // url位置
            type: 'post',                   // post/get
            data: { opt1: $('#opt1').val() ,
              opt2: $('#opt2').val() ,
              opt3: $('#opt3').val() ,
              sal: $("input[name='sal']:checked").val()
            },       // 輸入的資料
            dataType: "json",
//            error:function (xhr, ajaxOptions, thrownError){      // 錯誤後執行的函數
//                $("body").append(xhr.status);
//                $("body").append(xhr.responseText );
//
//               alert(thrownError);
//              } ,         
            success: function (reponse) {                    // 成功後要執行的函數
             let content="";
             
             let cb = Object.values(reponse);
             
             console.log(cb);
             
             for(let i=0;i<cb.length;i++){
              
           content +=' <div class="box">'+
               '<svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%">'+
                     '<line class="top" x1="0" y1="0" x2="1300" y2="0"/> '  + 
                     '<line class="left" x1="0" y1="400" x2="0" y2="-1300"/>' +
                     '<line class="bottom" x1="0" y1="160" x2="1300" y2="160"/>' +
                     '<line class="right" x1="1106" y1="0" x2="1106" y2="160"/>' +
                     '</svg>' +
                     '<div class="onecard"  name="'+cb[i].bank+'">' +
                     '<span id="">' +cb[i].c_name +  '</span>' + 
                     '<div class="row">'+
                     '<div class="col-2 creditimg">' + 
                     '<img src="/pikachuMVC/cards/RetrieveCardImg?id='+cb[i].c_id+ '"width="160px" height="110px">'+               
                     '</div>'+
                     '<div class="col credittext">' + 
                     '<div class="col-4 creditinner">' +   
                     '<div><span >'+cb[i].annlfee+'</span></div>'+
                     '<div>年費</div>' + 
                     '</div>'+
                     '<div class="col-4 creditinner">'+
                     '<div><span>'+cb[i].fcb+'%</span></div>'+
                     '<div>國外消費現金回饋</div>'+ 
                     '<div></div>'+
                     '</div>'+
                     '<div class="col-4 creditinner">'+
                     '<div><span >'+cb[i].dcb+'%</span></div>'+
                     '<div>國內消費現金回饋</div>'+
                     '<div></div>'+
                     '</div>'+
                     '</div>'+
                     '<div class="col-2 creditbtn"><a href="/pikachuMVC/cards/cradeitsearch_produce?id='+cb[i].c_id+'"class="btn btn-primary" id=>詳細資訊</a></div>'+
                     '</div>'+
                     '</div>'+
                     '</div>' ;            
              }
             
             mm.innerHTML = content;
             }
        }); 
      }
    }

    function btnEventHandler() {

      
  
      $('#nextBtn').on('click', function () {


        birthday=  document.getElementById('bday').value;
        let d =new Date();
        let bdtime = new Date(birthday);
        //算出年齡     現在年             出生年            (如果現在月份小於出生月份       或     同一個月，現在 日期 小於出生日) 若為真再-1，若否則-0  
        let age = d.getFullYear()-bdtime.getFullYear()-((d.getMonth()<bdtime.getMonth()|| d.getMonth()==bdtime.getMonth() && d.getDate()<bdtime.getDate())?1:0);
          
          if(age<20){
            alert("必需滿20歲才能申請信用卡，請輸入合法年齡 或 離開問卷")
            return(false);
          }
 
        currentStepIdx++;
        switchTo(currentStepIdx);
        // alert(currentStepIdx);
      });

      //  點擊上一個按鈕
      $('#prevBtn').on('click', function () {

        birthday=  document.getElementById('bday').value;
        let d =new Date();
        let bdtime = new Date(birthday);
  
        let age = d.getFullYear()-bdtime.getFullYear()-((d.getMonth()<bdtime.getMonth()|| d.getMonth()==bdtime.getMonth() && d.getDate()<bdtime.getDate())?1:0);
          
          if(age<20){
            alert("必需滿20歲才能申請信用卡，請重新輸入生日 或 離開問卷")
            return(false);
          }
  
        currentStepIdx--;
        switchTo(currentStepIdx);
        // alert(currentStepIdx);
      });
    }
    
    // --------------------------------------------------------
    // 執行區
    // --------------------------------------------------------
    // 當點擊按鈕時執行 ...
    var startbtn=document.getElementById('cradeitsearchmine_btn');
    startbtn.addEventListener("click",function(){
     currentStepIdx = 1;
     switchTo(currentStepIdx);
      $('#cradeitsearchmine_myModal').modal('show');
    },false)

    
    var birthday=  document.getElementById('bday');
    birthday.setAttribute("value","1980-01-01"); 

    btnEventHandler(); 
    
    // 預設是第一步，所以先隱藏上一步的按鈕
    $('#prevBtn').css({ display: 'none' });



    var seop = document.getElementsByClassName('se'); 
    for(var i=0;i<seop.length;i++ ){
        seop[i].addEventListener('click',changelist);
        }
    
    function changelist(){

      let checkarray = [];
      for(j=0;j<seop.length;j++){
          checkarray.push(seop[j].value);
      }
      
      let optag = document.getElementsByName('option');
         
      for(x=0;x<optag.length;x++){
      
        if(checkarray.indexOf(optag[x].value) != -1){
                  optag[x].style.display = 'none';
        }else{
                  optag[x].style.display = 'block';
              }
      }
    }