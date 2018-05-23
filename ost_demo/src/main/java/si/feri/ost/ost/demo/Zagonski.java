package si.feri.ost.ost.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import si.feri.ost.ost.demo.XMLParsing.XMLWebParsing;

@SpringBootApplication
public class Zagonski {

	//testSprememb
	//test2
	public static void main(String[] args) {
		new XMLWebParsing();
		SpringApplication.run(Zagonski.class, args);
	}
}
