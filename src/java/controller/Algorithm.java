///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
// */
//
//package controller;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import java.util.*;
//
///**
// *
// * @author havanthiep
// */
//@WebServlet(name="Algorithm", urlPatterns={"/algorithm"})
//public class Algorithm extends HttpServlet {
//   
//    /** 
//     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//    throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        int n = Integer.parseInt(request.getParameter("num_node"));
//        int m = Integer.parseInt(request.getParameter("num_edge"));
//        String first_node = request.getParameter("first_node");
//        String last_node = request.getParameter("last_node");
//        int type_algorithm = Integer.parseInt(request.getParameter("type_algorithm"));
//        String all_edge = request.getParameter("all_edge");
//
//        int  x = 0, y = 0, s = 0, e = 0;
//        char X, Y, S, E;
//        S = first_node.charAt(0);
//        E = last_node.charAt(0);
//        for (int i = 1; i <= n; ++i){
//            canh.get(i).clear();
//            trace.set(i, 0);
//            chuaxet[i] = false;
//        }
//        String[] a = all_edge.split("\n");
//        String alledge = String.join("", a);
//        TreeSet<Character> tree = new TreeSet<>();
//        for(int i = 0; i < alledge.length(); i++){
//            tree.add(alledge.charAt(i));
//        }
//        str = tree.toString();
//        for(int i = 0; i < n; i++){
//            if(str.charAt(i) == S) s = i;
//            if(str.charAt(i) == E) e = i;
//        }
//        for(int t = 0; t < 2*m; t+=2){
//            for (int i = 0; i < str.length(); i++){
//                if (str.charAt(i) == alledge.charAt(t)){
//                    x = i;
//                }
//                if (str.charAt(i) == alledge.charAt(t+1)){
//                    y = i;
//                }
//            }
//            canh.get(x).add(y);
//        }
//        BFS(s);
//        if (trace.get(e) == 0){
//            request.setAttribute("ans", "Không tìm được đường đi!");
//        }
//        ArrayList<Integer> res = new ArrayList<Integer>();
//        while (e != s){
//            if (e == 0){
//                request.setAttribute("ans", "Không tìm được đường đi!");
//            }
//            res.add(e);
//            e = trace.get(e);
//        }
//        res.add(e);
//        Collections.reverse(res);
//        String ans = "" + str.charAt(res.get(0));
//        for (int i = 1; i < res.size(); i++){
//            ans+= "->";
//            ans+= str.charAt(res.get(i));
//        }
//        request.setAttribute("ans", ans);
//    }
//    
//    private ArrayList<ArrayList<Integer>> canh = new ArrayList<ArrayList<Integer>>();
//    private boolean[] chuaxet = new boolean[1005];
//    private ArrayList<Integer> trace = new ArrayList<Integer>();
//    private String str = "";
//    private void BFS(int u){
//            LinkedList<Integer> q = new LinkedList<Integer>();
//            q.offer(u);
//            chuaxet[u] = true;
//            while (!q.isEmpty()){
//                u = q.peek();
//                    q.poll();
//                    for (int i : canh.get(u)){
//                            if (!chuaxet[i]){
//                                    q.offer(i);
//                                    trace.set(i, u);
//                                    chuaxet[i] = true;
//                            }
//                    }
//            }
//    }
//}
//
//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /** 
//     * Handles the HTTP <code>GET</code> method.
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//    throws ServletException, IOException {
//        processRequest(request, response);
//    } 
//
//    /** 
//     * Handles the HTTP <code>POST</code> method.
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//    throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /** 
//     * Returns a short description of the servlet.
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}
