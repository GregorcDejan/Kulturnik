<p align="center"><img src="http://torekobpetih.si/web/wp-content/uploads/2016/04/kulturnik-logo-1144x762.jpg" alt="Kult" title="Kulturnik" height="350"/></p>
>Projekt v sklopu predmeta Praktikum 1, FERI ITK UN 1. letnik






## O projektu
Glavni namen spletne strani Kultrunik, je prikaz različnih dogodkov v Sloveniji, ki so razdeljeni po
naslednjih tematskih sklopih:
* glasba
* gledališče
* razstave
* športni dogodki
* kino.

Podatke od dogodkih pridobivamo na dva načina. Prvi način je razčlenjevanje podatkov, ki jih dobimo s strani RSS virov :
* [Izbranih zadnjih 5 dogodkov](https://www.napovednik.com/spoznajte/izbordogodkov.php)
* [Dogodki iz evenitma](http://www.eventim.si/si/rss/)
* [Filmi iz Koloseja](https://www.kolosej.si/spored/xml/2.0/)

Drugi način pa je dodajanje dogodkov prijavljenih uporabnikov. Obvezni podatki za vse dogodke so naslednji: 
* naziv, 
* kraj
* datum
* ura
* izvajalec/nastopajoči
* dvorana/prostor
* cena 
* opis
* dogodek ima lahko tudi sliko. 
Vse dogodke, ki jih prikazuje stran Kulturnik.si, lahko tudi urejamo. Vse dogodke lahko spreminja zgolj administrator, ki ima za to dodeljene pravice, ostali uporabniki lahko spreminjano zgolj njihove dodane dogodke. Razlog za to je morebitna naknadna sprememba datuma dogodka, sprememba ure, dodajanje razširjenega opisa dogodka, slik ipd. Neregistrirani uporabnik lahko na spletni strani prosto brska med dogodki, ponujeno pa mu je tudi napredno iskanje s filtri. Na dnu strani pa je omogočen tudi izvoz dogodkov za naslednjih 14 dni v obliki XML. 


## Kompatibilnost

|       Java        | 
| ----------------- |
| `1.0`             | 
| `2.0`             | 




## Kazalo 
* [O projektu](#O-projektu)
* [Inštalacija in uporaba](#Inštalacija-in-uporaba)
* [Glavne funkcionalnosti](#Glavne-funkcionalnosti)
* [Dokumentaicja](#Dokumentacija)
* [Podatkovna baza](#Podatkovna-baza)
* [Avtorji](#Avtorji)
* [Zunanje knjižnice](#Zunanje-knjižnice)

## Inštalacija in uporaba







## Glavne funkcionalnosti
Glavne funkcionalnosti naše spletne strani so: 
* registracija novih uporabnikov (registriranim uporabnikom pa omogočamo dodajanje dogodkov)
* urejanje lastnega profila
* dodajanje dogodkov na spletno stran
* urejanje dogodkov, zato da ob morebitnih spremembah dogodkov, še zmeraj nudimo pravilne podatke  
* iskanje dogodkov:
	* glede na tematske sklope (glasba, gledališče, razstave, športni dogodki, kino)
	* po osnovnih filtrih (naziv, kraj)
	* po naprednih filtrih (datum pričetka dogodka, maksimalni cenovni rang)
* sortiranje dogodkov glede na ceno (najcenejše/najdražje) ali glede na abecedni vrstni red naziva
* zbranih zadnijh 5 dogodkov, ki so bili dodani v našo bazo
* prikazovanje vseh dogodkov na zemljevidu
* prikaz posameznega dogodka z natančno lokacijo v Google Maps (kar omogoča uporabnikom lažje iskanje prizorišča dogodka)
* zbiranje podatkov o dogodkih iz drugih virov
* izvoz podatkov o vseh dogodkih zbranih in dodanih na našo stran





## Dokumentacija







## Podatkovna baza

[Skripta za vspostavitev localhost/h2 podatkovne baze](Podatkovna-baza/skripta.sql)
[Skripta za vspostavitev localhost/h2 podatkovne baze](Kulturnik/skripta.sql)
[Skripta za vspostavitev localhost/h2 podatkovne baze](Kulturnik/Podatkovna-baza/skripta.sql)





## Avtorji
[<img alt="MerceneX" src="https://avatars2.githubusercontent.com/u/36963174?s=460&v=4" width="117">](https://github.com/MerceneX)|
[<img alt="marusakonecnik" src="https://avatars0.githubusercontent.com/u/33929107?s=460&v=4" width="117">](https://github.com/marusakonecnik) |
[<img alt="WiiTheThird" src="https://avatars3.githubusercontent.com/u/39158619?s=460&v=4" width="117">](https://github.com/WiiTheThird)|
[<img alt="KlicekNina" src="https://avatars0.githubusercontent.com/u/33865914?s=460&v=4" width="117">](https://github.com/KlicekNina)|
:---: |:---: |:---: |:---: |
[Marko Gluhak](https://github.com/MerceneX) |[Maruša Konečnik](https://github.com/marusakonecnik) |[Dejan Gregorc](https://github.com/WiiTheThird) |[Nina Kliček](https://github.com/KlicekNina) 



## Zunanje knjižnice

[Jdbc controller]()


