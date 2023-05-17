/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.languageprocess;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.StringTokenizer;

/**
 *
 * @author havanthiep
 */
public class NLP {

    private String sentence;
    private ArrayList<String> listWord = new ArrayList<>();
    private HashMap<String, Integer> mapWord = new LinkedHashMap<>();

    public NLP() {
    }

    public NLP(String sentence) {
        this.sentence = sentence;
    }

    public ArrayList<String> getListWord() {

        StringTokenizer st = new StringTokenizer(sentence, " \t\n\r\f,.;:?!*#@$%^&\"'-_()[]{}\\/");

        while (st.hasMoreTokens()) {
            String token = st.nextToken();
            listWord.add(token);
        }
        return listWord;
    }

    public HashMap<String, Integer> getMapWord() {

        ArrayList<String> list = new ArrayList<>();
        for (String i : listWord) {
            list.add(i.toLowerCase());
        }

        for (String word : list) {
            if (mapWord.containsKey(word)) {
                mapWord.put(word, mapWord.get(word) + 1);
            } else {
                mapWord.put(word, 1);
            }
        }

        return mapWord;
    }

}
