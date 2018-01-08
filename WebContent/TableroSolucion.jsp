<%@ page language="java" contentType="text/html; charset=ISO-8859-1"	pageEncoding="ISO-8859-1" import="modelo.Partida" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Juego Hundir la Flota</title>
<style>
table {
	width: 100%;
	heigth: 100%;
	margin: auto;
}

#azul {
	background-color: #0080ff
;
}

#rojo {
	background-color: #cc0000
}
</style>
</head>
<body>
	<h1>Hundir la flota</h1>
	<%
	//Datos a usar
	final int AGUA = -1, TAMTABLA = 8;
 	Partida partida = (Partida) request.getAttribute("partida");
	
	out.println("Solucion Partida <br>");
	out.println("Barcos navegando: " + partida.getBarcosRestantes()+"<br>");
	out.println("Barcos hundidos: " +(partida.getNumBarcos()-partida.getBarcosRestantes())+"<br>");
	out.println("Numero de disparos efectuados: " +partida.getDisparos()+"<br>");
	//Diseño del tablero
	out.println("<form style=\"text-align:center\" method=\"get\" action=\"HundirFlotaServlet\">");
		out.println("<table>");
			out.println("<tr>");
				out.println("<td></td>");
				
				
				for (int i = 0; i<TAMTABLA; i++){
					char letraActual= (char) (i+65);
					out.println("<th>"+letraActual+"</th>");
				}
				
				out.println("</tr>");
				String color = null;
				
				
				for (int i = 0; i<TAMTABLA; i++){
					out.println("<tr>");
					out.println("<th>"+(i+1)+"</th>");
					for(int j = 0; j<TAMTABLA; j++){				
						if (partida.getCasilla(i, j) == AGUA){
							color = "azul";						
						}else{
							color = "rojo";
						}
						//Impresion del color en el tablero
						out.println("<td id=\""+color+"\""+"></td>");
				}
				out.println("</tr>");
			}
		
		out.println("</table>");
	out.println("</form>");
	%>
	<br><a href="NuevaPartidaServlet">Nueva partida</a><br>
	<a href="SalirPartidaServlet">Salir</a><br>
</body>
</html>