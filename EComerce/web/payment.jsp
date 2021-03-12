<%-- 
    Document   : payment
    Created on : Dec 20, 2020, 2:21:22 PM
    Author     : Prakhar Gupta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Payment Page</title>
	<link rel="stylesheet" href="style.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</head>
<body>
	<header>Payment Page</header>
        <%
           String name=request.getParameter("name"); 
           String merchantacc=request.getParameter("macc"); 
           String amount=request.getParameter("amount"); 
        %>
	<div class="row">
	<div class="col s4 offset-s1">
		<form action="doPayment.jsp" method="get" >
			<table>
				<tr>
					<th>Debit Card Details</th>
				</tr>
				<tr>
					<td>Card type: </td>
					<td>
						<label>
							<input name="group1" type="radio" required/>
							<span><img src="img/mastercard.png" alt="Mastercard" height="50px" width="60px"></span> 
						</label>
						<label>
							<input name="group1" type="radio" required/>
							<span><img src="img/visa.png" alt="Visa" height="50px" width="50px"></span>
						</label>
						  <label>
							<input name="group1" type="radio" required/>
							<span><img src="img/rupay.jpg" alt="Rupay" height="50px" width="50px"></span>
						</label>
					</td>
				</tr>
				<tr>
					<td>Card Holder Name: </td>
					<td><input type="text" name="name" id="name" required></td>
				</tr>
				<tr>
					<td>Card Number: </td>
					<td><input type="number" name="cnum" id="cnum" required></td>
				</tr>
				<tr>
					<td>Expiration date: </td>
					<td><input type="month" name="xdate" id="xdate" min="2020-12" max="2030-12" required></td>
				</tr>
				<tr>
					<td>CVV: </td>
					<td><input type="number" name="cvv" id="cvv" min="100" max="999" required></td>
				</tr>
                                 <% out.print("<input type='hidden' name='amount' value='"+amount+"'>");  %>
                                 <% out.print("<input type='hidden' name='macc' value='"+merchantacc+"'>");  %>
				<tr><td><input class="btn waves-effect waves-light" type="submit" value="Pay Now"></td></tr>
			</table>
		</form>
	</div>
	
		<div class="col s4 offset-s1 ">
		  <div class="card ">
			<div class="card-content red-text">
			  <span class="card-title">
                              <h4>Welcome <%= name %></h4>
                              <h4>Payment Amount:   <%= amount %></h4></span>
			  
			</div>
			
		  </div>
		</div>
	  </div>
	

	<footer class="page-footer"> 
		<div class="footer-copyright">
		<div class="container">
			Copyright 2020. All right reserved <br>
			Secure Payment Gateway
		<a class="grey-text text-lighten-4 right" href="#!">More Links</a>
		</div>
	  </div>

	</footer>
</body>
</html>