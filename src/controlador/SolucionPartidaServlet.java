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
 * Servlet implementation class SolucionPartidaServlet
 */
@WebServlet("/SolucionPartidaServlet")
public class SolucionPartidaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SolucionPartidaServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		HttpSession sesion = request.getSession(true);
		Partida partida =(Partida) sesion.getAttribute("partida");
		sesion.invalidate();
				
		//Redireccion a TableroSolucion.jsp
		request.setAttribute("partida", partida);
		RequestDispatcher vistaTablero = request.getRequestDispatcher("TableroSolucion.jsp");
		vistaTablero.forward(request, response);
	}

	 
}
