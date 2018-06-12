package si.feri.ost.ost.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import si.feri.ost.ost.demo.XMLParsing.XMLWebParsing;
import si.feri.ost.ost.demo.controller.KontrolerBaze;

/**
 * Zagonska koda, ki požene celotno aplikacijo
 * Razred Zagonski
 */
@SpringBootApplication
public class Zagonski {

	//testSprememb
	//test2

	/**
	 * Metoda main(String[]args)
	 * Glavna metoda za zagon
	 * @param args
	 */
	public static void main(String[] args) {

		SpringApplication.run(Zagonski.class, args);
		new KontrolerBaze();
	}
}
