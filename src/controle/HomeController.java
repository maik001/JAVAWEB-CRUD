package controle;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import modelo.Usuario;

@WebServlet("/home")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pagina = request.getParameter("pagina").toString();
		switch(pagina) {
		case "home":
			ArrayList<Usuario> listaUsuarios = new UsuarioControle().selecionarTodos();
			request.setAttribute("lista", listaUsuarios);
			request.getRequestDispatcher("home.jsp").forward(request, response);
			break;
		case "cadastro":
			request.getRequestDispatcher("Cadastro.jsp").forward(request, response);
			break;
		case "editar":
			if(request.getParameter("usuario") != null) {
			Usuario usuarioEdit = new UsuarioControle().selecionarUm(Integer.parseInt(request.getParameter("usuario")));
			request.setAttribute("usuario", usuarioEdit);
			}
			request.getRequestDispatcher("Editar.jsp").forward(request, response);
			break;
		case "excluir":
			if(request.getParameter("usuario") != null) {
			Usuario usuarioRem = new UsuarioControle().selecionarUm(Integer.parseInt(request.getParameter("usuario")));
			request.setAttribute("usuario", usuarioRem);
			}
			request.getRequestDispatcher("Excluir.jsp").forward(request, response);
			break;
		default:
			request.getRequestDispatcher("404.jsp").forward(request, response);
		}
	}

	

	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String acao = req.getParameter("form").toString().toLowerCase();
		switch (acao) {
		case "buscaid":
			Usuario usuario = new UsuarioControle().selecionarUm(Integer.parseInt(req.getParameter("buscaId")));
			if(usuario != null) {
				req.setAttribute("usuario",usuario);
				req.getRequestDispatcher("Editar.jsp").forward(req, resp);
			}else {
				req.getRequestDispatcher("404.jsp").forward(req, resp);
			}
			break;
		case "cadastro":
			if(req.getParameter("senha").equals(req.getParameter("csenha"))) {
				Usuario user = new Usuario();
				user.setUsuario(req.getParameter("usuario"));
				user.setEmail(req.getParameter("email"));
				user.setSenha(req.getParameter("senha"));
				if(new UsuarioControle().inserirUsuario(user)){
				req.getRequestDispatcher("index.jsp").forward(req,resp);
				}else {
					req.getRequestDispatcher("404.jsp").forward(req, resp);
				}
			}else {
				req.getRequestDispatcher("404.jsp").forward(req, resp);
			}
			break;
		case "editar":
			if(req.getParameter("idUser") != null && req.getParameter("senha").equals(req.getParameter("csenha"))){
				Usuario edicao = new Usuario();
				edicao.setId(Integer.parseInt(req.getParameter("idUser")));
				edicao.setUsuario((req.getParameter("usuario")));
				edicao.setEmail((req.getParameter("email")));
				edicao.setSenha((req.getParameter("senha")));
				if(new UsuarioControle().atualizar(edicao)) {
					req.getRequestDispatcher("index.jsp").forward(req, resp);
				}else {
					req.getRequestDispatcher("404.jsp").forward(req, resp);
				}
			}
			break;
		case "buscarem":
			Usuario busca = new UsuarioControle().selecionarUm(Integer.parseInt(req.getParameter("buscaIdRem")));
			if(busca != null) {
				req.setAttribute("usuario",busca);
				req.getRequestDispatcher("Excluir.jsp").forward(req, resp);
			}else {
				req.getRequestDispatcher("404.jsp").forward(req, resp);
			}
			break;
		
		case "remove":
			if(req.getParameter("removeid") != null) {
				if(new UsuarioControle().delete(Integer.parseInt(req.getParameter("removeid")))){
					req.getRequestDispatcher("index.jsp").forward(req, resp);
				}else {
					req.getRequestDispatcher("404.jsp").forward(req, resp);
				}
			}
			break;
		default:
			req.getRequestDispatcher("404.jsp").forward(req, resp);
			
		}
		
	}
	
	
}
