Uvod u R sintaksu i RStudio IDE
========================================================
author: Igor Hut
date: 24.10.2016.
autosize: true
transition: zoom



R kao kalkulator
========================================================

- U jednostavnom, konzolnom, rezimu primene R moze biti koriscen kao obican kalkulator


```r
# Sabiranje
5 + 5 
```

```
[1] 10
```

```r
# Oduzimanje
5 - 5 
```

```
[1] 0
```




R kao kalkulator (nastavak)
========================================================

```r
 # Deljenje
(5 + 5)/2 
```

```
[1] 5
```

```r
# Stepenovanje
2^5
```

```
[1] 32
```

```r
# Modulo
28%%6
```

```
[1] 4
```


Dodela vrednosti promenljivoj
========================================================



```r
x <- 10

x
```

```
[1] 10
```

```r
y <- 5

z <- x - y

z
```

```
[1] 5
```

Osnovni tipovi podataka u R-u
=======================================================

- **numeric** - decimalni brojevi, npr. `3.3`
- **integers** - celobrojne vrednosti (u principu `numeric`), npr. `4`
- **logical** - Boolean, `TRUE`, `FALSE`, `1`, `0`
- **character** - znakovna promenljiva, slovo, znak, string



Osnovni tipovi podatak u R-u (nastavak)
=======================================================


```r
# Answer to the Ultimate Question of Life, the Universe, and Everything
my_numeric <- 42

# Navodnici upucuju na tip "character"
my_character <- "cetrdesetdva"

# Deklarisanje logicke promenljive
my_logical <- FALSE
```

Kom tipu pripada data promenljiva?
========================================================

```r
# Provera tipa
class(my_numeric)
```

```
[1] "numeric"
```

```r
class(my_character)
```

```
[1] "character"
```

```r
class(my_logical)
```

```
[1] "logical"
```

Vektori
========================================================
type: sub-section


```r
numeric_vector <- c(1, 10, 49)
character_vector <- c("a", "b", "c")
boolean_vector <- c(TRUE, FALSE, TRUE)
```

Vektori - imenovanje clanova
=======================================================


```r
# Dobit na pokeru od ponedeljka do petka
poker_vector <- c(140, -50, 20, -120, 240)

# Dobit na ruletu od ponedeljka do petka
roulette_vector <- c(-24, -50, 100, -350, 10)

# Imenovanje - names
names(poker_vector) <- c("Ponedeljak", "Utorak", "Sreda", "Cetvrtak", "Petak")
names(roulette_vector) <- c("Ponedeljak", "Utorak", "Sreda", "Cetvrtak", "Petak")
```

Vektori - imenovanje clanova (nastavak)
======================================================

Alternativa:


```r
dani <- c("Ponedeljak", "Utorak", "Sreda", "Cetvrtak", "Petak")
names(poker_vector) <- dani
names(roulette_vector) <- dani
```
Vektori - imenovanje clanova (nastavak)
======================================================


```r
poker_vector
```

```
Ponedeljak     Utorak      Sreda   Cetvrtak      Petak 
       140        -50         20       -120        240 
```

```r
roulette_vector
```

```
Ponedeljak     Utorak      Sreda   Cetvrtak      Petak 
       -24        -50        100       -350         10 
```


Vektori - racunske operacije
====================================================


```r
A_vector <- c(1, 2, 3)
B_vector <- c(4, 5, 6)

# Zbir vektora 'A_vector' i 'B_vector'
total_vector <- A_vector+B_vector
  
# Prikazi 'total_vector' na konzoli 
total_vector
```

```
[1] 5 7 9
```
Vektori - racunske operacije
====================================================


```r
# Ukupan dobitak na pokeru
total_poker <- sum(poker_vector)

# Ukupan dobitak na ruletu
total_roulette <-sum(roulette_vector)

# Zajedno
total_week <- total_roulette+total_poker
```

Vektori - racunske operacije
====================================================


```r
total_poker
```

```
[1] 230
```

```r
total_roulette
```

```
[1] -314
```

```r
total_week
```

```
[1] -84
```

Vektori - poredjenje
===================================================


```r
total_poker > total_roulette
```

```
[1] TRUE
```

```r
total_poker < total_roulette
```

```
[1] FALSE
```

```r
total_poker == total_roulette
```

