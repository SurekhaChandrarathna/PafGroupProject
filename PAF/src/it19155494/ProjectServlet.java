package it19155494;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProjectServlet
 */
@WebServlet("/")
public class ProjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private DBConnection dbConnection;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProjectServlet() {
    	this.dbConnection = new DBConnection();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		this.doGet(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getServletPath();
		
		switch (action){
		case "/new":
			showNewForm(request, response);
			break;
		case "/insert":
			try {
				insertProject(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException ex) {
				// TODO Auto-generated catch block
				ex.printStackTrace();
			}
			break;
		case "/delete":
			try {
				deleteProject(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException exe) {
				// TODO Auto-generated catch block
				exe.printStackTrace();
			}
			break;
		case "/edit":
			try {
				showEditForm(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ServletException ex) {
				// TODO Auto-generated catch block
				ex.printStackTrace();
			} catch (IOException exx) {
				// TODO Auto-generated catch block
				exx.printStackTrace();
			}
			break;
		case "/update":
			try {
				updateProject(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		default:
			try {
				listUser(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		}
	}
	
	private void listUser(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Project> listProject = dbConnection.selectAllProjects();
		request.setAttribute("listProject", listProject);
		RequestDispatcher dispatcher = request.getRequestDispatcher("project_list.jsp");
		dispatcher.forward(request, response);
	}

	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("project_form.jsp");
		dispatcher.forward(request, response);
	}
	
	private void insertProject(HttpServletRequest request, HttpServletResponse response)
				throws SQLException, IOException{
		String code = request.getParameter("p_id");
		String imgString = request.getParameter("project_img");
		String nameString = request.getParameter("proj_name");
		String cateString = request.getParameter("proj_category");
		String deString = request.getParameter("proj_des");
		long budget = Long.parseLong(request.getParameter("proj_budget"));
		
		Project project = new Project(code, imgString, nameString, cateString, deString, budget);
		
		dbConnection.insertProject(project);
		response.sendRedirect("list");
		
	}
	
	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Project existingProjects = dbConnection.selectProject(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("project_form.jsp");
		request.setAttribute("project", existingProjects);
		dispatcher.forward(request, response);

	}
	
	private void updateProject(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String pcode = request.getParameter("p_id");
		String pimg = request.getParameter("project_img");
		String pname = request.getParameter("proj_name");
		String pcate = request.getParameter("proj_category");
		String pdeS = request.getParameter("proj_des");
		long pbudge = Long.parseLong(request.getParameter("proj_budget"));

		Project pr = new Project(id, pcode, pimg, pname, pcate, pdeS, pbudge);
		dbConnection.updateProjects(pr);
		response.sendRedirect("list");
	}
	private void deleteProject(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		dbConnection.deleteProject(id);
		response.sendRedirect("list");

	}
}
