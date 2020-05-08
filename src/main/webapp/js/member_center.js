/*第一階段選項內容*/
//   var colleges=['匯豐銀行','渣打銀行','星展銀行','王道銀行','新光銀行','中國信託','國泰世華','玉山銀行','台新銀行','花旗銀行',
//   '聯邦銀行','美國通運','遠東商銀','台灣企銀','彰化銀行','永豐銀行','華泰銀行','華南銀行','台北富邦','第一銀行',
//   '高雄銀行','安泰銀行','合作金庫','兆豐銀行','凱基銀行','台灣樂天','台灣銀行','台中銀行','日盛銀行','元大銀行',
//   '土地銀行','三信銀行','上海商銀','銀信銀行'];

//    var collegeSelect=document.getElementById("college-list"); //第一層選單的id
//    var inner="";
//    for(var i=0;i<colleges.length;i++)
//    {
//    inner=inner+'<option value='+i+'>'+colleges[i]+'</option>';
//    }
// collegeSelect.innerHTML=inner;
//innerHTML每次載入會清空前一個內容所以前面要設定空字串

// var sectors=new Array();
// sectors[0]=['現金回饋御璽卡'];
// sectors[1]=['現金回饋御璽卡','昇利卡(現金回饋)','優先理財無限卡','TheShoppingCard分期卡','昇利卡(紅利回饋)'];
// sectors[2]=['炫晶御璽卡 ',' everyday鈦金卡 ',' 豐盛無限卡 ',' 飛行鈦金卡 ',' 飛行世界卡'];
// sectors[3]=['cama caf?聯名卡 ',' FunNow聯名卡 ',' 公益認同卡 ','簽帳金融卡 '];
// sectors[4]=['寰宇現金回饋卡 ',' 新光三越聯名卡 ',' 魔法少女一卡通鈦金卡 ',' 悠遊聯名卡 ',' 日本航空聯名卡 ',' 新光加油卡 ',' 義大世界聯名卡','分期7卡 ','美麗華百樂卡'];
// sectors[5]=['LINEPay卡雙幣商務卡','中信商旅鈦金卡','現金回饋鈦金卡','TAIPEI101夜光聯名卡','GlobalMall聯名卡','寰遊美國運通卡','中信兄弟聯名卡','Yahoo聯名卡','秀泰聯名卡','中華電信聯名白金卡','蘭城新月廣場聯名卡','南紡購物中心聯名卡','享想生活卡',
//             '中油VIP聯名卡','MUJI無印良品聯名卡','酷玩卡','勤美天地聯名晶緻卡','漢神百貨聯名卡','紅利御璽卡','大葉高島屋百貨聯名卡','大中華攜手飛聯名卡','ANA晶緻聯名卡','鼎極卡','ANA極緻聯名卡'];
// sectors[6]=['現金回饋御璽卡','享購鈦金卡','國泰人壽聯名卡','蝦皮購物聯名卡','KOKO COMBO icash聯名卡','KOKO icash聯名卡','台塑聯名卡','COSTCO聯名卡','長榮聯名御璽卡','亞洲萬里通聯名里享卡','亞洲萬里通聯名白金卡','遠東SOGO悠遊聯名卡','長榮聯名極致御璽卡','亞洲萬里通聯名鈦商卡','eTag 聯名卡',
//             '雙幣卡','鈦金商務卡','尊榮御璽卡','長榮聯名無限卡','亞洲萬里通聯名世界卡','長榮聯名極致無限卡','世界卡','白金卡'];
// sectors[7]=['玉山Pi拍兔Debit卡',' 雙幣信用卡','U Bear信用卡','漢神巨蛋聯名卡','玉山世界卡','幸運鈦金卡','幸運PLUS鈦金卡','家樂福悠遊聯名卡','家樂福icash聯名卡','eTag悠遊聯名卡','iCash聯名卡','商務御璽卡','佐登妮絲聯名卡','悠遊聯名卡','山隆優油卡','中友百貨悠遊聯名卡','全國電子聯名卡','寶雅悠遊聯名卡','新東陽悠遊聯名卡',
//             'NISSAN悠遊聯名卡','賀寶芙悠遊聯名卡','麗寶悠遊聯名卡','Pi 拍錢包信用卡','南山悠遊聯名卡','愛心卡','ATT4Fun 悠遊聯名卡','耐斯廣場NP聯名卡','統領百貨悠遊聯名卡','華歌爾悠遊聯名卡','玉山Only卡','弘安藥粧聯名卡','臺北南山廣場聯名卡','大江聯名卡','蘭城新月聯名卡','啄木鳥悠遊聯名卡', ];
// sectors[8]=['FlyGo卡','商務卡','台新街口聯名卡','@GoGo iCash御璽卡','遠傳friDay聯名卡','亞洲無限卡','環球無限卡','昇恆昌聯名卡','燦坤生活聯名卡','三商美邦人壽聯名卡','太陽卡','玫瑰卡','ETC聯名卡','賓士smart聯名卡','全家Fish悠遊聯名卡','新光三越聯名卡',
//             '大潤發/大買家聯名卡','國泰航空鈦金卡','PayEasy聯名卡','幸福加值卡','國泰航空翱翔鈦金卡','國泰航空世界卡'];
// sectors[9]=['現金回饋PLUS卡','PChome Prime聯名卡','紅利悠遊卡','新世代花旗饗樂生活悠遊卡','寰旅世界悠遊卡','Citi Prestige'];
// sectors[10]=['賴點一卡通御璽卡','幸福御守御璽卡','理財型白金卡','樂活悠遊御璽卡','農金一卡通聯名卡','F1 加油卡','順發聯名卡','微風聯名卡','全國加油聯名卡',
//              'Tiger City悠遊白金卡','聯邦旅遊卡','紅利卡','泰航聯名卡','凱撒飯店聯名卡','美華泰聯名卡','大立無限卡'];
// sectors[11]=['國泰航空信用卡','簽帳金卡','新加坡航空天宇信用卡','長榮航空簽帳金卡','信用白金卡','長榮航空簽帳白金卡','簽帳卡','信用金卡','國泰航空尊尚信用卡'];
// sectors[12]=['快樂信用卡','Bankee信用卡','New Century MC卡','eTag 聯名卡','華信航空聯名卡',"C'estMoi我的卡"];
// sectors[13]=['故宮之友認同卡','北港朝天宮媽祖認同卡','悠遊聯名卡'];
// sectors[14]=['My樂現金回饋卡','商旅御璽卡','JCB悠遊晶緻卡','VISA一卡通御璽卡'];
// sectors[15]=['DAWHO現金回饋信用卡','現金回饋卡','雙幣卡','無限卡','夢行卡','Prestige美國運通卡','Me Card','鈦豐卡','VOGUE聯名卡','SPORT卡','美麗華卡',
//              '保倍卡','科士威聯名卡','MITSUI OUTLET PARK卡'];
// sectors[16]=['VISA旗艦卡'];
// sectors[17]=['享利樂活Combo卡','旅鑽商務御璽卡','超級現金回饋卡','LOVE晶緻悠遊聯名卡－酷愛黑卡','櫃買贏家生活卡','i網購生活卡','LOVE晶緻悠遊聯名卡－寵愛紅卡',
//              '美饌紅利卡','優活YOHO晶緻卡','Scottish House 聯名卡','大甲媽祖認同卡','OPENPOINT超級點數聯名卡-Hello Kitty款','The ONE 尊榮無限卡'];
// sectors[18]=['J卡','momo卡','IMPERIAL尊御世界卡','數位生活卡','鑽保卡','財神卡','台灣大哥大悠遊聯名卡','采盟聯名卡','DHC聯名卡','福華聯名卡',
//              '國賓大飯店聯名卡','麗嬰房聯名卡','富邦悍將悠遊聯名卡','廣三SOGO聯名卡','富利生活系列卡','台茂聯名卡','商務卡'];
// sectors[19]=['一卡通聯名卡','鈦金商旅卡','iLeo卡','Wonderful星璨卡','i-Fun愛玩樂卡','媚儷鈦金卡','由你分期卡','曼黛瑪璉聯名卡','大同寶寶聯名卡',
//              '資生堂SHISEIDO聯名卡','icash聯名卡','菁英御璽卡','尊榮白金卡','悠遊聯名卡','速邁樂聯名卡','Living Green綠活卡'];
// sectors[20]=['高雄going鈦金卡'];
// sectors[21]=['晶緻卡','鈦金卡','分期卡'];
// sectors[22]=['雙幣信用卡','JCB悠遊晶緻卡','利high卡','卡娜赫拉的小動物 icash 聯名卡','漢來美食聯名卡'];
// sectors[23]=['利多御璽商旅卡','Gogoro 聯名卡','Mega One 一卡通聯名卡','e秒刷鈦金卡','世界卡','幸福卡','中興保全聯名卡','悠遊聯名卡','統一7-ELEVEn獅聯名卡','原子小金剛卡','生活工場聯名卡','歐付寶悠遊聯名卡'];
// sectors[24]=['現金回饋鈦金卡','現金回饋御璽卡','魔fun悠遊御璽卡','中壽聯名卡','無限卡'];
// sectors[25]=['樂天信用卡'];
// sectors[26]=['鈦金商旅卡','金采白金卡'];
// sectors[27]=['JCB哆啦A夢晶緻卡'];
// sectors[28]=['無限卡','商務御璽卡','GOGO卡','ALL PASS卡'];
// sectors[29]=['鑽金卡','鑽金 icash 聯名卡','Wi-Ho!Online聯名卡','鑽金一卡通聯名卡','Hello Kitty鑽金聯名卡',
//              '富貴無限卡','iCash樂享晶緻卡','iPASS現賺御璽卡','分享黑啤卡','藝術白金卡','世界卡','愛PASS鈦金卡','分享卡',
//              '樂遊卡','新世代卡','Life卡','一番卡'];
// sectors[30]=['JCB一卡通聯名晶緻卡','白金商務卡','國際信用卡'];
// sectors[31]=['VISA白金卡'],
// sectors[32]=['簡單卡','小小兵Bello回饋卡','TeresaCard','小小兵BeeDo分期卡'];
// sectors[33]=['曜晶卡','一卡通聯名鈦金卡','享利白金卡'];