```
[1] FALSE
```

Vektori - selekcija
===================================================


```r
poker_sreda <- poker_vector["Sreda"]

poker_sreda
```

```
Sreda 
   20 
```

```r
poker_vector[3]
```

```
Sreda 
   20 
```

Vektori - selekcija (nastavak)
==================================================


```r
# Nov vektor selekcijom elemenata vec postojeceg

poker_ut_cet <- poker_vector[c(2,3,4)]

poker_ut_cet
```

```
  Utorak    Sreda Cetvrtak 
     -50       20     -120 
```

Vektori - selekcija (nastavak)
==================================================

```r
roulette_selection <- roulette_vector[2:5]

roulette_selection
```

```
  Utorak    Sreda Cetvrtak    Petak 
     -50      100     -350       10 
```

Vektori - selekcija poredjenjem
=================================================

Kojim danima si bio u plusu?


```r
poker_plus <- poker_vector > 0
poker_plus
```

```
Ponedeljak     Utorak      Sreda   Cetvrtak      Petak 
      TRUE      FALSE       TRUE      FALSE       TRUE 
```

```r
poker_dobri_dani <- poker_vector[poker_vector>0]
poker_dobri_dani
```

```
Ponedeljak      Sreda      Petak 
       140         20        240 
```

Vektori - selekcija poredjenjem (nastavak)
=================================================

Isto to za rulet (samo malo drugacije).


```r
selection_vector <- roulette_vector>0

roulette_dobri_dani <- roulette_vector[selection_vector]

roulette_dobri_dani
```

```
Sreda Petak 
  100    10 
```

Matrice u R-u
==================================================
type: sub-section

- Matrica, u R-u, je kolekcija elemenata koji pripadaju istom tipu podataka (numeric, character, ili logical)
- Rasporedjeni u odredjen broj vrsta i kolona
- Matrica se moze konstruisati koriscenjem `matrix()` funkcije:


```r
matrix(1:9, byrow = TRUE, nrow = 3)
```

```
     [,1] [,2] [,3]
[1,]    1    2    3
[2,]    4    5    6
[3,]    7    8    9
```

A sad malo igre sa matricama: Star Wars!
================================================

U narednih par vezbi cemo analizirati zaradu na blagajnama (box-office) za Star Wars fransizu.
Definisacemo tri vektora koji sadrze iznose sa zaradama na prva tri filma fransize (u 10^6 $). Prvi element svakog vektora se odnosi na US trziste a drugi na Non-US (izvor: Wikipedia).


```r
# Box-office Star Wars: u milionima US!
# Prvi element: US, drugi element: Non-US 
new_hope <- c(460.998, 314.4)

empire_strikes <- c(290.475, 247.900)

return_jedi <- c(309.306, 165.8)

# Konstruisemo matricu
star_wars_matrix <-matrix(c(new_hope, empire_strikes,return_jedi), byrow=TRUE, nrow=3)
```

=====================================================


```r
star_wars_matrix
```

```
        [,1]  [,2]
[1,] 460.998 314.4
[2,] 290.475 247.9
[3,] 309.306 165.8
```

**Ovo je prilicno sturo, ne bi bilo lose da imenujemo vrste i kolone..**

**Probajte ovo sami da uradite!**

Imenovanje vrsta i kolona matrice
====================================================


```r
colnames(star_wars_matrix)<-c("US","non-US")

rownames(star_wars_matrix)<-c("A New Hope",  "The Empire Strikes Back","Return of the Jedi")

star_wars_matrix
```

```
                             US non-US
A New Hope              460.998  314.4
The Empire Strikes Back 290.475  247.9
Return of the Jedi      309.306  165.8
```

Malo racunanja 
===================================================

Koliko je ukupno svaki od filmova zaradio na blagajnama, u celom svetu?


```r
worldwide_vector <- rowSums(star_wars_matrix)

worldwide_vector
```

```
             A New Hope The Empire Strikes Back      Return of the Jedi 
                775.398                 538.375                 475.106 
```

Dodavanje kolona matrici
=================================================

`big_matrix <- cbind(matrix1, matrix2, vector1 ...)`


```r
all_wars_matrix <- cbind(star_wars_matrix, worldwide_vector)

all_wars_matrix
```

