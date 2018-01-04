package controlador;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.Partida;

/**
 * Servlet implementation class HundirFlotaServlet
 */
@WebServlet("/HundirFlotaServlet")
public class HundirFlotaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HundirFlotaServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Partida partida;
		boolean estadoCasillaDisparada = false;
		
		response.setContentType("text/html");
		
		//Pedimos la partida
		HttpSession sesion = request.getSession(true);	
		System.out.println("Partida: "+sesion.getAttribute("partida"));
		
		//Si no hay partida, la creamos, sino miramos si esta disparada o no
		if (sesion.getAttribute("partida") == null) { 
			partida = new Partida(8,8,6); 
		
		}else {
		//Si existe la casilla
			partida = (Partida) sesion.getAttribute("partida");

			if (request.getParameter("casilla") != null){
					String posicionesCasilla[] = request.getParameter("casilla").split("#");
					int f = Integer.valueOf(posicionesCasilla[0]);
					int c = Integer.valueOf(posicionesCasilla[1]);
					
					estadoCasillaDisparada = partida.casillaDisparada(f, c);
					partida.pruebaCasilla(f, c);//devuelve el estado de la casilla, true/false	
			}
		}	
		
		//Guardamos el resultado en la sesion anterior
		sesion.setAttribute("partida", partida);
		
		
		//Redirigimos a TableroActual.jsp el resultado de vistaTablero 
		request.setAttribute("disparada", estadoCasillaDisparada);
		
		RequestDispatcher vistaTablero = request.getRequestDispatcher("TableroActual.jsp");
//		System.out.println("REQUEST  "+request);
		vistaTablero.forward(request, response);	
 	}

}
