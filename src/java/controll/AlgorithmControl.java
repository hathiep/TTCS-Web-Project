/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controll;

import com.sun.corba.se.impl.orbutil.graph.Graph;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.algorithm.BFSCoHuong;
import model.algorithm.BFSVoHuong;
import model.algorithm.DFSCoHuong;
import model.algorithm.DFSVoHuong;

/**
 *
 * @author havanthiep
 */
@WebServlet(name="AlgorithmControl", urlPatterns={"/algorithmcontrol"})
public class AlgorithmControl extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
  
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int n = Integer.parseInt(request.getParameter("num_node"));
        int m = Integer.parseInt(request.getParameter("num_edge"));
        String[] type_algorithm = request.getParameterValues("type_algorithm");
        String[] direction = request.getParameterValues("direction");
        String start_node = request.getParameter("start_node");
        String finish_node = request.getParameter("finish_node");
        String list_edge = request.getParameter("list_input_edge");
        String edgeString = request.getParameter("list_split_edge");
        String ans = ""; int k = 0;
        if(type_algorithm[0].equals("1") && direction[0].equals("1")){
            BFSCoHuong bfs = new BFSCoHuong(n, m, start_node, finish_node, list_edge);
            request.setAttribute("type", "BFS có hướng");
            if(list_edge.contains(start_node+finish_node)) ans = start_node+" "+finish_node;
            else ans = bfs.Solve(); k = 0;
        }
        else if(type_algorithm[0].equals("1") && direction[0].equals("0")){
            BFSVoHuong bfs = new BFSVoHuong(n, m, start_node, finish_node, list_edge);
            request.setAttribute("type", "BFS vô hướng");
            if(list_edge.contains(start_node+finish_node) || list_edge.contains(finish_node+start_node)) ans = start_node+" "+finish_node;
            else ans = bfs.Solve(); k = 0;
        }
        else if(type_algorithm[0].equals("0") && direction[0].equals("1")){
            DFSCoHuong dfs = new DFSCoHuong(n, m, start_node, finish_node, list_edge);
            request.setAttribute("type", "DFS có hướng");
            ans = dfs.Solve(); k = 0;
        }
        else if(type_algorithm[0].equals("0") && direction[0].equals("0")){
            DFSVoHuong dfs = new DFSVoHuong(n, m, start_node, finish_node, list_edge);
            request.setAttribute("type", "DFS vô hướng");
            ans = dfs.Solve(); k = 0;
        }
        else{
            ans = "Không tìm được đường đi";
            k = 1;
        }
        request.setAttribute("snode", "từ " + start_node);
        request.setAttribute("fnode", "đến " + finish_node);
        request.setAttribute("edgeString", edgeString);
        String[] list_ans = ans.split(" ");
        if(k==0) request.setAttribute("ans", String.join("->", list_ans));
        else request.setAttribute("ans", ans);
        request.setAttribute("pathString", ans);
        request.getRequestDispatcher("algorithm.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
