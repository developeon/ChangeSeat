<%@page import="java.util.HashSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자리 바꾸기</title>
<link rel="stylesheet" href="css/blackboard.css">
<link rel="stylesheet" type="text/css"
	href="//fonts.googleapis.com/css?family=Architects Daughter" />
     <style>
	body{
	min-width:1220px;
	}
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
            width: 30px;
            display: inline-block;
        }
        
        .container {
            text-align: center;
            width: 80%;
            margin: 30px auto;
        }
       
    </style>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");

		int num = Integer.parseInt(request.getParameter("num")); //총 인원
		int division = Integer.parseInt(request.getParameter("division")); //분단 
		String[] seat = request.getParameterValues("seat");
		//System.out.println("인원: "+num);
		//System.out.println("분단: "+division);
		//System.out.println("결번: "+Arrays.toString(seat));

		ArrayList<Integer> numbers = new ArrayList<>();
		int ranNum;

		while (numbers.size() < num) {
			ranNum = (int) (Math.random() * num) + 1;
			if (!numbers.contains(ranNum)) {
				numbers.add(ranNum);
			}
		}

		for (int i = 0; i < numbers.size(); i++) {
			int tmp = numbers.get(i);
			boolean isRemove = true;
			for (int j = 0; j < seat.length; j++) {
				if (Integer.parseInt(seat[j]) == tmp) {
					isRemove = false;
					break;
				}
			}
			if (isRemove == true) {
				numbers.remove(i);
				i--;
			}
			
		}
		
		
		
		while(numbers.size() % (division*2) !=0){
			numbers.add(0);
		}
		
	%>
	
	 
    
	<div id="panel">
		<div id="start-board">
			<div id="how-play" class="questions">Blackboard</div>
		</div>
	</div>
	
	   <div class="container">
	   <%
	    int tmpIndex = 41;
	     for(int i = 0; i < division *2; i++){
	    	 if(numbers.get(i) == 0) {
	    		 tmpIndex = i;
	    		 break;
	    	 }
	     }
	     
	   int cnt = 0;
	     for(int i = 0; i < numbers.size(); i+=2){
	    	 cnt++;
	    	 if(tmpIndex < (division*2)){
	    		 %>
	    		 <div class='desk01'><div class='desk02'><span><%if(numbers.get(i) == 0) out.println("X"); else out.println(numbers.get(i)); %></span></div></div>
	    	     <div class='desk01'><div class='desk02'><span><%if(numbers.get(i+1) == 0) out.println("X"); else out.println(numbers.get(i+1)); %></span></div></div>
	    	     <div class='tmp'></div>
	    		 <%
	    	 }
	    	 else{
	    	 %>
	    	 <div class='desk01' <% if(numbers.get(i) == 0) out.println("style='visibility: hidden;'"); %>><div class='desk02'><span><%=numbers.get(i)%>번</span></div></div>
	    	 <div class='desk01' <% if(numbers.get(i+1) == 0) out.println("style='visibility: hidden;'"); %>><div class='desk02'><span><%=numbers.get(i+1)%>번</span></div></div>
	    	 <div class='tmp'></div>
	    	 <% 
	    	 }
	    	 if(cnt%division == 0){
	    		 out.println("<br>");
	    	 }
	     }
	     
	 
	     
	     
	   %>
       </div>

</body>
</html>