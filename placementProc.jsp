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
            border: 2px solid #d28b20;
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
	    		 <div class='desk01' id = "<%=i%>" onclick ="seatClick(<%=i%>)"><div class='desk02'><span id="span<%=i%>"><%if(numbers.get(i) == 0) out.println("X"); else out.println(numbers.get(i)+"번"); %></span></div></div>
	    	     <div class='desk01' id = "<%=i+1%>" onclick ="seatClick(<%=i+1%>)"><div class='desk02'><span id="span<%=i+1%>"><%if(numbers.get(i+1) == 0) out.println("X"); else out.println(numbers.get(i+1)+"번"); %></span></div></div>
	    	     <div class='tmp'></div>
	    		 <%
	    	 }
	    	 else{
	    	 %>
	    	 <div class='desk01' id = "<%=i%>" onclick ="seatClick(<%=i%>)" <% if(numbers.get(i) == 0) out.println("style='visibility: hidden;'"); %>><div class='desk02'><span id="span<%=i%>"><%=numbers.get(i)%>번</span></div></div>
	    	 <div class='desk01' id = "<%=i+1%>" onclick ="seatClick(<%=i+1%>)" <% if(numbers.get(i+1) == 0) out.println("style='visibility: hidden;'"); %>><div class='desk02'><span id="span<%=i+1%>"><%=numbers.get(i+1)%>번</span></div></div>
	    	 <div class='tmp'></div>
	    	 <% 
	    	 }
	    	 if(cnt%division == 0){
	    		 out.println("<br>");
	    	 }
	     }
	     
	 
	     
	     
	   %>
       </div>
       <form name = "forSave" method="post" action = "saveResult.jsp">
         <input type = "hidden" name = "result" value = "<% out.println(Arrays.toString(numbers.toArray()).replace("[","").replace("]","").trim()); %>">
         <input type = "hidden" name = "resultNum" value = "<%=num%>">
         <input type = "hidden" name = "resultDivision" value = "<%=division%>">
        <input type = "submit" value = "save">
       </form>
       <script>
       var cnt = 0;
       var tmpIdx1;
       var tmpIdx2;
       
        function seatClick(idx){
        	cnt++;
        	if(cnt%2==1){
        		tmpIdx1 = idx;
        	}
        	else{
        		tmpIdx2 = idx;
        	}
        	 var idx = document.getElementById(idx);
        	 idx.style.border = '2px solid red';
        	 if(cnt==2){
        		 setTimeout(function(){  
        			 cnt=0;
        		 var tmpText = document.getElementById("span"+tmpIdx1).innerHTML;
        		 document.getElementById("span"+tmpIdx1).innerHTML = document.getElementById("span"+tmpIdx2).innerHTML;
        		 document.getElementById("span"+tmpIdx2).innerHTML = tmpText;
        		 document.getElementById(tmpIdx1).style.border = '2px solid #d28b20';
        		 document.getElementById(tmpIdx2).style.border = '2px solid #d28b20'; }, 300);
        		 ChangeResultValue(tmpIdx1,tmpIdx2);
        		 
        	 }
        
         }
        function ChangeResultValue(tmpIdx1,tmpIdx2){
        	
        	var str = forSave.result.value;
            var res = str.split(",");
        	
        	var tmp = res[tmpIdx1];
        	res[tmpIdx1] = res[tmpIdx2];
        	res[tmpIdx2] = tmp;
 
        	forSave.result.value = res.toString();
        	
        }
        
       </script>
    

</body>
</html>