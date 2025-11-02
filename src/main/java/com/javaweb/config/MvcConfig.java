package com.javaweb.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MvcConfig implements WebMvcConfigurer {

    // SỬA DÒNG NÀY:
    // Thêm tiền tố "file:///" và dùng dấu gạch chéo xuôi
    private static final String UPLOAD_DIR = "file:///D:/spring/Project-spring-boot-web/images/";

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // Giữ nguyên: Khi web gọi /images/**
        registry.addResourceHandler("/images/**")
                // Spring sẽ tìm file trong thư mục này
                .addResourceLocations(UPLOAD_DIR);
    }
}
