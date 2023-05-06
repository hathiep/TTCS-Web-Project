/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.algorithm;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedList;

/**
 *
 * @author havanthiep
 */
public class BFSVoHuong {
    private static ArrayList<LinkedList<Integer>> canh = new ArrayList<LinkedList<Integer>>();
    private static boolean[] chuaxet = new boolean[10000];
    private static ArrayList<Integer> trace = new ArrayList<Integer>();
    private static String str = "";
    private int n, m;
    private String start_node, finish_node, list_edge;
    
    private static void BFS(int u){
        LinkedList<Integer> q = new LinkedList<Integer>();
        q.offer(u);
        chuaxet[u] = true;
        while (!q.isEmpty()){
            u = q.peek();
            q.poll();
            for (int i : canh.get(u)){
                if (!chuaxet[i]){
                    q.offer(i);
                    trace.set(i, u);
                    chuaxet[i] = true;
                }
            }
        }
    }
    private static String tim(int s, int e){
        int k = 0;
        ArrayList<Integer> res = new ArrayList<Integer>();
        while (e != s){
            if (e == 0){
                return "Không tìm được đường đi";
            }
            res.add(e);
            e = trace.get(e);
        }
        res.add(e);
        Collections.reverse(res);
        String st = "" + str.charAt(res.get(0));
        for (int i = 1; i < res.size(); i++){
            st+="->"+str.charAt(res.get(i));
            k = 1;
        }
        if(k==1) return st;
        if (trace.get(e) == 0){
            return "Không tìm được đường đi";
        }
        return st;
    }

    public BFSVoHuong(int n, int m, String start_node, String finish_node, String list_edge) {
        this.n = n;
        this.m = m;
        this.start_node = start_node;
        this.finish_node = finish_node;
        this.list_edge = list_edge;
    }
    
    
    public String Solve(){
        int s=0, e=0;
        char X, Y, S, E;
        S = start_node.charAt(0);
        E = finish_node.charAt(0);
        canh.clear();
        trace.clear();
        for(int i=0; i<=n; i++){
            LinkedList<Integer> q = new LinkedList<>();
            canh.add(q);
            q.offer(0);
            trace.add(0);
            chuaxet[i] = false;
        }
        int x = 0, y = 0;
        str = "" + list_edge.charAt(0);
        for(int i=1; i<list_edge.length(); i++){
            int k = 0;
            for(int j=0; j<str.length(); j++){
                if(str.charAt(j) == list_edge.charAt(i)){
                    k = 1;
                    break;
                }
            }
            if(k == 0){
                str+= list_edge.charAt(i);
            }
        }
        for(int i=0; i<2*m; i+=2){
            for(int j=0; j<str.length(); j++){
                if(str.charAt(j)==list_edge.charAt(i)){
                    x = j;
                    break;
                }
            }
            for(int j=0; j<str.length(); j++){
                if(str.charAt(j) == list_edge.charAt(i+1)){
                    y = j;
                    break;
                }
            }
            LinkedList<Integer> z = canh.get(x);
            LinkedList<Integer> t = canh.get(y);
            z.offer(y);
            t.offer(x);
            canh.set(x, z);
            canh.set(y, t);
        }
        for(int i=0; i<str.length(); i++){
            if(str.charAt(i)==S) s=i;
            if(str.charAt(i)==E) e=i;
        }
        BFS(s);
        return tim(s, e);
    }

}
