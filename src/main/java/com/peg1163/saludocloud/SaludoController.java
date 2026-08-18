package com.peg1163.saludocloud;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SaludoController {

	private final String studentName;

	public SaludoController(@Value("${app.student-name}") String studentName) {
		this.studentName = studentName;
	}

	@GetMapping("/hello")
	public String hello() {
		return "Hola, soy " + studentName;
	}

	@GetMapping("/health")
	public String health() {
		return "OK";
	}
}
