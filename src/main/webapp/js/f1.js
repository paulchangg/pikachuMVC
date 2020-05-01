
window.addEventListener("load", doFirst);


function doFirst(){
    
    
    let url = 'getPreFriends.do';
    let data;
    $.post(url, data,
        function (data, textStatus, jqXHR) {
            for(let i = 0 ; i < data.length; i++){
                let preFriends = document.getElementById('preFriends');
                let pfriend = document.createElement('div');
                pfriend.id = data[i].m_id;

                let mImg = document.createElement('img');
                mImg.style.width = '100px';
                mImg.src = `/pikachuMVC/init/getMemberImage?id=${data[i].m_id}`;
                pfriend.appendChild(mImg);

                let mName = document.createElement('p');
                mName.innerHTML = `${data[i].name}`;
                pfriend.appendChild(mName);

                let mGender = document.createElement('p');
                mGender.innerHTML = `${data[i].gender}`;
                pfriend.appendChild(mGender);

                
                let income = `${data[i].income}`;
                if(income !== "undefined"){
                    let mIncome = document.createElement('p');
                    mIncome.innerHTML = income;
                    pfriend.appendChild(mIncome);        
                }
                
                let city = `${data[i].city}`;
                if(city !== "undefined"){
                    let mCity = document.createElement('p');
                    mCity.innerHTML = city;
                    pfriend.appendChild(mCity);
                }

                let education = `${data[i].education}`;
                if(education !== "undefined"){
                    let mEducation = document.createElement('p');
                    mEducation.innerHTML = education;
                    pfriend.appendChild(mEducation);
                }

                let noBtn = document.createElement('button');
                noBtn.innerText = 'X';
                noBtn.addEventListener('click',notLike);
                pfriend.appendChild(noBtn);

                let yesBtn = document.createElement('button');
                yesBtn.innerText = 'O';
                yesBtn.addEventListener('click',like);
                pfriend.appendChild(yesBtn);

                pfriend.style.display = 'none';

                preFriends.appendChild(pfriend);
            }

            preFriends.firstChild.style.display = 'block';
        },
        "json"
    );


}

function like(){
    let preFriends = document.getElementById('preFriends');
    let preDelDiv = this.parentNode;
    console.log("!!!!!" + preDelDiv.id);
    let url = 'addPreFriend.do';
    let data = {
        friendId: preDelDiv.id,
    };

    $.post(url, data,
        function (data, textStatus, jqXHR) {
            if(data == true){
                preDelDiv.style.display = 'none';
                preFriends.removeChild(preDelDiv);
                preFriends.firstChild.style.display = 'block';
            }
        },
        "json"
    );

}

function notLike(){
    let preFriends = document.getElementById('preFriends');
    let preDelDiv = this.parentNode;
    preDelDiv.style.display = 'none';
    preFriends.removeChild(preDelDiv);
    preFriends.firstChild.style.display = 'block';
}