<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="modelo.Partida"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Juego Hundir la Flota</title>
<style>
	table{
    	width:100%;
    	heigth:100%;
    	margin: auto;
    }
	#blanco {
	   background-color:white
	}
	#azul{
       background-color: #0080ff  
    }
    #rojo {
       background-color: #cc0000
    }
    #naranja{
       background-color: #ff9900
    }
    
</style>
</head>
<body>
	<h1>Hundir la flota</h1>
	<%
 		//Datos a usar
		final int AGUA = -1, TOCADO = -2, HUNDIDO = -3, TAMTABLA = 8;
	
		session = request.getSession(true);
		
		Partida partida = (Partida) session.getAttribute("partida");
		int fil = -1, col = -1;

		 
		if (request.getParameter("casilla") != null){
				String casillas[] = request.getParameter("casilla").split("#");
				int f = Integer.valueOf(casillas[0]);
				int c = Integer.valueOf(casillas[1]);
			 
		}	

		//Si no se ha disparado empezamos la partida
		
		if (partida.getDisparos() == 0) {

			out.println("NUEVA PARTIDA<br>");

		//Comprobams que no quedan barcos. La partida acaba
		} else if (partida.getBarcosRestantes() == 0) {
			out.println("GAME OVER<br>");
		//Si la casilla disparada ya lo habia sido anteriormente...
		} else if ((boolean) request.getAttribute("disparada")) {
			out.println("Pagina de resultados del disparo en [" + (fil + 1) + "," + (char) (col + 65) + "]: Ya habia sido disparada<br>");
			//Casilla disparada por primera vez...
		} else {
			out.println("Pagina de resultados del disparo en [" + (fil + 1) + "," + (char) (col + 65) + "]: OK! <br>");
		}

		//Mensajes de estado
		out.println("Barcos navegando: " + partida.getBarcosRestantes() + "<br>");
		out.println("Barcos hundidos: " + (partida.getNumBarcos() - partida.getBarcosRestantes()) + "<br>");
		out.println("Numero de disparos efectuados: " + partida.getDisparos() + "<br>");

		out.println("<form style=\"text-align:center\" method=\"get\" action=\"HundirFlotaServlet\">");
		out.println("<table>");
		out.println("<tr>");
		out.println("<td></td>");
		
		//Añadir letras
		for (int i = 0; i < TAMTABLA; i++) {
			char c = (char) (i + 65);
			out.println("<th> " + c + " </th>");
		}
		out.println("</tr>");
		String color = null;
		
		//Añadimos filas, en forma de numero
		for (int i = 0; i < TAMTABLA; i++) {
			out.println("<tr>");
			out.println("<th>" + (i + 1) + "</th>");
			
			for (int j = 0; j < TAMTABLA; j++) {
				
				//Si la casilla que estamos poniendo ha sido disparada obtenemos su valor para seleccionar color
				if (partida.casillaDisparada(i, j)) {
					switch (partida.getCasilla(i, j)) {
					case AGUA:
						color = "azul";
						break;
					case TOCADO:
						color = "naranja";
						break;
					case HUNDIDO:
						color = "rojo";
						break;
					}
					//Color por defecto de la casilla no disparada(blanco)
				} else {
					color = "blanco";
				}
				out.println("<td id=\"" + color + "\"" + "><input type=\"radio\" name=\"casilla\" value=\"" + i + "#" + j + "\"required> </td>");
			}
			out.println("</tr>");
		}

		out.println("</table>");
		out.println("<input type=\"submit\" value=\"Prueba casilla\">");
		out.println("</form>");
	%>
	<br><a href="/FleetServlet/SolucionPartidaServlet">Muestra solucion</a><br>
	<a href="/FleetServlet/NuevaPartidaServlet">Nueva partida</a><br>
	<a href="/FleetServlet/SalirPartidaServlet">Salir</a><br>
</body>
</html>