// var sectorSelect=document.getElementById("sector-list");//第二階段選單

// function changeBank(index){    //第一階段的選單
//    var Sinner=""; //空字串接因為innerHTML每次產生都會把之前的內容清除
//    for(var i=0;i<sectors[index].length;i++)
//    {
//      Sinner=Sinner+'<option value='+i+'>'+sectors[index][i]+'</option>'; //組字串
//    }
//        sectorSelect.innerHTML=Sinner;
//    }

// changeBank(document.getElementById("college-list").selectedIndex); //呼叫方法

/*增加區塊的方法*/
// var addBtn=document.getElementById('center_Button2');
// addBtn.addEventListener("click",addWay);

/*增加按鈕*/
// function addWay(){
//    var addDiv=document.getElementById('center_Box'); //父層級區塊
//    var oneDiv=document.createElement('div');//增加節點
//    oneDiv.setAttribute('class','addcredit');//增加class屬性,在css設定好寬度
//    oneDiv.innerHTML="<img src='花旗信用卡.png' class='addimg'><p>信用卡名稱"+sectorSelect.innerHTML+"</p><input type='button' value='刪除' id='center_del' onclick='delWay()'>"; //組成html字串

//    var divs=addDiv.getElementsByTagName("div")//取得父層級裡面所有為div標籤