```
                             US non-US worldwide_vector
A New Hope              460.998  314.4          775.398
The Empire Strikes Back 290.475  247.9          538.375
Return of the Jedi      309.306  165.8          475.106
```
**Obratite paznju da pridodata kolona nosi ime vektora!**


Dodavanje vrsta matrici
================================================

`rbind()`

Ukljucimo i preostala tri dela sage
===============================================


```r
box_office_all2 <- c(474.5, 552.5, 310.7, 338.7, 380.3, 468.5)

movie_names2 <- c("The Phantom Menace", "Attack of the Clones", "Revenge of the Sith")

star_wars_matrix2 <- matrix(box_office_all2, nrow = 3, byrow = TRUE)

rownames(star_wars_matrix2) <- c("The Phantom Menace", "Attack of the Clones", "Revenge of the Sith")

colnames(star_wars_matrix2) <- c("US", "non-US")
```

===================================================


```r
star_wars_matrix2
```

```
                        US non-US
The Phantom Menace   474.5  552.5
Attack of the Clones 310.7  338.7
Revenge of the Sith  380.3  468.5
```

Povezimo sve podatke u jednu veliku matricu
===================================================


```r
all_wars_matrix <- rbind(star_wars_matrix, star_wars_matrix2)

all_wars_matrix
```

```
                             US non-US
A New Hope              460.998  314.4
The Empire Strikes Back 290.475  247.9
Return of the Jedi      309.306  165.8
The Phantom Menace      474.500  552.5
Attack of the Clones    310.700  338.7
Revenge of the Sith     380.300  468.5
```

Sumiranje po vrstama i po kolonama
===================================================

- `colSums()`
- `rowSums()`


```r
ukupan_prihod_sve <- colSums(all_wars_matrix)

ukupan_prihod_sve
```

```
      US   non-US 
2226.279 2087.800 
```

Selekcija elemenata matrice
==================================================

- kao i kod vektora mozete koristi operator `[]`
- `moja_matrica[1,2]` - element iz prve vrste i druge kolone
- `moja_matrica[1:3, 2:5]` - od prve do trece vrste i od druge do pete kolone
- `moja_matrica[3, ]`- svi elementi iz trece vrste
- `moja_matrica[, 3]` - svi elementi iz trece kolone

Opet Star Wars
==================================================


```r
# Prosek non-US po filmu
non_us_prosek_sve  <-  mean(all_wars_matrix[, 2]) 
  
# Prosek non-US za prva dva filma
non_us_prosek_prva_dva <- mean(all_wars_matrix[1:2, 2])
```

==================================================


```r
non_us_prosek_sve
```

```
[1] 347.9667
```

```r
non_us_prosek_prva_dva
```

```
[1] 281.15
```

Aritmeticke operacije nad matricama
==================================================

- Standardni operatori: `+`,`-`, `*`, `/`,...
- Element-wise, npr. `2*moja_matrica`, mnozi svaki element matrice sa 2

**Primer**: ako je prosecna cena karte 4 dolara koliko je ukupno gledalaca gledalo filmove iz serijala Star Wars (u milionima).


```r
all_wars_matrix/5
```

```
                             US non-US
A New Hope              92.1996  62.88
The Empire Strikes Back 58.0950  49.58
Return of the Jedi      61.8612  33.16
The Phantom Menace      94.9000 110.50
Attack of the Clones    62.1400  67.74
Revenge of the Sith     76.0600  93.70
```


Aritmeticke operacije nad matricama (nastavak)
===================================================

- `moja_matrica_1 * moja_matrica_2` generise matricu u kojoj je svaki element proizvod korespodentnih elemenata prve i druge matrice.
- matricno mnozenje: `%*%`

**Primer**: Cene karata su se zapravo menjale tokom vremena. Izracunajmo ponovo prosecan broj gledala uzimajuci u obzir ovu cinjenicu. Prosecne cene karata su smestene u matrici `cene_karata`

====================================================


```r
# Prosecne cene karata
cene_karata <- matrix(c(2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7), nrow = 6, byrow = TRUE, dimnames = list(rownames(all_wars_matrix), colnames(all_wars_matrix))) 

# Procena broja posetioca 
posetioci <- all_wars_matrix/cene_karata

# Prosecan broj US posetioca 
prosek_us_posetioci <- mean(posetioci[,1])

# Prosecan broj non-US posetioca
prosek_non_us_posetioci <- mean(posetioci[,2])
```

