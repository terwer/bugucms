package com.terwergreen.bugucms.utils;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ImageUtils {
    /**
     * 匹配img标签
     */
    private static Pattern IMG_PATTERN = Pattern.compile("<img.*src\\s*=\\s*(.*?)[^>]*?>", Pattern.CASE_INSENSITIVE);
    /**
     * 匹配src
     */
    private static Pattern IMG_SRC_PATTERN = Pattern.compile("src\\s*=\\s*\"?(.*?)(\"|>|\\s+)");

    /**
     * 读取html中所有img标签的src值
     * @param htmlStr
     * @return
     */
    public static List<String> getImgSrc(String htmlStr) {
        String img = "";
        Matcher imgMatcher;
        List<String> pics = new ArrayList<String>();
        imgMatcher = IMG_PATTERN.matcher(htmlStr);
        while (imgMatcher.find()) {
            img = img + "," + imgMatcher.group();
            Matcher srcMatcher = IMG_SRC_PATTERN.matcher(img);
            while (srcMatcher.find()) {
                pics.add(srcMatcher.group(1));
            }
        }
        return pics;
    }
}
