package si.feri.ost.ost.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import si.feri.ost.ost.demo.XMLParsing.XMLWebParsing;
import si.feri.ost.ost.demo.controller.KontrolerBaze;

@SpringBootApplication
public class Zagonski {

	//testSprememb
	//test2
	public static void main(String[] args) {

		SpringApplication.run(Zagonski.class, args);
		new KontrolerBaze();
	}
}