==================================================


```r
# Procena broja posetioca
posetioci 
```

```
                               US    non-US
A New Hope              230.49900 157.20000
The Empire Strikes Back  96.82500  82.63333
Return of the Jedi       77.32650  41.45000
The Phantom Menace       94.90000 110.50000
Attack of the Clones     51.78333  56.45000
Revenge of the Sith      54.32857  66.92857
```

```r
# Prosecan broj US posetioca 
prosek_us_posetioci  
```

```
[1] 100.9437
```

```r
# Prosecan broj non-US posetioca
prosek_non_us_posetioci 
```

```
[1] 85.86032
```

Faktori
===================================================
type: sub-section

- Vrlo cesto, podaci pripadaju ogranicenom skupu kategorija
- Npr. ljudi mogu pripadati *zenskom* ili *muskom* rodu, shodno telesnoj masi ispitanici u nekoj studiji mogu biti podeljeni u kategorije *nedovoljna tel. masa*, *normalna tel. masa*, *prekomerna tel. masa* itd...
- Kategoricki podaci se u R-u predstavljaju tipom `factor`
- `factor` je izuzetno bitan tip promenljive u analizi podataka 


Faktori (2)
====================================================

- Za kreiranje faktora moze se koristiti funkcija `factor()`

**Primer:**

Formirajmo vektor `vektor_pol` koji ce sadrzati informaciju o polu pet osoba


```r
vektor_pol <- c("Muski", "Muski", "Zenski", "Muski", "Zenski")
```

Ocigledno, u ovom slucaju imamo dve kategorije, "Muski" i "Zenski". U zargonu R-a rekli bismo da imamo faktor sa dva nivoa vrednosti *"factor levels"*. Da bismo zaista i formirali vektor faktora primenimo funkciju `factor()`:


```r
vektor_pol_faktor <- factor(vektor_pol)
```

Faktori (3)
==================================================


```r
vektor_pol_faktor
```

```
[1] Muski  Muski  Zenski Muski  Zenski
Levels: Muski Zenski
```

Kao sto mozete videti ovaj `factor` vektor ima dva nivoa: "Muski" i "Zenski"

Faktori (4)
===================================================

- Dva tipa kategorickih promenljivih:
  - **Nominalne**
  - **Ordinalne**
- Nominalna kategoricka promenljiva ne implicira poredak, tj. ne moze se reci da neki njen nivo "vredi" vise od drugog.
  - Npr. `vektor_zivotinje` sadrzi kategorije "Slon", "Zirafa", "Konj", "Magarac", "Jez"
- Ordinalna kategoricka promenljiva upucuje na postojanje prirodnog poretka.
  - Npr. `vektor_temp`, koji sadrzi kategorije "Niska", "Srednja", "Visoka"

Faktori (5)
===================================================

```r
vektor_zivotinje <- c("Slon", "Zirafa", "Konj", "Magarac", "Jez")
vektor_temp <- c("Visoka", "Visoka", "Srednja", "Niska", "Srednja", "Visoka")
```

Faktori (6)
=====================================================


```r
vektor_zivotinje_factor <- factor(vektor_zivotinje)
vektor_zivotinje_factor
```

```
[1] Slon    Zirafa  Konj    Magarac Jez    
Levels: Jez Konj Magarac Slon Zirafa
```

```r
vektor_temp_factor <- factor(vektor_temp, order = TRUE, levels = c("Niska", "Srednja", "Visoka"))
vektor_temp_factor
```

```
[1] Visoka  Visoka  Srednja Niska   Srednja Visoka 
Levels: Niska < Srednja < Visoka
```

Faktori (7)
====================================================

- Kada uvezete set podataka (data set) na kojima cete raditi, on ce vrlo cesto sadrzati promenljive tipa `factor` sa razlicitim nivoima (`factor levels`). Da biste promenili nazive ovih nivoa, zbog jasnoce ili nekih drugih razloga, koristite funkciju `levels()`

`levels(factor_vector) <- c("name1", "name2",...)`

