<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 자리 바꾸기 </title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Josefin+Sans:300,400,600,700" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/checkbox.css">
    <link rel="stylesheet" href="css/seat.css">
    <link rel="stylesheet" href="css/radioBtn.css">
</head>
<body>
  <div class="container">
        <div class="title">
            <h1>자리 바꾸기</h1> </div>
        <div class="form-container">
            <form method="post" action = "placementProc.jsp">
                <div class="counter">
                    <label>인원</label>
                    <input class="input-number-decrement" value="-" data-min="1" onclick="drawSeat('btn', 'dec')">
                    <input id="num" name = "num" class="input-number" type="text" value="1" onchange="drawSeat('text')">
                    <input class="input-number-increment" value="+" data-max="40" onClick="drawSeat('btn', 'inc')"> </div>
                <div class="counter">
                    <label>분단</label>
                    <div class="radio">
                        <label>
                            <input type="radio" name="division" value="2" checked> 2분단 </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="division" value="3"> 3분단 </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="division" value="4"> 4분단 </label>
                    </div>
                </div>
                <div class="counter" style="overflow: auto;"> <font size="2px"> <font color="red">*</font> 결번이 있다면 체크를 해제해주세요. </font>
                    <div id="seat">
                        <input id="seat-1" class="seat-select" type="checkbox" value="1" name="seat" checked />
                        <label for="seat-1" class="seat">1</label>
                    </div>
                </div>
                <div class="counter" style="text-align: left;">
                    <input id="checkbox-1" class="checkbox-custom" name="checkbox-1" type="checkbox" checked>
                    <label for="checkbox-1" class="checkbox-custom-label">이전 짝과 앉지 않기</label>
                    <input id="checkbox-2" class="checkbox-custom" name="checkbox-1" type="checkbox" checked>
                    <label for="checkbox-2" class="checkbox-custom-label">이전 자리에 앉지 않기</label>
                </div>
                <div id="buttons">
                    <input type="reset" value="reset" id="reset-button" onclick="resetbutton()" class="hvr-grow">
                    <input type="submit" value="submit" id="submit-button" class="hvr-grow"> </div>
            </form>
        </div>
      </div>
      <div class="data hidden"></div>
        
          <script>
        function drawSeat(mode, type) {
            var number = document.getElementById("num").value;
            var IntNumber = parseInt(number);
            if (mode == "btn") {
                if (type == "dec") {
                    IntNumber -= 1;
                }
                else {
                    IntNumber += 1;
                }
            }
            if (IntNumber < 1) return false;
            if (IntNumber > 40) return false;
            var innerText = "";
            for (var i = 1; i <= IntNumber; i++) {
                innerText += '<input id="seat-' + i + '" class="seat-select" type="checkbox" value="' + i + '" name="seat" checked/><label for="seat-' + i + '" class="seat">' + i + '</label>';
            }
            document.getElementById("seat").innerHTML = innerText;
        }

        function resetbutton() {
            document.getElementById("seat").innerHTML = '<input id="seat-1" class="seat-select" type="checkbox" value="1" name="seat" checked/><label for="seat-1" class="seat">1</label>';
        }
    </script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script>
    <script src='js/index.js'></script>
</body>
</html>