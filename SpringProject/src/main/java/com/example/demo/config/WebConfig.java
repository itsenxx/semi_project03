package com.example.demo.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        /* '/resources/**' 로 호출되는 자원은 '/static/' 폴더 아래에서 찾는다 */
        registry.addResourceHandler("/resources/**") //호출되는 url path pattern
                .addResourceLocations("classpath:/static/") // 실제 resources 이 있는 위치
                .setCachePeriod(1)
                ;
    }
}