//    if(divs.length<3)
//    {
//       addDiv.appendChild(oneDiv);    //把div放入父區塊中
//    }
//    else{
//       alert("已超過3張無法新增");
//    }
// }

/*刪除按鈕*/
// function delWay(e){
//    var addDiv=document.getElementById('center_Box'); //父層級區塊
//    var divs=addDiv.getElementsByTagName("div")//取得父層級裡面所有標籤為div
//     if(divs.length>0){
//        addDiv.removeChild(divs[0]);   //移除父區塊裡面的div
//       }
// }

/*load畫面方法*/
$(document).ready(function () {
  setTimeout(function () {
    $(".loadingone").fadeOut(500);
  }, 2000);

  let url = 'getMemberCards.do';
  let data;

  $.post(
    url,
    data,
    function (data, textStatus, jqXHR) {
      let center_Box = document.getElementById("center_Box");
      
      // 後端加完信用卡會回傳該會員目前所擁有的卡片map ， 利用foreach把卡片全部再寫入center-box
      for(let key in data){
        if(data.hasOwnProperty(key)){
          console.log(key + ':' + data[key]);
          let cardDiv = document.createElement("div");
          cardDiv.setAttribute("class", "addcredit");
          cardDiv.setAttribute("value", data[key]);
          cardDiv.setAttribute("name", data[key]);
          // cardDiv.innerHTML = `<img src='/pikachuMVC/cards/RetrieveCardImg?id=${key}' class='addimg'><p>${data[key]}</p><input type='button' value='刪除' id='center_del' onclick='delWay()'>`;
          let cImg = document.createElement('img');
            cImg.src = `/pikachuMVC/cards/RetrieveCardImg?id=${key}`;
            cImg.class = 'addimg';

            let cName = document.createElement('p');
            cName.innerHTML = `${data[key]}`;
            
            let delBtn = document.createElement('button');
            delBtn.innerHTML = '刪除';
            delBtn.id = 'center_del';
            delBtn.addEventListener('click',delWay);

            cardDiv.appendChild(cImg);
            cardDiv.appendChild(cName);
            cardDiv.appendChild(delBtn);

          center_Box.appendChild(cardDiv); 
        }
      }
    },
    "json"
  );

});





