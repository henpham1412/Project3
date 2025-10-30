package com.javaweb.enums;

import java.util.HashMap;
import java.util.Map;

public enum District {
    QUAN_1("QUẬN 1"),
    QUAN_2("QUẬN 2"),
    QUAN_3("QUẬN 3"),
    QUAN_10("QUẬN 10"),
    QUAN_BINH_THANH("QUẬN BÌNH THẠNH"),
    QUAN_4("QUẬN 4");
    private final String districtName;
    District(String districtName) {
        this.districtName = districtName;
    }
    public static Map<String, String> type(){
        Map<String, String> districts = new HashMap<>();
        for (District district : District.values()){
            districts.put(district.toString(), district.districtName);
        }
        return districts;
    }
}
