package com.javaweb.enums;

import java.util.HashMap;
import java.util.Map;

public enum District {
    QUAN_1("Quận 1"),
    QUAN_2("Quận 2"),
    QUAN_3("Quận 3"),
    QUAN_10("Quận 10"),
    QUAN_BINH_THANH("Quận Bình Thạnh"),
    QUAN_4("Quận 4"),
    QUAN_THU_DUC("Quận Thủ Đức");
    private final String districtName;
    District(String districtName) {
        this.districtName = districtName;
    }
    private static final Map<String, String> districtMap = new HashMap<>();
    static {
        for (District district : District.values()) {
            // district.name() chính là "QUAN_1", "QUAN_2"...
            districtMap.put(district.name(), district.districtName);
        }
    }
    public static String getNameByCode(String code) {
        return districtMap.getOrDefault(code, code);
    }
    public static Map<String, String> type() {
        return  districtMap;
    }
}
