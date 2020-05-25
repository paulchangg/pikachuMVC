<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>CHAT</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
    <link rel="stylesheet" href="../articleForum/css/bootstrap.min.css" />
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.1/css/fileinput.min.css"
      media="all"
      rel="stylesheet"
      type="text/css"
    />
    <link href='https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css' rel='stylesheet'>
    <script src="../js/jquery-3.4.1.js"></script>
    <script src="../js/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.1/js/plugins/piexif.min.js"
      type="text/javascript"
    ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/5.0.1/js/fileinput.min.js"></script>
  </head>

  <style type="text/css">
  @import url(https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@100;300;400;500;700;900&display=swap);

    /*set srcoll start*/
    ::-webkit-scrollbar {
      width: 10px;
      height: 10px;
      background-color: #d6f2fd;
    }
    ::-webkit-scrollbar-track {
      -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
      /*border-radius: 5px;*/
      background-color: #ece2d0;
    }
    ::-webkit-scrollbar-thumb {
      height: 20px;
      /*border-radius: 10px;*/
      -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
      background-color: #d5b9b2;
    }
    /*set srcoll end*/

    body {
      background-color: #e0e0e0;
    }

    body * {
      box-sizing: border-box;
    }

    body a {
      text-decoration: none;
      color: #000;
    }

    body .bg-img {
      display: block;
      width: 100%;
      height: 0;
      background-size: cover;
      background-repeat: no-repeat;
      background-position: center;
    }

    body .chatroom {
      display: flex;
      flex-direction: column;
      width: 60%;
      height: 90%;
      height: 420px;
      max-width: 360px;
      margin: auto;
      background: #fff;
    }

    body .chatroom .chatroom-header {
      position: relative;
      padding: 10px;
      background-color: #efefef;
      box-shadow: 0 1px 2px rgba(102, 102, 102, 0.3);
    }

    body .chatroom .chatroom-header .btn-close {
      position: absolute;
      top: 19px;
      right: 10px;
      width: 15px;
      height: 15px;
    }

    body .chatroom .chatroom-header .btn-close:before,
    body .chatroom .chatroom-header .btn-close:after {
      content: "";
      position: absolute;
      display: inline-block;
      width: 15px;
      height: 2px;
      top: 0;
      background-color: #777;
    }

    body .chatroom .chatroom-header .btn-close:before {
      transform: rotate(45deg);
    }

    body .chatroom .chatroom-header .btn-close:after {
      transform: rotate(-45deg);
    }

    body .chatroom .chatroom-body {
      flex: 1;
      padding: 10px;
      overflow: auto;
      background-image: url(../articleForum/images/board/talk_desk.jpg);
      background-repeat: no-repeat;
      background-size: cover;
      opacity:0.6;
    }

    body .chatroom .chatroom-body .date {
      margin: 10px 0;
      text-align: center;
      font-size: 14px;
      color: #555;
    }

    body .chatroom .chatroom-body .chatroom-item {
      display: flex;
      align-items: flex-start;
      padding: 2px 0;
    }

    body .chatroom .chatroom-body .chatroom-item.me {
      flex-direction: row-reverse;
    }

    body .chatroom .chatroom-body .chatroom-item.me .balloon {
      background-color: #fa6f51;
      color: #fff;
    }

    body .chatroom .chatroom-body .chatroom-item.me + .you {
      margin-top: 10px;
    }

    body .chatroom .chatroom-body .chatroom-item.me + .you .photo .bg-img {
      display: block;
    }

    body .chatroom .chatroom-body .chatroom-item.me + .you .balloon {
      border-top-left-radius: 10px;
    }

    body .chatroom .chatroom-body .chatroom-item.you ~ .you .photo .bg-img {
      display: none;
    }

    body .chatroom .chatroom-body .chatroom-item.you + .me {
      margin-top: 10px;
    }

    body .chatroom .chatroom-body .chatroom-item .balloon {
      display: inline-block;
      padding: 8px 10px;
      background-color: #dadada;
      max-width: 70%;
      border-radius: 10px;
    }

    body .chatroom .chatroom-bottom {
      position: relative;
      justify-self: flex-end;
      border-top: 1px solid #ccc;
    }

    body .chatroom .chatroom-bottom input {
      width: calc(100% - 70px);
      padding: 10px;
      border: 0;
      outline: 0;
    }

    body .chatroom .chatroom-bottom [class*="tool-"] {
      position: absolute;
      top: 10px;
      color: #999;
    }

    body .chatroom .chatroom-bottom [class*="tool-"]:hover {
      color: #333;
    }

    body .chatroom .chatroom-bottom .tool-send {
      right: 10px;
      font-size: 18px;
    }

    

    .bt_send{
      float: right;
      color:#b3db94;
      font-size: 2em;
      width:65px;
      height:49px;
      border: none; 
    }
    .bt_send:hover{
      color: #fcca46;
      cursor: pointer;
    }

  </style>

  <body>
    <div class="chatroom">
      <div class="chatroom-header">${fId}
        <button
          type="button"
          class="close"
          aria-label="Close"
          onclick="closeWs()"
        >
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="chatroom-body"></div>
      <div class="chatroom-bottom">
        <div class="type">
          <input
            name=""
            id="input_msg"
            cols="30"
            rows="1"
            placeholder="請輸入訊息..."
          ></input>
          <button
            class="bt_send"
            type="button"
            value="傳送"
            onclick="send_msg()"
          >
          <i class="fas fa-paper-plane"></i>
          </button>
        </div>
        <!--         <div class="tools"> -->
        <!--           <button -->
        <!--             type="button" -->
        <!--             value="退出聊天室" -->
        <!--             class="btn btn-outline-success" -->
        <!--             onclick="closeWs()" -->
        <!--           > -->
        <!--             退出聊天室 -->
        <!--           </button> -->
        <!--         </div> -->
      </div>
    </div>
    <script type="text/javascript">
      window.addEventListener("load", initWebSocket);
      var webSocket;

      function send_msg() {
        if (webSocket != null) {
          var input_msg = document.getElementById("input_msg").value.trim();
          console.log(input_msg);
          if (input_msg == "") {
            return;
          }
          webSocket.send(input_msg);
          // 清除input框裡的資訊
          document.getElementById("input_msg").value = "";
        } else {
          alert("您已掉線，請重新進入聊天室...");
        }
      }

      function closeWs() {
        webSocket.close();
      }

      function initWebSocket() {
        let roomName = "${roomName}";
        let mId = "${mId}";
        // 房間名不能為空
        // if (roomName == null || roomName == "") {
        //   alert("請輸入房間名");
        //   return;
        // }
        if ("WebSocket" in window) {
          //            alert("您的瀏覽器支援 WebSocket!");
          if (webSocket == null) {
            var url =
              "ws://172.20.10.2:8080/pikachuMVC/chat/" + roomName + "/" + mId;
            // 開啟一個 web socket
            webSocket = new WebSocket(url);
          } else {
            //                 alert("您已進入聊天室...");
          }

          webSocket.onopen = function () {
            alert("開始聊天吧～～");
          };

          webSocket.onmessage = function (evt) {
            var chatroomBody = document.getElementsByClassName(
              "chatroom-body"
            )[0];
            var received_msg = evt.data;
            let i = received_msg.indexOf(":");
            let balloonDiv = document.createElement("div");
            balloonDiv.className = "balloon";
            console.log(received_msg.substr(0, i));

            if (received_msg.substr(0, i) === "${LoginOK.m_id}") {
              let myMsg = document.createElement("div");
              myMsg.className = "chatroom-item me";
              balloonDiv.innerText = received_msg.substr(i + 1);
              myMsg.appendChild(balloonDiv);
              chatroomBody.appendChild(myMsg);
            } else {
              let yourMsg = document.createElement("div");
              yourMsg.className = "chatroom-item you";
              balloonDiv.innerText = received_msg.substr(i + 1);
              yourMsg.appendChild(balloonDiv);
              chatroomBody.appendChild(yourMsg);
            }
            // 讓滾動塊往下移動
            chatroomBody.scrollTop = chatroomBody.scrollTop + 50;
          };

          webSocket.onclose = function () {
            // 關閉 websocket，清空資訊板
            // alert("連線已關閉...");
            webSocket = null;
            document.getElementsByClassName("chatroom-body")[0].innerHTML = "";
            window.close();
            // window.location.replace("/pikachuMVC/friends/friendList");
          };
        } else {
          // 瀏覽器不支援 WebSocket
          alert("您的瀏覽器不支援 WebSocket!");
        }
      }
    </script>
  </body>
</html>
