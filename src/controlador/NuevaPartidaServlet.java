package controlador;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class NuevaPartidaServlet
 */
@WebServlet("/NuevaPartidaServlet")
public class NuevaPartidaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NuevaPartidaServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		HttpSession sesion = request.getSession(true);
		sesion.removeAttribute("partida");
		sesion.invalidate();
		
		//Redireccion y creacion de nueva partida
		RequestDispatcher vistaTablero = request.getRequestDispatcher("HundirFlotaServlet");
		vistaTablero.forward(request, response);
 	}

	 

}
