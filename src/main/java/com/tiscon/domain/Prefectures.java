package com.tiscon.domain;

import java.util.ArrayList;
import java.util.List;

public class Prefectures extends ArrayList<Prefecture>{

    public Prefectures(List<Prefecture> prefectureList) {
        super(prefectureList);
    }


    public String findPrefectureName(String prefectureId) {
        return stream().filter(prefecture -> prefecture.getPrefectureId().equals(prefectureId))
            .findFirst()
            .orElseThrow()
            .getPrefectureName();
    }
}
