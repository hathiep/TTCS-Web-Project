/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.languageprocess;

import java.util.ArrayList;
import java.util.StringTokenizer;

/**
 *
 * @author havanthiep
 */
public class NLP {
    private String sentence;
    private ArrayList<String> list = new ArrayList<>();;

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

    
}
