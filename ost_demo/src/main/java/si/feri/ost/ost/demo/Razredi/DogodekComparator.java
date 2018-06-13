package si.feri.ost.ost.demo.Razredi;

import java.util.Comparator;

public class DogodekComparator implements Comparator<Dogodek> {
    /**
     * Atributi
     */
    boolean primerjavaCene;
    boolean najcenejsiNajprej;

    /**
     * privzeti konstruktor
     */
    public DogodekComparator() {
    }

    /**
     * konstruktor z enim parametrom
     * @param najcenejsiNajprej
     */
    public DogodekComparator(boolean najcenejsiNajprej) {
        this.najcenejsiNajprej = najcenejsiNajprej;
    }

    /**
     * Konstruktor z obema parametroma
     * @param primerjavaCene
     * @param najcenejsiNajprej
     */
    public DogodekComparator(boolean primerjavaCene, boolean najcenejsiNajprej) {
        this.primerjavaCene = primerjavaCene;
        this.najcenejsiNajprej = najcenejsiNajprej;

    }

    /**
     * preobložena metodo compare
     * @param d1
     * @param d2
     * @return
     */
    @Override
    public int compare(Dogodek d1, Dogodek d2) {

        double cena1 = Double.parseDouble(d1.getCena());
        double cena2 = Double.parseDouble(d2.getCena());


        if (primerjavaCene) {
            if (najcenejsiNajprej) {
                if ((cena1 == cena2))
                    return 0;

                else if (cena1 < cena2)
                    return -1;

                else
                    return 1;
            } else {

                if ((cena1 == cena2))
                    return 0;

                else if (cena1 < cena2)
                    return 1;

                else
                    return -1;

            }
        } else {
            return (d1.getNaziv().compareTo(d2.getNaziv()));


        }


    }
}
