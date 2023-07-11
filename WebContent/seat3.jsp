<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.util.Arrays"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매페이지2</title>
<link rel="stylesheet" href="css/book.css">
<link rel="stylesheet"
   href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
h2 {
   text-align: center;
   justify-content: center;
   width: 100%;
}
section{
   padding-top : 50px;
}

.container {
   max-width: 1200px;
   height: 95%;
   margin: 0 auto;
   padding: 20px;
   border: 1px solid;
   display: flex;
   overflow: auto;
}

/* 사이드바 */
.sidebar {
   width: 200px;
   height: auto;
   background-color: #f2f2f2;
   padding: 20px;
   flex-direction: column;
   display: flex;
   flex-direction: column;
   align-items: stretch;
   overflow: auto;
}

.sidebar ul {
   list-style: none;
   padding: 0;
   margin: 0;
   flex-grow: 1;
   display: flex;
   flex-direction: column;
   justify-content: space-between;
   overflow: auto;
}

.sidebar li {
   margin-bottom: 10px;
   flex-grow: 1;
   display: flex;
   justify-content: center;
   align-items: center;
}

.sidebar li:last-child {
   margin-bottom: 0;
}

.sidebar li a {
   display: block;
   width: 100%;
   padding: 10px;
   background-color: #f0f0f0;
   color: #333;
   text-decoration: none;
}

.sidebar li.active {
   background-color: #4caf50;
   color: #fff;
}

.side-hr {
   width: 100%;
   height: 1px;
   background-color: #ccc;
   border: none;
   margin: 10px 0;
}

table {
   width: 100%;
   height: 100%;
}

.mung {
   display: flex;
   justify-content: center;
}

.img {
   margin-left: 10px;
   margin-right: 10px;
}

.counter span {
   padding: 6px;
}

.counter {
   align-items: center;
   justify-content: center;
   font-size: 20px;
   margin-top: 10px;
}

.counter label {
   font-weight: bold;
}

.counter button {
   width: 24px;
   height: 24px;
   padding: 0;
   font-size: 14px;
   background: var(--point);
}

/* 좌석 선택 */
#seatsarea {
   text-align: center;
   margin: 0 auto;
}

.seatbutton {
   margin-top: 20px;
   align-items: flex-start;
   font-size: 18px;
   width: 60px;
   height: 60px;
   margin: 2px;
   border: none;
   background-color: #ddd;
}

.seatbutton.selected {
   /* background-color: #00aaff; */
   background-color: var(--rev);
   color: #fff;
}

.seatrow {
   font-weight: bold;
   margin-left: 5px;
}

#rev {
   background: var(--point);
   display: inline-block;
   width: 100%;
}

.seatbtn {
   margin-right: 10px;
   padding: 10px 20px;
   font-size: 16px;
   background-color: var(--rev);
   color: #fff;
   border: none;
   cursor: pointer;
}

.seatbtn:hover {
   background-color: #45a049;
}

.seatbtn:focus {
   outline: none;
}
</style>

</head>
<body>
   <%@ include file="header.jsp"%>

<section>

   <!-- 예매정보 받기 -->
   <%
   String movie = String.valueOf(request.getParameter("movie"));
   String date = String.valueOf(request.getParameter("date"));
   String showtime = String.valueOf(request.getParameter("showtime"));
   String url = String.valueOf(request.getAttribute("url"));
   String theater = String.valueOf( request.getAttribute("theater"));
   String[] rseatlist = (String[]) request.getAttribute("rseatlist");
   int t_id = Integer.parseInt(String.valueOf(request.getAttribute("t_id")));
   String m_id = String.valueOf(session.getAttribute("id").toString());
   %>


   <h2>인원 선택</h2>

   <div class="container">
      <!-- 사이드바 -->
      <div class="sidebar">
         <ul>
            <li class="status-item">상영시간</li>
            <hr class="side-hr">
            <li class="status-item active">인원/좌석</li>
            <hr class="side-hr">
            <li class="status-item">결제</li>
            <hr class="side-hr">
            <li class="status-item">예매완료</li>
         </ul>
      </div>


      <table border="0">
         <tr>
            <td>
               <div class="mung">
                  <div class="img">
                     <img src="<%=url%>" width="200" height="250">
                  </div>
                  <div class="movieinfo" align="left">

                     
                      영화: <%=movie%><br> 날짜:
                     <%=date%><br> 상영 시간:
                     <%=showtime%><br> 상영관 :
                     <%=theater%><br>
                  </div>
               </div>
            </td>
            <td>
               <div class="counter">
                  <label for="adults">성인</label>&nbsp
                  <button class="seatbtn" id="decreaseAdults">-</button>
                  <span id="adultsCount">0</span>
                  <button class="seatbtn" id="increaseAdults">+</button>
               </div>
               <br>
               <div class="counter">
                  <label for="teenagers">청소년</label>&nbsp
                  <button class="seatbtn" id="decreaseTeenagers">-</button>
                  <span id="teenagersCount">0</span>
                  <button class="seatbtn" id="increaseTeenagers">+</button>
               </div>
               <br>
               <div class="counter">
                  <label for="seniors">군인</label>&nbsp
                  <button class="seatbtn" id="decreaseSeniors">-</button>
                  <span id="seniorsCount">0</span>
                  <button class="seatbtn" id="increaseSeniors">+</button>
               </div>
               <br>
               <div class="counter">
                  <label for="disabled">어린이</label>&nbsp
                  <button class="seatbtn" id="decreaseDisabled">-</button>
                  <span id="disabledCount">0</span>
                  <button class="seatbtn" id="increaseDisabled">+</button>
               </div>
               <br>
            </td>
         </tr>

         <tr>
            <td colspan=2>
               <!-- 좌석 -->
               <h2 style="background-color: #6E6E6E">S C R E E N</h2>
               <div id="seatsarea"></div> <br>
               <button id="rev" class="seatbtn" onclick="reserveSeats()">예약</button>

            </td>
         </tr>

      </table>
   </div>

   <script>
