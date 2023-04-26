/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controll.management;

import dao.NVDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Collections;
import java.util.List;
import model.NV;

/**
 *
 * @author havanthiep
 */
@WebServlet(name="ManagementServlet", urlPatterns={"/management"})
public class ManagementServlet extends HttpServlet {
   
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
        String info_sort = request.getParameter("info-sort");
        String rank_sort = request.getParameter("rank-sort");
        
        NVDAO dao = new NVDAO();
        List<NV> list = dao.getAllNV(); 
        
        String s = info_sort + "_sort" + rank_sort; 
        if(info_sort != null || rank_sort != null) list = sort_list(s, list);
        
        request.setAttribute("listNV", list);
        request.getRequestDispatcher("management.jsp").forward(request, response);
    }
    
    private static List<NV> sort_list(String s, List<NV> list){
        if(s.equals("id_sort1")){
            Collections.sort(list, NV.id_sort1);
            return list;
        }
        if(s.equals("id_sort2")){
            Collections.sort(list, NV.id_sort2);
            return list;
        }
        if(s.equals("hoten_sort1")){
            Collections.sort(list, NV.hoten_sort1);
            return list;
        }
        if(s.equals("hoten_sort2")){
            Collections.sort(list, NV.hoten_sort2);
            return list;
        }
        if(s.equals("ngaysinh_sort1")){
            Collections.sort(list, NV.ngaysinh_sort1);
            return list;
        }
        if(s.equals("ngaysinh_sort2")){
            Collections.sort(list, NV.ngaysinh_sort2);
            return list;
        }
        if(s.equals("chucvu_sort1")){
            Collections.sort(list, NV.chucvu_sort1);
            return list;
        }
        if(s.equals("chucvu_sort2")){
            Collections.sort(list, NV.chucvu_sort2);
            return list;
        }
        if(s.equals("mucluong_sort1")){
            Collections.sort(list, NV.mucluong_sort1);
            return list;
        }
        if(s.equals("mucluong_sort2")){
            Collections.sort(list, NV.mucluong_sort2);
            return list;
        }
        return list;
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
