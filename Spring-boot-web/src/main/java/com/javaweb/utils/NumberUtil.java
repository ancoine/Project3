package com.javaweb.utils;

public class NumberUtil {
    public static boolean checkNumber(Object value) {
        try {
            Long number = Long.parseLong(value.toString());
        }
        catch(Exception e) {
            return false;
        }
        return true;
    }
}