let adultsCount = 0;
let teenagersCount = 0;
let seniorsCount = 0;
let disabledCount = 0;

function reserveSeats() {
     let selectedSeats = [];
     let seatButtons = document.getElementsByClassName('seatbutton');
     
     // Check if any seats are selected
     let noSeatsSelected = true;
     for (let i = 0; i < seatButtons.length; i++) {
       if (seatButtons[i].classList.contains('selected')) {
         noSeatsSelected = false;
         break;
       }
     }
     
     if (noSeatsSelected) {
       alert('좌석을 선택해주세요.');
       return;
     }
     
     // Proceed with seat reservation
     for (let i = 0; i < seatButtons.length; i++) {
       if (seatButtons[i].classList.contains('selected')) {
         selectedSeats.push(seatButtons[i].id);
       }
     }
  let totalSelectedSeats = selectedSeats.length;
  let totalPeopleCount = adultsCount + teenagersCount + seniorsCount + disabledCount;
  
  if (totalSelectedSeats !== totalPeopleCount) {
    alert('선택한 좌석 수가 총 인원 수와 일치하지 않습니다. 좌석을 다시 선택해주세요.');
    return;
  }
  
  let reservationData = {
    adults: adultsCount,
    teenagers: teenagersCount,
    seniors: seniorsCount,
    disabled: disabledCount,
    seats: selectedSeats
  };

  
  var tot=0;
  var people=0;
  var ad = reservationData.adults;//성인
  var te = reservationData.teenagers;// 청소년
  var se = reservationData.seniors;//군인으로 변경.
  var di = reservationData.disabled;// 어린이
  tot=(ad*12000)+(te*9000)+(se*5000)+(di*3000);
  people=adultsCount+teenagersCount+seniorsCount+disabledCount
  let message = "인원 수: " + people + "\n" +
  "성인: " + reservationData.adults + "\n" +
  "청소년: " + reservationData.teenagers + "\n" +
  "군인: " + reservationData.seniors + "\n" +
  "어린이: " + reservationData.disabled + "\n" +
  "선택한 좌석: " + reservationData.seats.join(", ")+"\n"+
  "총 금액: "+tot+" 원\n\n" ;
  //alert(message);

  if(confirm(message) == true){
        console.log("선택")
     


  const form = document.createElement('form');
  form.method = 'POST';
  form.action = 'rev.do';

  const inputData = [
    { name: 'price', value: tot },
    { name: 'movie', value: '<%=movie%>' },
    { name: 'date', value: '<%=date%>' },
    { name: 'post', value: '<%=url%>' },
    { name: 'showtime', value: '<%=showtime%>' },
    { name: 'theater', value: '<%=theater%>' },
    { name: 't_id', value: '<%=t_id%>' },
    { name: 'people', value: people },
    { name: 'm_id', value: '<%=m_id%>' }
  ];

  inputData.forEach(data => {
    const input = document.createElement('input');
    input.type = 'hidden';
    input.name = data.name;
    input.value = data.value;
    form.appendChild(input);
  });

  selectedSeats.forEach(seat => {
    const seatInput = document.createElement('input');
    seatInput.type = 'hidden';
    seatInput.name = 'seats[]';
    seatInput.value = seat;
    form.appendChild(seatInput);
  });

  document.body.appendChild(form);
  form.submit();


}else{
 console.log("취소")
}

  
}


