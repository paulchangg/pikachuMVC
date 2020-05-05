window.addEventListener('load',doFirst);

function doFirst(){
    let url = 'getFriendList.do';
    let data;

    $.post(url, data,
        function (data, textStatus, jqXHR) {
            for(let i = 0; i < data.length; i++){
                let friendList = document.getElementById('friendList');

                let friend = document.createElement('div');
                friend.id = data[i].m_id;
                friend.className = 'inline_block';

                let mImg = document.createElement('img');
                mImg.style.width = '50px';
                mImg.src = `/pikachuMVC/init/getMemberImage?id=${data[i].m_id}`;
                friend.appendChild(mImg);

                let mName = document.createElement('p');
                mName.innerHTML = `${data[i].name}`;
                mName.style.padding = '0 0 0 20px';
                friend.appendChild(mName);

                let btnDiv = document.createElement('div');
                btnDiv.style.paddingLeft = '400px';

                let btn = document.createElement('button');
                btn.className = 'btn btn-secondary btn-sm';
                btn.innerHTML = '聊天';
                btn.addEventListener('click',chat);
                btnDiv.appendChild(btn);
                friend.appendChild(btnDiv);

                friendList.appendChild(friend);
            }
        },
        "json"
    );
}

function chat(){
    let fId = this.parentNode.parentNode.id
    let url = 'chat.do';
    let data = {
        f: fId
    };

    $.get(url, data,
        function (data, textStatus, jqXHR) {
            if(data){
                window.location.href = '/pikachuMVC/friends/Chat';
            }
        },
        "json"
    );
}