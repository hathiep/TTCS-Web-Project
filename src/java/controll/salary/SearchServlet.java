/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controll.salary;

import context.NVDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.management.NV;

/**
 *
 * @author havanthiep
 */
@WebServlet(name="SearchServlet", urlPatterns={"/search"})
public class SearchServlet extends HttpServlet {
   
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
        String month = request.getParameter("list-month");
        String year = request.getParameter("list-year");
        int id = Integer.parseInt(request.getParameter("list-nv"));
        String thang = month + "/" + year;
        NVDAO dao = new NVDAO();
        List<NV> list = new ArrayList<NV>();
        if(month.equals("0") && year.equals("0")){
            list = dao.getAllLuong(id); 
        }
        else if(month.equals("0") && !year.equals("0")){
            list = dao.getAllYear(year, id);
        }
        else if(!month.equals("0") && year.equals("0")){
            list = dao.getAllMonth(month, id);
        }
        else {
            list = dao.getMonth(thang, id); 
        }
        String hoten = "";
        if(id == 0) hoten = "Tất cả nhân viên";
        else for(NV i : list){
            if(i.getId() == id){
                hoten = i.getHoten();
                break;
            }
        }
        request.setAttribute("umonth", month);
        request.setAttribute("uyear", year);
        request.setAttribute("unv", request.getParameter("list-nv"));
        if(month.equals("0")) request.setAttribute("month", "Tất cả tháng");
        else if(month.charAt(0) == '0' ) request.setAttribute("month", "Tháng " + month.charAt(1));
        else request.setAttribute("month", "Tháng " + month);
        if(year.equals("0")) request.setAttribute("year", "Tất cả năm");
        else request.setAttribute("year", "Năm " + year);
        request.setAttribute("nv", "của " + hoten);
        request.setAttribute("listNV", dao.getAllNV(2));
        request.setAttribute("listLuong", list);
        request.getRequestDispatcher("salary.jsp").forward(request, response); 
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
