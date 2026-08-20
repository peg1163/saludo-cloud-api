package com.peg1163.saludocloud;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

class SaludoControllerTests {

	private final SaludoController controller = new SaludoController("Estudiante de prueba");

	@Test
	void helloReturnsGreetingWithStudentName() {
		assertEquals("Hola, soy Estudiante de prueba", controller.hello());
	}

	@Test
	void healthReturnsOk() {
		assertEquals("OK", controller.health());
	}
}