let selectBank = document.getElementById("selectBank");

function getCard() {
	
	//取得會員增加的卡片所有div 
	let cdiv = document.getElementsByClassName('addcredit');
	//把div的卡名放入比較陣列
	let checkarray = [];
	console.log(cdiv.length);
	for(let x = 0; x < cdiv.length ; x++){	  
	    let	 y = cdiv[x].getAttribute("name");
		checkarray.push(y);	
	}
//	console.log(checkarray);
	
  let lastcard = document.getElementById("selectCard");
  while (lastcard.firstChild) {
    lastcard.removeChild(lastcard.lastChild);
  }
  var url = "getCardList.do";
  var data = {
    bank: $("#selectBank").val(),
  };

  $.post(
    url,
    data,
    function (data, textStatus, jqXHR) {
      let carddiv = document.getElementById("selectCard");
      for (let i = 0; i < data.length; i++) {
        let card = document.createElement("option");
        card.className = "card";
        card.value = data[i];
        card.label = data[i].substr(5);
        //如果跟卡名一樣就不加
        if(checkarray.indexOf(card.value)  != -1){
        	continue;
        }else{
        	carddiv.appendChild(card);	
        }
                
      }
    },
    "json"
  );

}

  
function addCard() {

  let cardDiv = document.getElementById("center_Box");

  //判斷卡片是否超過三張
  if(cardDiv.childNodes.length < 3){
    let se =document.getElementById('selectCard');
    let ops =document.getElementsByClassName('card');
    //取得目前所選的值
    let y = se.value;
    //點完加卡片 就讓它消失
      for(let x =0;x<ops.length;x++){
        
          if(ops[x].value === y){
             
              ops[x].style.display = 'none';
          }    
      }
    
      //殺掉center-box裡的所有卡片 
     while (cardDiv.firstChild) {
       cardDiv.removeChild(cardDiv.lastChild);
     }
  
     var url = "addCard.do";
     var data = {
        cardname: $("#selectCard").val(),
     };
     
    $.post(
      url,
      data,
      function (data, textStatus, jqXHR) {
        let center_Box = document.getElementById("center_Box");
        
        // 後端加完信用卡會回傳該會員目前所擁有的卡片map ， 利用foreach把卡片全部再寫入center-box
        for(let key in data){
          if(data.hasOwnProperty(key)){
            console.log(key + ':' + data[key]);
            var cardDiv = document.createElement("div");
            cardDiv.setAttribute("class", "col-4 addcredit");
            cardDiv.setAttribute("value", data[key]);
            cardDiv.setAttribute("name", data[key]);
            // cardDiv.innerHTML = `<img src='/pikachuMVC/cards/RetrieveCardImg?id=${key}' class='addimg'><p>${data[key]}</p><input type='button' value='刪除' id='center_del' onclick='delWay()'>`;
            
            let cImg = document.createElement('img');
            cImg.src = `/pikachuMVC/cards/RetrieveCardImg?id=${key}`;
            cImg.class = 'addimg';

            let cName = document.createElement('p');
            cName.innerHTML = `${data[key]}`;
            
            let delBtn = document.createElement('button');
            delBtn.innerHTML = '刪除';
            delBtn.id = 'center_del';
            delBtn.addEventListener('click',delWay);

            cardDiv.appendChild(cImg);
            cardDiv.appendChild(cName);
            cardDiv.appendChild(delBtn);


            var divs = center_Box.getElementsByTagName("div");
            if (divs.length < 3) {
              center_Box.appendChild(cardDiv);
            } else {
              alert("已超過3張無法新增");
            }
          }
        }
      },
      "json"
    );

  }else {
    alert("已超過3張無法新增");
  }


}

//刪除卡片
function delWay(e) {
  let center_Box = document.getElementById("center_Box");
  let preDelDiv = this.parentNode;

    let url = 'delMemberCard.do';
    let data = {
      cardname: preDelDiv.getAttribute('value'), 
    };
    // console.log('!!!!!!!!!!!!!!!!' + preDelDiv.getAttribute('value'));
    $.post(url,data,function(data, textStatus, jqXHR){
      if(data == true){
        preDelDiv.setAttribute("style","display:none");
        center_Box.removeChild(preDelDiv);
      }
    },"json");

}
