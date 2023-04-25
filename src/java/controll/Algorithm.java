/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controll;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.*;

/**
 *
 * @author havanthiep
 */
@WebServlet(name="Algorithm", urlPatterns={"/algorithm"})
public class Algorithm extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    private static ArrayList<LinkedList<Integer>> canh = new ArrayList<LinkedList<Integer>>();
    private static boolean[] chuaxet = new boolean[1005];
    private static ArrayList<Integer> trace = new ArrayList<Integer>();
    private static String str = "";
    
    private static void BFS(int u){
            LinkedList<Integer> q = new LinkedList<Integer>();
            q.offer(u);
            chuaxet[u] = true;
            while (!q.isEmpty()){
                    u = q.peek();
                    q.poll();
                    for (int i : canh.get(u))
                    {
                            if (!chuaxet[i])
                            {
                                    q.offer(i);
                                    trace.set(i, u);
                                    chuaxet[i] = true;
                            }
                    }
            }
    }
    private static void tim(int s, int e){
            if (trace.get(e) == 0){
                    System.out.print("Khong tim duoc duong di1");
                    return;
            }
            ArrayList<Integer> res = new ArrayList<Integer>();
            while (e != s){
                    if (e == 0)
                    {
                            System.out.print("Khong tim duoc duong di2");
                            return;
                    }
                    res.add(e);
                    e = trace.get(e);
            }
            res.add(e);
            Collections.reverse(res);
            System.out.print(str.charAt(res.get(0)));
            for (int i = 1; i < res.size(); i++)
            {
                    System.out.print("->");
                    System.out.print(str.charAt(res.get(i)));
            }
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int n = Integer.parseInt(request.getParameter("num_node"));
        int m = Integer.parseInt(request.getParameter("num_edge"));
        String first_node = request.getParameter("first_node");
        String last_node = request.getParameter("last_node");
        int type_algorithm = Integer.parseInt(request.getParameter("type_algorithm"));
//        String list_edge = request.getParameter("input_all_edge");

        if(n!=4){
            request.setAttribute("list_ed", "So dinh sai");
        }
        request.setAttribute("ans", "Connected");
        request.getRequestDispatcher("algorithm.jsp").forward(request, response);
//        int s=0, e=0, i;
//        char X, Y, S, E;
//        S = first_node.charAt(0);
//        E = last_node.charAt(0);
//        for(i=0; i<=n; i++){
//            LinkedList<Integer> q = new LinkedList<>();
//            canh.add(q);
//            q.offer(0);
//            trace.add(0);
//            chuaxet[i] = false;
//        }
//        int x = 0, y = 0;
//        while(m-->0){
//            String edge = sc.nextLine();
//            X = edge.charAt(0);
//            Y = edge.charAt(2);
//            int k=0;
//            for(i=0; i<str.length(); i++){
//                if(str.charAt(i)==X){
//                    x = i;
//                    k = 1;
//                    break;
//                }
//            }
//            if(k==0){
//                str+= X;
//                x=str.length()-1;
//            }
//            else k=0;
//            for(i=0; i<str.length(); i++){
//                if(str.charAt(i)==Y){
//                    y = i;
//                    k = 1;
//                    break;
//                }
//                if(k==0){
//                    str+= Y;
//                    y=str.length()-1;
//                }
//                LinkedList<Integer> z = canh.get(x);
//                z.offer(y);
//                canh.set(x, z);
//            }
//            for(i=0; i<n; i++){
//                    if(str.charAt(i)==S) s=i;
//                    if(str.charAt(i)==E) e=i;
//            }
//            BFS(s);
//            tim(s, e);
//            System.out.println("");
//        }
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
//        int n = Integer.parseInt(request.getParameter("num_node"));
//        int m = Integer.parseInt(request.getParameter("num_edge"));
//        String first_node = request.getParameter("first_node");
//        String last_node = request.getParameter("last_node");
//        int type_algorithm = Integer.parseInt(request.getParameter("type_algorithm"));
//        String list_edge = request.getParameter("input_all_edge");
//
//        request.setAttribute("ans", list_edge);
//        request.getRequestDispatcher("algorithm.jsp").forward(request, response);
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
