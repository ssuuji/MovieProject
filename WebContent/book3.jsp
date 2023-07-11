<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 예매 페이지</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="css/mov.css">
<style type="text/css">
body {
  font-family: Arial, sans-serif;
  background-color: #f2f2f2;
}

.book {
  width: 80%;
  margin: 0 auto;
  display: flex;
  border: 1px solid #ccc;
  padding: 10px;
  background-color: #fff;
}

.theater_list {
  width: 25%;
  border: 1px solid #ccc;
  margin-right: 10px;
  padding: 10px;
}

.theater_list h2 {
  margin-top: 0;
}

.movie_list {
  width: 25%;
  border: 1px solid #ccc;
  margin-right: 10px;
  padding: 10px;
}

.movie_list h2 {
  margin-top: 0;
}

.cal_scr_info {
  width: 50%;
  margin-right: 10px;
}

.calender,
.screen_info {
  border: 1px solid #ccc;
  margin-bottom: 5px;
  display: flex;
  flex-direction: column;
  align-items: center;
  padding: 10px;
}

.calender select {
  width: 100%;
  padding: 5px;
}

.screen_info ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

.screen_info li {
  margin-bottom: 5px;
  padding: 5px;
  background-color: #f9f9f9;
  cursor: pointer;
}

.screen_info li:hover {
  background-color: #eee;
}

#booking-button {
  padding: 10px 20px;
  background-color: #4caf50;
  color: #fff;
  border: none;
  cursor: pointer;
}

#booking-button:hover {
  background-color: #45a049;
}

#booking-info {
  margin-top: 10px;
  padding: 10px;
  background-color: #f9f9f9;
  border: 1px solid #ccc;
}

.selected {
  background-color: #4caf50;
  color: #fff;
}
</style>
</head>
<body>

<header>
<%@ include file="/header.jsp" %>
</header>
<section>


<div class="book">
  <div class="theater_list">
    <h2>영화관 선택</h2>
			<ul id="cinema-list">
				<c:forEach var="i" items="${selist}">
					<li class="cinema-item" onclick="showMovies('${i.thname}')">${i.thname}</li>
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
				<button id="booking-button" onclick="bookTicket()">예매</button>
			</div>
		</div>
	</div>

	<div id="booking-info"></div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>     
<c:forEach var="i" items="${selist}">
	<c:forEach var="j" items="${selist}">
			var cinemas = {
				'${i.thname}':['${j.moname}']
			};
	</c:forEach>
</c:forEach>

<c:forEach var="i" items="${selist}">
	<c:forEach var="j" items="${ulist}">
		<c:forEach var="k" items="${ulist}"> 
				var schedules = {
					'${i.moname}': {
						'${j.t_date}': ['${k.scr_id} 관 - ${k.t_stime}']
					}
				};
		</c:forEach>
	</c:forEach>
</c:forEach>

function showMovies(cinema) {
	  var movieList = cinemas[cinema];
	  var movieListHTML = '';

	  if (movieList) {
	    for (var i = 0; i < movieList.length; i++) {
	      movieListHTML += '<li class="movie-item" onclick="showDates(\'' + movieList[i] + '\')">' + movieList[i] + '</li>';
	    }
	  }

	  document.getElementById('movie-list').innerHTML = movieListHTML;
	  document.getElementById('date-select').value = '';
	  document.getElementById('showtime-list').innerHTML = '';
	}

	function showDates(movie) {
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

	  if (selectedMovie && selectedDate && selectedShowtime) {
	    var movie = selectedMovie.textContent;
	    var date = selectedDate;
	    var showtime = selectedShowtime.textContent;

	    var bookingInfo = "예매가 완료되었습니다.<br>";
	    bookingInfo += "영화: " + movie + "<br>";
	    bookingInfo += "날짜: " + date + "<br>";
	    bookingInfo += "상영시간: " + showtime;

	    document.getElementById('booking-info').innerHTML = bookingInfo;
	  } else {
	    document.getElementById('booking-info').innerHTML = "예매 정보를 모두 선택해주세요.";
	  }
	}

	$(function() {
	  $("#date-select").datepicker({
	    dateFormat: "yy-mm-dd",
	    minDate: 0,
	    onSelect: function(date) {
	      showSchedule();
	    }
	  });
	});
	</script>
	
	
	</section>
<footer>
<%@ include file="footer.jsp" %>
</footer>
	</body>
	</html>
