<!DOCTYPE html>
<%@page import="VO.UserServiceVO"%>
<html>
<head>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="UTF-8">
<%
String str="";
String seid = (String) session.getAttribute("id");
if (seid != null) {
%>
<script>
var seid='<%=seid%>';
</script>
<%
} else {
%>
<script>
var seid=null
</script>
<%
}
%>
<title>영화 예매 페이지</title>
<title>영화 예매 페이지</title>
<!-- .CSS -->
<link rel="stylesheet" href="css/book.css">
<link rel="stylesheet"
    href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- 달력 CSS -->
</head>
<body>
    <!-- header -->
    <header>
        <%@ include file="header.jsp"%>
    </header>

    <div class="container">
        <!-- 사이드바 -->
        <div class="sidebar">
            <ul>
                <li class="status-item active">상영시간</li>
                <hr class="side-hr">
                <li class="status-item">인원/좌석</li>
                <hr class="side-hr">
                <li class="status-item">결제</li>
                <hr class="side-hr">
                <li class="status-item">예매완료</li>
            </ul>
        </div>

        <div class="book">
            <div class="theater_list">
                <h2>영화관 선택</h2>
                <ul id="cinema-list">
                    <c:forEach var="i" items="${userth}">
                        <li class="cinema-item" onclick="showMovies('${i}')">${i}</li>
                    </c:forEach>
                </ul>
            </div>

            <div class="movie_list">
                <h2>영화 목록</h2>
                <ul id="movie-list"></ul>
            </div>

            <div class="cal_scr_info">
                <div class="calender">
                    <input type="text" id="date-select" placeholder="날짜를 선택하세요">
                </div>

                <div class="screen_info">
                    <ul id="showtime-list"></ul>
                </div>

                <div>
                    <button id="booking-button" onclick="bookTicket()">좌석선택</button>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        var cinemas = {
        <c:forEach var="i" items="${userth}">
            '${i}': [
                <c:forEach var="j" items="${moname}">'${j}',
                </c:forEach>
            ],
        </c:forEach>
        };
        var schedules = {
                <c:forEach var="i" items="${moname}" varStatus="loop">
                    '${i}': {
                        <c:forEach var="j" items="${tmplist}" varStatus="innerLoop">
                            '${j}': [
                            <c:forEach var="k" items="${ulist}" varStatus="innerInnerLoop">
                                <c:if test="${k.t_date == j && k.mo_name==i}">
                            "${k.scr_id} 관 - ${k.t_stime}", 
                                </c:if>
                            </c:forEach>
                            ]<c:if test="${not innerLoop.last}">, </c:if>
                        </c:forEach>
                    }<c:if test="${not loop.last}">, </c:if>
                </c:forEach>
            };




        function showMovies(cinema) {
            var movieList = cinemas[cinema];
            var movieListHTML = '';

            if (movieList) {
                for (var i = 0; i < movieList.length; i++) {
                    movieListHTML += '<li class="movie-item" onclick="showDates(\'' + movieList[i] + '\', \'' + cinema + '\')">' + movieList[i] + '</li>';
                }
            }

            document.getElementById('movie-list').innerHTML = movieListHTML;
            document.getElementById('date-select').value = '';
            document.getElementById('showtime-list').innerHTML = '';
        }

        function showDates(movie, cinema) {
            var dateSelect = document.getElementById('date-select');
            var movieDates = schedules[movie];
            var dateOptionsHTML = '';

            if (movieDates) {
                var dates = Object.keys(movieDates);
                for (var i = 0; i < dates.length; i++) {
                    dateOptionsHTML += '<option value="' + dates[i] + '">' + dates[i] + '</option>';
                }
            }

            dateSelect.innerHTML = dateOptionsHTML;
            if (dateSelect.value) {
                showSchedule();
            }

            var movieItems = document.getElementsByClassName('movie-item');
            for (var j = 0; j < movieItems.length; j++) {
                movieItems[j].classList.remove('selected');
                if (movieItems[j].textContent === movie) {
                    movieItems[j].classList.add('selected');
                }
            }

            // 선택한 영화관을 세션에 저장
            sessionStorage.setItem('selectedCinema', cinema);
        }

        function showSchedule() {
            var selectedMovie = document.querySelector('.movie-item.selected');
            var selectedDate = document.getElementById('date-select').value;
            var showtimeList = document.getElementById('showtime-list');

            if (selectedMovie && selectedDate) {
                var movie = selectedMovie.textContent;
                var schedule = schedules[movie][selectedDate];
                var scheduleHTML = '';

                if (schedule) {
                    for (var i = 0; i < schedule.length; i++) {
                        scheduleHTML += '<li onclick="selectShowtime(this)">' + schedule[i] + '</li>';
                    }
                }

                showtimeList.innerHTML = scheduleHTML;
            } else {
                showtimeList.innerHTML = '';
            }
        }

        function selectShowtime(showtime) {
            var selectedShowtime = document.querySelector('#showtime-list li.selected');
            if (selectedShowtime) {
                selectedShowtime.classList.remove('selected');
            }
            showtime.classList.add('selected');
        }

        function bookTicket() {
            var selectedMovie = document.querySelector('.movie-item.selected');
            var selectedDate = document.getElementById('date-select').value;
            var selectedShowtime = document.querySelector('#showtime-list li.selected');
            var selectedCinema = sessionStorage.getItem('selectedCinema'); // 선택한 영화관 가져오기

            if (selectedMovie && selectedDate && selectedShowtime) {
                var movie = selectedMovie.textContent;
                var date = selectedDate;
                var showtime = selectedShowtime.textContent;
                // 예매 정보를 팝업창에 표시하기
                var popupContent = "예매 하시겠습니까?\n";
                popupContent += "영화: " + movie + "\n";
                popupContent += "날짜: " + date + "\n";
                popupContent += "상영시간: " + showtime;

                if (seid != null) {
                    // 예매 데이터를 포함한 form 엘리먼트 생성
                    var form = document.createElement('form');
                    form.method = 'POST';
                    form.action = 'boseat.do';

                    // 데이터를 담는 hidden input 엘리먼트 추가
                    var movieInput = document.createElement('input');
                    movieInput.type = 'hidden';
                    movieInput.name = 'movie';
                    movieInput.value = movie;
                    form.appendChild(movieInput);

                    var dateInput = document.createElement('input');
                    dateInput.type = 'hidden';
                    dateInput.name = 'date';
                    dateInput.value = date;
                    form.appendChild(dateInput);

                    var showtimeInput = document.createElement('input');
                    showtimeInput.type = 'hidden';
                    showtimeInput.name = 'showtime';
                    showtimeInput.value = showtime;
                    form.appendChild(showtimeInput);

                    var cinemaInput = document.createElement('input');
                    cinemaInput.type = 'hidden';
                    cinemaInput.name = 'cinema';
                    cinemaInput.value = selectedCinema; // 선택한 영화관 값 추가
                    form.appendChild(cinemaInput);

                    // form을 문서에 추가하고 제출
                    document.body.appendChild(form);
                    form.submit();
                } else {
                    alert('로그인이 필요한 서비스입니다.');
                }
            } else {
                alert('영화, 날짜, 상영시간을 선택해주세요.');
            }
        }

        $(function() {
            $("#date-select").datepicker({
                dateFormat: "yy-mm-dd",
                minDate: 0
            });

            $("#date-select").on("change", function() {
                showSchedule();
            });
        });
    </script>
    
    
    		<script>
window.addEventListener('DOMContentLoaded', function() {
  // 영화관 선택
  document.getElementById('cinema-list').children[0].click();

  // 영화 선택
// URL에서 name 파라미터 값 가져오기
var urlParams = new URLSearchParams(window.location.search);
var name = urlParams.get('name');

// 영화 목록을 가져와서 클릭 이벤트 바인딩
var movieList = document.getElementById('movie-list');
var movies = movieList.children;

for (var i = 0; i < movies.length; i++) {
  var movie = movies[i];
  var movieTitle = movie.innerText;

  if (movieTitle === name) {
    // 일치하는 영화를 찾으면 클릭 이벤트 발생
    movie.click();
    break;
  }
}
  // 날짜 선택 (오늘 날짜)
  var dateSelect = document.getElementById('date-select');
  dateSelect.value = new Date().toISOString().split('T')[0];
  showSchedule();
});
</script>
</body>
</html>