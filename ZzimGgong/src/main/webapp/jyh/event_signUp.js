// 아이디 유효성 검사 기능 정규식을 통하여 test 진행 
const uid = document.querySelector("[name=uid]");
const idCheck = document.querySelector("[name=idCheck]");
var idReg = /^[A-Za-z]{1}[A-Za-z0-9]{4,12}$/;
var idflag = false;
uid.onkeyup = function(){
    if(!idReg.test(uid.value)){
        idCheck.innerText = "영문자로 시작하는 5~13자 영문자 또는 숫자이어야 합니다.";
        idflag = false;
    }else{
        idCheck.innerText = "";
        idflag = true;
    }
}

// 비밀번호 유효성 검사 기능 
var pwReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
var pws = document.querySelector("[name=pws]");
const pwCheck = document.querySelector("[name=pwCheck");
var pwflag = false;
// 정규식을 통한 숫자 문자 특수문자 유효성 검사 
// 최소 8자는 minlength를 통하여 유효성 검사 
pws.onkeyup = function(){
    if(!pwReg.test(pws.value)){
        pwCheck.innerText = "최소8자, 1개 이상 숫자,문자 포함, 특수문자 1개 포함이여야합니다.";
        pwflag = false;
    }else{
        pwCheck.innerText = "";
        pwflag = true;
    }
}

// 비밀번호 재확인 유효성 검사 
const pwRe = document.querySelector("[name=pwRe]");
const rePwCheck = document.querySelector("[name = rePwCheck]");
var reflag = false;

pwRe.onkeyup = function(){
    if(pws == "" || pwflag == false){
       alert("비밀번호 재설정부터 해주세요");
       pwRe.value = "";
       pws.focus();
    }else{
        if(pws.value == pwRe.value){
             rePwCheck.innerText = "";
             reflag = true;
        }else{
            rePwCheck.innerText = "일치하지 않습니다.";
            reflag = false;
        }
    }
}

// 닉네임 유효성 검사 
// 3 이상 10 이하, 영어 또는 숫자 또는 한글 구성 
var nikReg = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,8}$/;
const nik = document.querySelector("[name = nik]");
const nikCheck = document.querySelector("[name = nikCheck]");
var nikflag = false;
nik.onkeyup = function(){
    if(!nikReg.test(nik.value)){
        nikCheck.innerText = "2자 이상 8자 이하 영어,숫자,한글로 구성해주세요."
        nikflag = false;
    }else{
        nikCheck.innerText = "";
        nikflag = true;
    }
}
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}

// 상세주소 유효성 검사 

const s01 = document.querySelector("[name = s01]");
const s02 = document.querySelector("[name = s02]");
const s03 = document.querySelector("[name = s03]");
var addrflag = false;
var addrCheck = document.querySelector("[name = addrCheck]");
if(s01.value == "" || s02.value == "" || s03.value == ""){
    addrCheck.innerText = "주소를 입력해주세요!"
    addrflag = false;
}else{
    addrCheck.innerText = "";
    addrflag = true;
}

// 전체 선택, 전체 선택 해제 
const agreeChkAll = document.querySelector('input[name=check_all]');
    agreeChkAll.addEventListener('change', (e) => {
    let agreeChk = document.querySelectorAll('input[name=agree]');
    for(let i = 0; i < agreeChk.length; i++){
      agreeChk[i].checked = e.target.checked;
    }
});


// checkform 함수로 제출전에 최종 유효성 검사 
// onsubmit -> action 일어나기전에 일어나는 이벤트 처리 
// false 해주면 이벤트 강제종료되서 action 처리안됨.
function joinform_check(){
    const addid = document.getElementById("s04");
    const vital1 = document.getElementById("agree01");
    const vital2 = document.getElementById("agree02");
    //아이디 최종 유효성
    if(uid.value == "" || idflag==false){
        alert("아이디를 다시 확인하세요.");
        uid.focus();
        return false;
    };
    //비밀번호 최종 유효성검사
    if(pws.value == "" || pwflag==false){
        alert("비밀번호를 다시 확인하세요.");
        pws.focus();
        return false;
    };

    if(pwRe.value==""|| reflag==false){
        alert("비밀번호 재확인 입력을 확인하세요");
        pwRe.focus();
        return false;
    }

    if(nik.value == "" || nikflag == false){
        alert("닉네임 입력을 확인하세요");
        nik.focus();
        return false;
    }

    if(addrflag == false){
        alert("주소 입력을 확인하세요");
        s04.focus();
        return false;
    }

    if(!vital1.checked || !vital2.checked){
        alert("필수 항목을 체크하세요!");
        vital1.focus();
        return false; 
    }
    

}
