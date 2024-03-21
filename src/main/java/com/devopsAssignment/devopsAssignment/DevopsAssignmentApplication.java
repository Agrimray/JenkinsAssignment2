package com.devopsAssignment.devopsAssignment;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
public class DevopsAssignmentApplication {

    public static void main(String[] args) {
        SpringApplication.run(DevopsAssignmentApplication.class, args);
    }

    @RestController
    public class HelloWorldController {
    
        @GetMapping("/")
        public String helloWorld() {
            return "Hello World!";
        }
    }
}
