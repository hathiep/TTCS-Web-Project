/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.languageprocess;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.StringTokenizer;
import java.util.TreeSet;

/**
 *
 * @author havanthiep
 */
public class NLP {
    private String sentence;
    private ArrayList<String> list = new ArrayList<>();
    private TreeSet<String> set = new TreeSet<>();

    public NLP() {
    }

    public NLP(String sentence) {
        this.sentence = sentence;
    }

    public ArrayList<String> getList() {
        StringTokenizer st = new StringTokenizer(sentence);
        while(st.hasMoreTokens()){
            String t = st.nextToken();
            list.add(t);
        }
        return list;
    }
    
    public HashMap<String, Integer> getMap() {
        
        HashMap<String, Integer> map = new LinkedHashMap<>();
        
        ArrayList<String> list2 = new ArrayList<>();
        for(String i : list){
            list2.add(i.toLowerCase());
        }

        for (String word : list2) {
            if (map.containsKey(word)) {
                map.put(word, map.get(word) + 1);
            } else {
                map.put(word, 1);
            }
        }

        return map;
    }

    
}
