package com.my.date;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import java.io.File;

@SpringBootApplication
@MapperScan("com.my.date.dao.map")
public class Application {
	@Value("${attachPath}") String attachPath;

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}

	@Bean
	public void run() throws Exception {
		String profilePath = attachPath + "/profileImage";
		String placePath = attachPath + "/placeImage";
		String reviewPath = attachPath + "/reviewImages";

		File file = new File(profilePath);
		if(!file.exists()) file.mkdirs();

		file = new File(placePath);
		if(!file.exists()) file.mkdirs();

		file = new File(reviewPath);
		if(!file.exists()) file.mkdirs();
	}
}
