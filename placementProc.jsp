<%@page import="java.util.HashSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자리 바꾸기 알고리즘</title>
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
		
		for(int iter:numbers){
			System.out.println(iter);
		}
	%>
</body>
</html>