function updateCounter(elementId, count) {
     document.getElementById(elementId).textContent = count;
   }

   function checkTotalCount() {
     if (adultsCount + teenagersCount + seniorsCount + disabledCount < 10) {
       return true;
     } else {
       alert("한번에 예약 가능한 최대 인원은 10명입니다");
       return false;
     }
   }

   document.getElementById('increaseAdults').addEventListener('click', function() {
     if (checkTotalCount() && adultsCount < 10) {
       adultsCount++;
       updateCounter('adultsCount', adultsCount);
     }
   });

   document.getElementById('decreaseAdults').addEventListener('click', function() {
     if (adultsCount > 0) {
       adultsCount--;
       updateCounter('adultsCount', adultsCount);
     }
   });

   document.getElementById('increaseTeenagers').addEventListener('click', function() {
     if (checkTotalCount() && teenagersCount < 10) {
       teenagersCount++;
       updateCounter('teenagersCount', teenagersCount);
     }
   });

   document.getElementById('decreaseTeenagers').addEventListener('click', function() {
     if (teenagersCount > 0) {
       teenagersCount--;
       updateCounter('teenagersCount', teenagersCount);
     }
   });

   document.getElementById('increaseSeniors').addEventListener('click', function() {
     if (checkTotalCount() && seniorsCount < 10) {
       seniorsCount++;
       updateCounter('seniorsCount', seniorsCount);
     }
   });

   document.getElementById('decreaseSeniors').addEventListener('click', function() {
     if (seniorsCount > 0) {
       seniorsCount--;
       updateCounter('seniorsCount', seniorsCount);
     }
   });

   document.getElementById('increaseDisabled').addEventListener('click', function() {
     if (checkTotalCount() && disabledCount < 10) {
       disabledCount++;
       updateCounter('disabledCount', disabledCount);
     }
   });

   document.getElementById('decreaseDisabled').addEventListener('click', function() {
     if (disabledCount > 0) {
       disabledCount--;
       updateCounter('disabledCount', disabledCount);
     }
   });

   function updateCounter(elementId, count) {
     document.getElementById(elementId).textContent = count;
   }

   

      // DB에서 가져온 좌석 정보
       var rseatlistJson = '<%=request.getAttribute("rseatlistJson")%>';

  // JSON 문자열을 JavaScript 배열로 파싱
  var rseatlist = JSON.parse(rseatlistJson);

  // JSON 배열을 원하는 형식으로 변환
  var dbSeats = '[' + rseatlist.join(', ') + ']';
      function makeseats() {
           let seatsarea = document.getElementById('seatsarea');
           let seatrow = ['A', 'B', 'C', 'D', 'E'];
           let seatcol = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
           for (let row in seatrow) {
             let seatRowElement = document.createElement('div');
             seatRowElement.classList.add('seatrow');
             seatRowElement.textContent = seatrow[row];

             for (let col in seatcol) {
               let seatId = seatrow[row] + seatcol[col];
               let seatButton = document.createElement('input');
               seatButton.type = 'button';
               seatButton.classList.add('seatbutton');
               seatButton.id = seatId;
               seatButton.name = seatId;
               seatButton.value = seatId;

               if (dbSeats.includes(seatId) || dbSeats.includes(seatId)) {
                 seatButton.disabled = true;
               }

               seatRowElement.appendChild(seatButton);

               if (col == 4) {
                 let spacerElement = document.createElement('span');
                 spacerElement.classList.add('seatrow');
                 spacerElement.textContent = seatrow[row];
                 seatRowElement.appendChild(spacerElement);
               }
             }

             seatsarea.appendChild(seatRowElement);
           }
         }

         makeseats();
      // 좌석 클릭 이벤트
      let seatButtons = document.getElementsByClassName('seatbutton');
      for (let i = 0; i < seatButtons.length; i++) {
        seatButtons[i].addEventListener('click', function() {
          if (this.classList.contains('selected')) {
            this.classList.remove('selected');
          } else {
            let totalSelectedSeats = adultsCount + teenagersCount + seniorsCount + disabledCount;
            if (totalSelectedSeats > 0) {
              if (this.classList.contains('seatbutton') && !this.classList.contains('disabled')) {
                let selectedSeats = document.getElementsByClassName('selected');
                if (selectedSeats.length < totalSelectedSeats) {
                  this.classList.add('selected');
                }
              }
            }
          }
        });
      }

      </script>
 
   </section>
</body>
</html>