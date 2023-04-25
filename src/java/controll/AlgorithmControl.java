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
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedList;

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
    private static ArrayList<LinkedList<Integer>> canh = new ArrayList<LinkedList<Integer>>();
    private static boolean[] chuaxet = new boolean[10000];
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
                            if (!chuaxet[i] && i<trace.size())
                            {
                                    q.offer(i);
                                    trace.set(i, u);
                                    chuaxet[i] = true;
                            }
                    }
            }
    }
    private static String tim(int s, int e){
            if (trace.get(e) == 0){
                    return "Khong tim duoc duong di1";
            }
            ArrayList<Integer> res = new ArrayList<Integer>();
            while (e != s){
                    if (e == 0)
                    {
                            return "Khong tim duoc duong di2";
                    }
                    res.add(e);
                    e = trace.get(e);
            }
            res.add(e);
            Collections.reverse(res);
            String st = "" + str.charAt(res.get(0));
            for (int i = 1; i < res.size(); i++)
            {
                    st+="->"+str.charAt(res.get(i));
            }
            return st;
    }
    
    public static String SolveBFS(int n, int m, String start_node, String finish_node, String list_edge){
        int s=0, e=0, i;
        char X, Y, S, E;
        S = start_node.charAt(0);
        E = finish_node.charAt(0);
        canh.clear();
        trace.clear();
        for(i=0; i<=n; i++){
            LinkedList<Integer> q = new LinkedList<>();
            canh.add(q);
            q.offer(0);
            trace.add(0);
            chuaxet[i] = false;
        }
        int x = 0, y = 0, t = 0;
        while(m-->0){
            X = list_edge.charAt(t++);
            Y = list_edge.charAt(t++);
            int k=0;
            for(i=0; i<str.length(); i++){
                if(str.charAt(i)==X){
                    x = i;
                    k = 1;
                    break;
                }
            }
            if(k==0){
                str+= X;
                x=str.length()-1;
            }
            else k=0;
            for(i=0; i<str.length(); i++){
                if(str.charAt(i)==Y){
                    y = i;
                    k = 1;
                    break;
                }
                if(k==0){
                    str+= Y;
                    y=str.length()-1;
                }
                LinkedList<Integer> z = canh.get(x);
                z.offer(y);
                canh.set(x, z);
            }
        }
        for(i=0; i<str.length(); i++){
            if(str.charAt(i)==S) s=i;
            if(str.charAt(i)==E) e=i;
        }
        BFS(s);
        return tim(s, e);
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int n = Integer.parseInt(request.getParameter("num_node"));
        int m = Integer.parseInt(request.getParameter("num_edge"));
        String start_node = request.getParameter("start_node");
        String finish_node = request.getParameter("finish_node");
        String list_edge = request.getParameter("list_input_edge");

        String ans = SolveBFS(n, m, start_node, finish_node, list_edge);
        if(ans != null){
            request.setAttribute("ans", ans);
            request.getRequestDispatcher("algorithm.jsp").forward(request, response);
        }
        else{
            request.setAttribute("ans", "null");
            request.getRequestDispatcher("home.jsp").forward(request, response);
        }
        
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