Faktori (8)
=====================================================
**Primer za vezbu:**
Dobili ste sirove podatke cije je poreklo izvezna anketa. Jedno od standardnih pitanja se odnosilo na pol ispitanika. Recimo da vektor koji sadrzi ove podatke izgleda ovako:

`pol <- c("Z", "Z", "M", "Z", "M","M","Z","M", "Z","Z","M")`

Zelite da zapocnete analizu podataka i bilo bi dobro da faktore slovne oznake "M" i "Z" prevedete u tip `factor` i preimenujete u  "Muski_pol" i "Zenski_pol" kako bi sve bilo jasno definisano. Ucinite ovo koristeci f-je `factor` i `levels()` kako biste dobili odgovarajuci vektor 'pol_factor'.

Faktori (9)
======================================================


```r
pol <- c("Z", "Z", "M", "Z", "M","M","Z","M", "Z","Z","M")

pol_factor <- factor(pol)
pol_factor
```

```
 [1] Z Z M Z M M Z M Z Z M
Levels: M Z
```

```r
levels(pol_factor) <- c("Muski_pol", "Zenski_pol") #redosled dodele je bitan za pravilno mapiranje
pol_factor
```

```
 [1] Zenski_pol Zenski_pol Muski_pol  Zenski_pol Muski_pol  Muski_pol 
 [7] Zenski_pol Muski_pol  Zenski_pol Zenski_pol Muski_pol 
Levels: Muski_pol Zenski_pol
```

Faktori - `summary()`
====================================================

Zanima vas koliko je muskih i zenskih ispitanika usectvivalo u anketi:


```r
summary(pol_factor)
```

```
 Muski_pol Zenski_pol 
         5          6 
```

Faktori - poredjenje (1)
===================================================


```r
zena <- pol_factor[1]
muskarac <- pol_factor[3]

zena
```

```
[1] Zenski_pol
Levels: Muski_pol Zenski_pol
```

```r
muskarac
```

```
[1] Muski_pol
Levels: Muski_pol Zenski_pol
```

Faktori - poredjenje (2)
===================================================


```r
#Bitka polova
zena > muskarac
```

```
[1] NA
```

```r
zena==muskarac
```

```
[1] FALSE
```
**Sa obzirom da su `muski_pol` i `zenski_pol` nominalne kategoricke promenljive njihovo poredjenje nema smisla!**

Faktori - poredjenje (3)
====================================================

**Primer - Poredjenje ordinalnih kategorickih promenljivih:**


```r
brzine <- c("sporo", "brzo", "super_brzo", "sporo", "brzo")

brzine_factor <- factor(brzine, ordered = TRUE, levels = c("sporo", "brzo", "super_brzo"))

summary(brzine_factor)
```

```
     sporo       brzo super_brzo 
         2          2          1 
```

```r
brzine_factor[2] > brzine_factor[1]
```

```
[1] TRUE
```

data frame
====================================================
type: sub-section

- Sta je `data frame`?
- Uredjena "tabela" podataka koji mogu biti razlicitog tipa.
- Kolone (stupci) - promenljive, vrste (redovi) - pojedinacne opservacije
- Osnovna struktura za smestanje, obradu i analizu podataka u R-u

data frame (2)
====================================================

- R poseduje ugradjenu bibloteku (*base package*) podataka
- Pozovite `library(help = "datasets")` da vidite koje sve setove podataka imate kao podrazumevanu opciju u okviru vase instalacije R-a
- Pozovite `mtcars` iz konzole - iako je u pitanju relativno mali set podataka ipak se ne moze u celosti prikazati u prozoru konzole.

head()
=====================================================


```r
head(mtcars)
```

```
                   mpg cyl disp  hp drat    wt  qsec vs am gear carb
Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1
```
**Ispisuje `header` i prvih nekoliko vrsta datog data frame-a.**

tail()
====================================================


```r
tail(mtcars)
```

```
                mpg cyl  disp  hp drat    wt qsec vs am gear carb
Porsche 914-2  26.0   4 120.3  91 4.43 2.140 16.7  0  1    5    2
Lotus Europa   30.4   4  95.1 113 3.77 1.513 16.9  1  1    5    2
Ford Pantera L 15.8   8 351.0 264 4.22 3.170 14.5  0  1    5    4
Ferrari Dino   19.7   6 145.0 175 3.62 2.770 15.5  0  1    5    6
Maserati Bora  15.0   8 301.0 335 3.54 3.570 14.6  0  1    5    8
Volvo 142E     21.4   4 121.0 109 4.11 2.780 18.6  1  1    4    2
```
**Ispisuje `header` i poslednjih nekoliko vrsta datog data frame-a.**

