package si.feri.ost.ost.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import si.feri.ost.ost.demo.XMLParsing.XMLParser;

@SpringBootApplication
public class Zagonski {

	public static void main(String[] args) {
		new XMLParser();
		SpringApplication.run(Zagonski.class, args);
	}
}
