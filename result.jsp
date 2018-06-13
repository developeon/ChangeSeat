<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="css/blackboard.css">
<link rel="stylesheet" type="text/css"
	href="//fonts.googleapis.com/css?family=Architects Daughter" />
  <style>
        .desk01 {
            margin: 10px;
            border: 1px solid rgba(0, 0, 0, 0.25);
            width: 80px;
            background: #d28b20;
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.25);
            border-radius: 3px;
            display: inline-block;
        }
        
        .desk01 .desk02 {
            height: 40px;
            margin: 10px;
            width: 75%;
            background: rgba(0, 0, 0, 0.3);
            border-radius: 2px;
            text-align: center;
            display: inline-block;
        }
        
        .desk02 span {
            line-height: 40px;
            color: white;
        }
        
        .tmp {
            width: 80px;
            display: inline-block;
            margin: 10px;
        }
        
        .container {
            text-align: center;
            width: 80%;
            margin: 30px auto;
        }
    </style>
</head>
<body>
	<div id="panel">
		<div id="start-board">
			<div id="how-play" class="questions">Blackboard</div>
		</div>
	</div>
	
	   <div class="container">
        <div class="desk01">
            <div class="desk02"> <span>1번</span> </div>
        </div>
        <div class="desk01">
            <div class="desk02"> <span>2번</span> </div>
        </div>
        <div class="tmp"> </div>
        <div class="desk01">
            <div class="desk02"> <span>3번</span> </div>
        </div>
        <div class="desk01">
            <div class="desk02"> <span>4번</span> </div>
        </div>
        
        <br>
         <div class="desk01">
            <div class="desk02"> <span>1번</span> </div>
        </div>
        <div class="desk01">
            <div class="desk02"> <span>2번</span> </div>
        </div>
        <div class="tmp"> </div>
        <div class="desk01">
            <div class="desk02"> <span>3번</span> </div>
        </div>
        <div class="desk01">
            <div class="desk02"> <span>4번</span> </div>
        </div>
    </div>
</body>
</html>