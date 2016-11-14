install.packages("faraway")
#poziva se samo jednom


library(faraway)
#poziva se svaki put kada se pokrece RStudio


#UVOD-ANALIZA BAZE PODATAKA:


data(pima)
pima
head(pima)
summary(pima)
#u summary trazimo nepravilnosti i generalni opis podataka
#kolona diastolic oznacava krvni pritisak, ne bi smeo nikad da je nula => greska je u unesenim podacima

pima$diastolic
sort(pima$diastolic)

#slicno nula ne bi smeli da budu glucose, insulin, bmi,..
#svuda gde je nula stavljamo NA vrednosti

pima$diastolic[pima$diastolic == 0]  <- NA
pima$glucose[pima$glucose == 0] <- NA
pima$triceps[pima$triceps == 0]  <- NA
pima$insulin[pima$insulin == 0] <- NA
pima$bmi[pima$bmi == 0] <- NA

#kolona test uzima vrednosti 0 ili 1 u zavisnosti od toga da li ima dijabetes ili ne
#takve promenljive su kategoricke
#one se u R-u predstavljaju kao faktori
#ovde kolona test nije tretirana kao kategoricka,a trebalo bi
#zato sami pravimo faktor:

pima$test <- factor(pima$test)
summary(pima$test)

levels(pima$test) <- c("negative","positive")

summary(pima)


#ispitivanje podataka pomocu grafickog predstavljanja:
#npr histogram za jednu od kolona:
hist(pima$diastolic)

#uzoracka "gustina":
plot(density(pima$diastolic,na.rm=TRUE))

#plotovanje sortiranih podataka:dobro za autlajere, proveru diskretnosti/neprekidnosti,...
plot(sort(pima$diastolic),pch=".")

#plotovanje zavisnosti izmedju promenljivih:
plot(diabetes ~ diastolic,pima)

#kada plotujemo zavisnost neprekidne od kategoricke promenljive, dobiju se boxplotovi:
plot(diabetes ~ test,pima)

#zavisnost svake dve kolone:
pairs(pima)




#linearni model koristimo: 
#kada u bazi imamo jednu kolonu koju hocemo da ocenimo pomocu ostalih, radi predvidjanja ili samo utvrdjivanja veze izmedju njih
#ta jedna je Y - response - ona je uvek neprekidna
#ove kojima predvidjamo su X - prediktori, mogu biti bilo kakve
#gledamo da ih bude sto manje, a da greska bude minimalna moguca 



#LINEARNI MODEL - OCENA PARAMETARA


#library(faraway)
#podaci o ostrvima Galapagos:
data(gala)
gala
head(gala)

#da vidimo imena kolona:
names(gala)
#detaljnije:
help(gala)

#X-evi i Y:
x <- model.matrix( ~ Area + Elevation + Nearest + Scruz + Adjacent,gala)
y <- gala$Species

#racunamo peske sve sto treba za model:
M <- solve(t(x) %*% x)
#ocena za beta:
b<- M%*% t(x) %*% y

#moze i: b<-solve(crossprod(x,x),crossprod(x,y))

n<-length(y)
dimV<-5
teta<-x%*%b
sigma2<-crossprod(y-teta,y-teta)/(n-dimV)
sigma<-sqrt(sigma2)

#ako koristimo gotov algoritam za linearni model (preporucljivo):

mdl <- lm(Species ~ Area + Elevation + Nearest + Scruz + Adjacent, data=gala)

#glavno u modelu se vidi sa:
summary(mdl)
#ali to nije sve
#da vidimo sve komponente modela koje mozemo pozvati:
names(mdl)
mdls <- summary(mdl)
names(mdls)

#osnovno u modelu:
mdl$residuals#reziduali
mdl$fitted #teta
teta
mdl$df.residual#broj stepeni slobodeone hi kvadrat raspodele raziduala
mdl$coef#ovo je b, vidimo da je isto kao i ovo dobijeno formulom
b

#suma kvadrata odstupanja:
deviance(mdl)
#odavde je:
s<-sqrt(deviance(mdl)/df.residual(mdl))
#isto se dobija sa:
mdls$sigma

#treba s=sigma, ovde je priblizno


#koliko je tacan model, meri se sa R^2:

#peske:
r2<-1- deviance(mdl)/sum((y-mean(y))^2)
r2
#isto to preko modela:
mdls$r.squared


#kada u X postoje linearno zavisne kolone, ne moze se dobiti ocena za beta:

#na primer, pravimo linearno zavisnu:
gala$kol1 <- gala$Area -gala$Adjacent

#i dodajemo je u model:
g <- lm(Species ~ Area+Elevation+Nearest+Scruz+Adjacent+kol1,gala)

summary(g)
#vidimo da je iz modela iskljucena jedna kolona, dok nisu ostale samo linearno nezavisne (po defaultu se iskljucuju od poslednje dodate pa nadalje)

#veci problem ako je X'X skoro singularna, i nije ocigledno da su kolone zavisne
#npr:
#dodajemo na kol1 malu slucajnu komponentu, da bude skoro pa lin.zavisna:
kol2 <- gala$kol1+0.001*(runif(30)-0.5)

#model sa ovim:
g <- lm(Species ~ Area+Elevation+Nearest+Scruz+Adjacent+kol2,gala)
summary(g)
#model ce biti napravljen, ali sa neprirodno velikim koeficijentima i greskama




#PRIMER: baza teengamb, napraviti model za kolonu 'gamble' u odnosu na ostalekolone , naci korelaciju reziduala i ocena za gamble, korelaciju reziduala i kolone income
#odrediti, kada bi sve ostalo bilo konstantno, koliko bi se kockanje razlikovalo za zenu i muskarca?

data(teengamb)
help(teengamb)

model<-lm(gamble~sex+status+income+verbal,data=teengamb)
summary(model)

#korelacija treba da je oko nula:
cor(residuals(model),fitted(model))

#i ova isto:
cor(residuals(model),teengamb$income)

summary(model)
#iz summary, iz koeficijenta uz kolonu 'sex'(koja uzima vrednosti 0 ili 1) vidimo da bi muskarac u proseku trosio 22 funte vise godisnje na kockanje

