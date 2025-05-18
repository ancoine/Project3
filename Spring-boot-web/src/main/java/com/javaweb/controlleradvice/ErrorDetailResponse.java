package com.javaweb.controlleradvice;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
public class ErrorDetailResponse {
    private String error;
    private String message;
    private int status;
    private String path;
    private LocalDateTime timestamp;

    public ErrorDetailResponse(int status, String error, String message, String path) {
        this.status = status;
        this.error = error;
        this.message = message;
        this.path = path;
        this.timestamp = LocalDateTime.now();
    }

}