str()
====================================================


```r
str(mtcars)
```

```
'data.frame':	32 obs. of  11 variables:
 $ mpg : num  21 21 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 ...
 $ cyl : num  6 6 4 6 8 6 8 4 4 6 ...
 $ disp: num  160 160 108 258 360 ...
 $ hp  : num  110 110 93 110 175 105 245 62 95 123 ...
 $ drat: num  3.9 3.9 3.85 3.08 3.15 2.76 3.21 3.69 3.92 3.92 ...
 $ wt  : num  2.62 2.88 2.32 3.21 3.44 ...
 $ qsec: num  16.5 17 18.6 19.4 17 ...
 $ vs  : num  0 0 1 1 0 1 0 1 1 1 ...
 $ am  : num  1 1 1 0 0 0 0 0 0 0 ...
 $ gear: num  4 4 4 3 3 3 3 4 4 4 ...
 $ carb: num  4 4 1 1 2 1 4 2 2 4 ...
```
**Ispisuje strukturu i delimican sadrzaj datog data frame-a.**

Kreiranje data frame-a
====================================================

*Izvor podataka [Wikipedia](https://en.wikipedia.org/wiki/Planet)

```r
planets <- c("Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune");
type <- c("Terrestrial planet", "Terrestrial planet", "Terrestrial planet", "Terrestrial planet", "Gas giant", "Gas giant", "Gas giant", "Gas giant")
diameter <- c(0.382, 0.949, 1, 0.532, 11.209, 9.449, 4.007, 3.883); 
rotation <- c(58.64, -243.02, 1, 1.03, 0.41, 0.43, -0.72, 0.67);
rings <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE);

# Kreiramo data frame:
planets_df  <-data.frame(planets,type,diameter, rotation, rings)
```

Kreiranje data frame-a (nastavak)
====================================================


```r
head (planets_df, 5)
```

```
  planets               type diameter rotation rings
1 Mercury Terrestrial planet    0.382    58.64 FALSE
2   Venus Terrestrial planet    0.949  -243.02 FALSE
3   Earth Terrestrial planet    1.000     1.00 FALSE
4    Mars Terrestrial planet    0.532     1.03 FALSE
5 Jupiter          Gas giant   11.209     0.41  TRUE
```

- Proverite stukturu `planets_df` koristeci `str()`.
- Odredite medijanu za `diametar` i `rotation` (hint: mozete koristiti `summary()`).

Selekcija elemenata df-a
====================================================

- Slicno kao kod vektora i matrica moze se koristiti operator `[]`
- `my_df[1,2]` selektuje vrednost u prvoj vrsti i drugoj koloni data frame-a `my_df`.
- `my_df[1:3,2:4]` selektuje vrednosti u vrstama 1,2,3 i kolonama 2,3,4.
- Sta je rezultat naredbe `my_df[1, ]`?

**Vezba:**
Selektujte sve vrednosti u prve tri vrste `planets_df`. Selektujte vrednost koja odgovara precniku Merkura.

Selekcija elemenata df-a (nastavak)
==================================================

Selektujte i prikazite prvih 4 vrednosti u koloni "diameter" df-a `planets_df`


```r
planets_df[1:4, "diameter"]
```

```
[1] 0.382 0.949 1.000 0.532
```

Selekcija kolona df-a (promenljivih) koriscenjem specijalnog znaka `$`
======================================================================


```r
planets_df$diameter
```

```
[1]  0.382  0.949  1.000  0.532 11.209  9.449  4.007  3.883
```

```r
planets_df$rotation[1:5]
```

```
[1]   58.64 -243.02    1.00    1.03    0.41
```

Zadaci za vezbanje:
=====================================================================

1. Izracunaj i prikazi medijanu i srednju vrednost za precnike i periode rotacije svih planeta koristeci funkcije `median()` i `mean()`.
2. Ponovi isto za prve cetiri planete.
3. Izracunaj koliko planeta ima prsten koristeci funkciju `sum()`.
4. Selektuj sve podatke za planete koje nemaju prsten.

Selekcija elemenata df-a koriscenjem f-je subset()
====================================================================

- `subset(my_df, subset = some_condition)`

**Primer:** Selekcija podataka o svim planetama koje imaju prsten


```r
subset(planets_df, subset = rings)
```

```
  planets      type diameter rotation rings
5 Jupiter Gas giant   11.209     0.41  TRUE
6  Saturn Gas giant    9.449     0.43  TRUE
7  Uranus Gas giant    4.007    -0.72  TRUE
8 Neptune Gas giant    3.883     0.67  TRUE
```
**Vezba:** Selektuj podatke za sve planete koje imaju manji precnik od Zemlje.

Sortiranje elemenata df-a
==================================================================
- funkcija `order()` 
- za opadajuci redosled - argument `decreasing = TRUE`

```r
a <- c(3, 6, 1, 32, 5)

order(a)
```

```
[1] 3 1 5 2 4
```

```r
a[order(a)]
```

```
[1]  1  3  5  6 32
```

```r
a[order(a, decreasing = TRUE)]
```

```
[1] 32  6  5  3  1
```

Liste
==================================================================
type: sub-section

- Liste predstavljaju uredjenu kolekciju objekata (komponenata) koji mogu biti razlicitog tipa, npr. vektori, matrice, df-ovi ili pak druge liste.
- Objekti sadrzani u listi ne moraju imati nikakve medjusobne veze.
- `my_list <- list(comp1, comp2 ...)`

Liste - primer 1
==================================================================


```r
# Vektor - brojevi (numeric) od 1 do 10
my_vector <- 1:10 
# Matrica - numeric od 1 do 9
my_matrix <- matrix(1:9, ncol = 3)
# Prvih deset elemenata podrazumevanog df-a 'mtcars'
my_df <- mtcars[1:10,]

# Konstrukcija liste koja sadrzi sve ove objekte:
my_list <- list(my_vector, my_matrix, my_df)
```

Liste - primer 1 (nastavak)
================================================================


```r
str(my_list)
```

```
List of 3
 $ : int [1:10] 1 2 3 4 5 6 7 8 9 10
 $ : int [1:3, 1:3] 1 2 3 4 5 6 7 8 9
 $ :'data.frame':	10 obs. of  11 variables:
  ..$ mpg : num [1:10] 21 21 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2
  ..$ cyl : num [1:10] 6 6 4 6 8 6 8 4 4 6
  ..$ disp: num [1:10] 160 160 108 258 360 ...
  ..$ hp  : num [1:10] 110 110 93 110 175 105 245 62 95 123
  ..$ drat: num [1:10] 3.9 3.9 3.85 3.08 3.15 2.76 3.21 3.69 3.92 3.92
  ..$ wt  : num [1:10] 2.62 2.88 2.32 3.21 3.44 ...
  ..$ qsec: num [1:10] 16.5 17 18.6 19.4 17 ...
  ..$ vs  : num [1:10] 0 0 1 1 0 1 0 1 1 1
  ..$ am  : num [1:10] 1 1 1 0 0 0 0 0 0 0
  ..$ gear: num [1:10] 4 4 4 3 3 3 3 4 4 4
  ..$ carb: num [1:10] 4 4 1 1 2 1 4 2 2 4
```

Liste - imenovanje komponenti 
===============================================================

- Pri formiranju liste: `my_list <- list(name1 = comp1, name2 = comp2)`

- Ukoliko je lista vec formirana, komponente se mogu imenovati i naknadno koristeci f-ju `names()` analogno njenoj primeni koja je prikazana u slucaju vektora:
   
  `my_list <- list(comp1, comp2)`
  
  `names(my_list) <- c("name1", "name2")`
  
Liste - primer 2
===============================================================


```r
# Imenujemo elemente sadrzane u listi 'my_list':
my_list <- list(vec=my_vector,mat= my_matrix,df= my_df)

# Prikaz na konzoli:
my_list
```

```
$vec
 [1]  1  2  3  4  5  6  7  8  9 10

$mat
     [,1] [,2] [,3]
[1,]    1    4    7
[2,]    2    5    8
[3,]    3    6    9

$df
                   mpg cyl  disp  hp drat    wt  qsec vs am gear carb
Mazda RX4         21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
Mazda RX4 Wag     21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
Datsun 710        22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
Hornet 4 Drive    21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
Hornet Sportabout 18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
Valiant           18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
Duster 360        14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
Merc 240D         24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
Merc 230          22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
Merc 280          19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
```

Dodavanje elemenata postojecoj listi
==============================================================
- najjednostavnije je koristiti funkciju `c()`


```r
my_list <- c(my_list, df_iris = list(iris))
str(my_list)
```

```
List of 4
 $ vec    : int [1:10] 1 2 3 4 5 6 7 8 9 10
 $ mat    : int [1:3, 1:3] 1 2 3 4 5 6 7 8 9
 $ df     :'data.frame':	10 obs. of  11 variables:
  ..$ mpg : num [1:10] 21 21 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2
  ..$ cyl : num [1:10] 6 6 4 6 8 6 8 4 4 6
  ..$ disp: num [1:10] 160 160 108 258 360 ...
  ..$ hp  : num [1:10] 110 110 93 110 175 105 245 62 95 123
  ..$ drat: num [1:10] 3.9 3.9 3.85 3.08 3.15 2.76 3.21 3.69 3.92 3.92
  ..$ wt  : num [1:10] 2.62 2.88 2.32 3.21 3.44 ...
  ..$ qsec: num [1:10] 16.5 17 18.6 19.4 17 ...
  ..$ vs  : num [1:10] 0 0 1 1 0 1 0 1 1 1
  ..$ am  : num [1:10] 1 1 1 0 0 0 0 0 0 0
  ..$ gear: num [1:10] 4 4 4 3 3 3 3 4 4 4
  ..$ carb: num [1:10] 4 4 1 1 2 1 4 2 2 4
 $ df_iris:'data.frame':	150 obs. of  5 variables:
  ..$ Sepal.Length: num [1:150] 5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
  ..$ Sepal.Width : num [1:150] 3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
  ..$ Petal.Length: num [1:150] 1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
  ..$ Petal.Width : num [1:150] 0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
  ..$ Species     : Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...
```

Selekcija elemenata liste (1)
==============================================================


```r
my_list[1]
```

```
$vec
 [1]  1  2  3  4  5  6  7  8  9 10
```

```r
str(my_list[1])
```

```
List of 1
 $ vec: int [1:10] 1 2 3 4 5 6 7 8 9 10
```

```r
my_list[[1]]
```

```
 [1]  1  2  3  4  5  6  7  8  9 10
```

```r
str(my_list[[1]])
```

```
 int [1:10] 1 2 3 4 5 6 7 8 9 10
```

Selekcija elemenata liste (2)
=============================================================


```r
my_list$mat
```

```
     [,1] [,2] [,3]
[1,]    1    4    7
[2,]    2    5    8
[3,]    3    6    9
```

```r
my_list$mat[3, ]
```

```
[1] 3 6 9
```

```r
my_list[[2]][3, ]
```

```
[1] 3 6 9
```

```r
str(my_list$mat)
```

```
 int [1:3, 1:3] 1 2 3 4 5 6 7 8 9
```

Liste - vezba
============================================================

<<<<<<< HEAD
1. Selektuj element u trecoj vrsti i prvoj koloni elementa "mat" u listi `my_list`
2. Koje su minimalne, a koje maksimalne vrednosti za promenljive "Sepal.Length" i "Sepal.Width" iz elementa "df_iris" koji pripada listi `my_list`. 
3. Izdvoji podatke za vrstu irisa "setosa" iz elementa "df_iris" koji pripada listi `my_list`.

=======
>>>>>>> acd8ef1388a8c95f34778af134c3201334273ccb
Literatura
==================================================
type: sub-section

![R Programming for Data Science](hero.png)
***
## R Programming for Data Science
Roger D. Peng



<https://leanpub.com/rprogramming>

On-line resursi
================================================
type: sub-section

- <https://www.r-project.org/>
- The Comprehensive R Archive Network <https://cran.r-project.org/>
- stack overflow <http://stackoverflow.com/>
- R bloggers <https://www.r-bloggers.com/>
- RStudio <https://www.rstudio.com/>
- RStudio cheatsheets <https://www.rstudio.com/resources/cheatsheets/>
- ...









