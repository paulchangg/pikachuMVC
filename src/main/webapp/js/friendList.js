window.addEventListener("load", doFirst);

function doFirst() {
  let url = "getFriendList.do";
  let data;

  $.post(
    url,
    data,
    function (data, textStatus, jqXHR) {
      for (let i = 0; i < data.length; i++) {
        let friendList = document.getElementById("friendList");
        let container = document.createElement("div");
        container.className = "container";
        container.id = data[i].m_id;

        let friend = document.createElement("div");
        friend.id = data[i].m_id;
        friend.className = "row";
        // friend.style = "background-color: #FDFCF6;";

        let imgDiv = document.createElement("div");
        imgDiv.className = "col-2";
        imgDiv.style = "margin-top: 20px;";

        let mImg = document.createElement("img");
        mImg.className = "memberid_img";
        mImg.style = "width: 100%;";
        mImg.src = `/pikachuMVC/init/getMemberImage?id=${data[i].m_id}`;
        imgDiv.appendChild(mImg);
        friend.appendChild(imgDiv);

        let nameDiv = document.createElement("div");
        nameDiv.className = "col-5";
        nameDiv.style = "margin-top: 42px;";

        let mName = document.createElement("p");
        mName.innerHTML = `${data[i].name}`;
        mName.style.padding = "0 0 0 20px";
        nameDiv.appendChild(mName);
        friend.appendChild(nameDiv);

        let btnDiv = document.createElement("div");
        btnDiv.className = "col";

        let btn = document.createElement("button");
        btn.className = "btn btn-secondary btn-sm";
        btn.style = "margin-top: 35px; position: absolute;";
        btn.innerHTML = "聊天";
        btn.addEventListener("click", chat);
        btnDiv.appendChild(btn);
        friend.appendChild(btnDiv);

        let delDiv = document.createElement("div");
        delDiv.className = "col-3";

        let delBtn = document.createElement("button");
        delBtn.className = "btn btn-secondary btn-sm";
        delBtn.style = "margin-top: 35px; margin-right: -1px;";
        delBtn.innerHTML = "刪除好友";
        delBtn.addEventListener("click", delFriend);
        delDiv.appendChild(delBtn);
        friend.appendChild(delDiv);

        let div = document.createElement("div");
        div.style = "height: 120px; width: 50px;";
        friend.appendChild(div);
        container.appendChild(friend);

        friendList.appendChild(container);
      }
    },
    "json"
  );
}

function chat() {
  let fId = this.parentNode.parentNode.id;
  let url = "chat.do";
  let data = {
    f: fId,
  };

  $.get(
    url,
    data,
    function (data, textStatus, jqXHR) {
      if (data) {
        // window.location.href = "/pikachuMVC/friends/Chat";
        window.open(
          "/pikachuMVC/friends/Chat",
          "Chat",
          (config =
            "height=450,width=600,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no")
        );
      }
    },
    "json"
  );
}

function delFriend() {
  let friendList = document.getElementById("friendList");
  let fId = this.parentNode.parentNode.id;
  let preDelDiv = this.parentNode.parentNode.parentNode;

  let url = "rmFriend.do";
  let data = {
    f: fId,
  };

  $.post(
    url,
    data,
    function (data, textStatus, jqXHR) {
      if (data) {
        preDelDiv.style.display = "none";
        friendList.removeChild(preDelDiv);
      }
    },
    "json"
  );
}
