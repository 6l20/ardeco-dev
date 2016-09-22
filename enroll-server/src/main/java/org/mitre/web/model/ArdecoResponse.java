package org.mitre.web.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.experimental.Builder;

import java.util.List;

/**
 * @author Sylvain
 */
@Data
@Builder
@AllArgsConstructor
public class ArdecoResponse {
    public static final String RESULT_OK = "OK";
    public static final String RESULT_KO = "KO";

    public ArdecoResponse() {
    }

    private String result;
    private String label;
    private String exception;
    private String exceptionType;
    private List<String> additionalInfo;
}
