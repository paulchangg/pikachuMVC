window.addEventListener("load", doFirst);

function doFirst() {
  let url = "getPreFriends.do";
  let data;
  $.post(
    url,
    data,
    function (data, textStatus, jqXHR) {
      for (let i = 0; i < data.length; i++) {
        let preFriends = document.getElementById("preFriends");
        let pfriend = document.createElement("div");
        pfriend.id = data[i].m_id;

        let imgDiv = document.createElement("div");
        imgDiv.className = "col-12";
        imgDiv.style = "text-align: center; padding-top: 0px;";

        let mImg = document.createElement("img");
        // mImg.style.width = '100px';
        mImg.className = "memberid_img";
        mImg.src = `/pikachuMVC/init/getMemberImage?id=${data[i].m_id}`;
        mImg.width = 168;
        imgDiv.appendChild(mImg);
        pfriend.appendChild(imgDiv);

        let mName = document.createElement("p");
        mName.innerHTML = `${data[i].name}`;
        pfriend.appendChild(mName);

        let mGender = document.createElement("p");
        mGender.innerHTML = `${data[i].gender}`;
        pfriend.appendChild(mGender);

        let income = `${data[i].income}`;
        if (income !== "undefined") {
          let mIncome = document.createElement("p");
          mIncome.innerHTML = `年收： ${income}`;
          pfriend.appendChild(mIncome);
        }

        let city = `${data[i].city}`;
        if (city !== "undefined") {
          let mCity = document.createElement("p");
          mCity.innerHTML = `居住地： ${city}`;
          pfriend.appendChild(mCity);
        }

        let education = `${data[i].education}`;
        if (education !== "undefined") {
          let mEducation = document.createElement("p");
          mEducation.innerHTML = `學歷： ${education}`;
          pfriend.appendChild(mEducation);
        }

        let btnDiv = document.createElement("div");
        btnDiv.className = "position_a";

        let noBtn = document.createElement("button");
        noBtn.id = "fork";
        noBtn.className = "likeornot";
        noBtn.style =
          "background-image: url(../articleForum/images/board/X.jpg);";
        noBtn.addEventListener("click", notLike);
        btnDiv.appendChild(noBtn);

        let yesBtn = document.createElement("button");
        yesBtn.id = "circle";
        yesBtn.className = "likeornot";
        yesBtn.style =
          "background-image: url(../articleForum/images/board/O.jpg);";
        yesBtn.addEventListener("click", like);
        btnDiv.appendChild(yesBtn);

        pfriend.appendChild(btnDiv);
        pfriend.style.display = "none";

        preFriends.appendChild(pfriend);
      }
      let lastDiv = document.createElement('div');
//      let mImg = document.createElement("img");
//      lastDiv.innerHTML = '<img src="../articleForum/images/board/couples3.jpg" />';
//      mImg.src = `/pikachuMVC/init/getMemberImage?id=${data[i].m_id}`;

      lastDiv.innerHTML = '<span style="color:blue">已經沒有推薦的人選嘍～</span>';
      lastDiv.style.display = "none";
      preFriends.appendChild(lastDiv);
      
      preFriends.firstChild.style.display = "block";
    },
    "json"
  );
}

function like() {
  let preFriends = document.getElementById("preFriends");
  let preDelDiv = this.parentNode.parentNode;
  console.log("!!!!!" + preDelDiv.id);
  let url = "addPreFriend.do";
  let data = {
    friendId: preDelDiv.id,
  };

  $.post(
    url,
    data,
    function (data, textStatus, jqXHR) {
      if (data == true) {
        preDelDiv.style.display = "none";
        preFriends.removeChild(preDelDiv);
        preFriends.firstChild.style.display = "block";
      }
    },
    "json"
  );
}

function notLike() {
  let preFriends = document.getElementById("preFriends");
  let preDelDiv = this.parentNode.parentNode;
  preDelDiv.style.display = "none";
  preFriends.removeChild(preDelDiv);
  preFriends.firstChild.style.display = "block";
}
