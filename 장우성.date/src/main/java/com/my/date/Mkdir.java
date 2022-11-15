package com.my.date;

import org.springframework.beans.factory.annotation.Value;

import java.io.File;

public class Mkdir {
    @Value("${attachPath}") private String attachPath;

    public void mkdir(String path) {
        File folder = new File(path);

        if (!folder.exists()) {
            try {
                folder.mkdir();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
    public void setMkdir() {
        String profilePath = attachPath + "/profileImage";
        String placePath = attachPath + "/placeImage";
        String reviewPath = attachPath + "/reviewImages";

        mkdir(profilePath);
        mkdir(placePath);
        mkdir(reviewPath);
    }
}
