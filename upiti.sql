<--UPITI-->

<---Datum--->
SELECT Klijenti.Ime_klijenta, Klijent.Prezime_klijenta, Klijent.OIB_Klijenta, Nalog.Datum_vrsta_dan, Kvar.Naziv_kvara, Radnik.Ime_radnika
FROM radionica.Radnik INNER JOIN (radionica.Kvar INNER JOIN (radionica.Klijent INNER JOIN radionica.Nalog ON Klijent.ID = Nalog.ID_klijenta) ON Kvar.ID = Nalog.ID_kvara) ON Radnik.ID = Nalog.ID_radnika
WHERE (((radionica.Nalog.Datum_vrsta_dan)=[Datum popravka]));


<---Klijenti--->
SELECT Ime_klijenta, Prezime_klijenta, PostBroj_mjesta, Naziv_mjesta, Naziv_zupanije
FROM radionica.zupanija INNER JOIN (radionica.Mjesto_id= radionica.Klijent ON Mjesto.ID = Klijent.Mjesto_ID) ON zupanija.ID = Mjesto.Zupanija_ID;

SELECT Ime_klijenta ,Prezime_klijenta , PostBroj_mjesta, Naziv_mjesta , Naziv_zupanija
FROM zupanija INNER JOIN ( mjesto INNER JOIN Klijent on Mjesto_ID = Mjesto_id) on Zupanija_ID = Zupanija_ID; 

<---Popravljeno--->
SELECT Klijent.Ime_klijenta, Klijent.Prezime_klijenta, Nalog.Popravljeno, Kvar.Naziv_kvara, Radnik.Ime_radnika
FROM Radnik INNER JOIN (Kvar INNER JOIN (Klijent INNER JOIN Nalog ON Klijent.ID = Nalog.ID_klijenta) ON Kvar.ID = Nalog.ID_kvara) ON Radnik.ID = Nalog.ID_radnika
WHERE (((Nalog.Popravljeno)=Yes));


<---Prosjecni popravci po odjelima--->
SELECT Kvar.Naziv_kvara, Odjel.Naziv_odjela, Kvar.Sifra_kvara, Count(Kvar.ID) AS Broj_popravaka
FROM (Odjel INNER JOIN Kvar ON Odjel.ID = Kvar.Sifra_odjela) INNER JOIN Nalog ON Kvar.ID = Nalog.ID_kvara
GROUP BY Kvar.Naziv_kvara, Odjel.Naziv_odjela, Kvar.Sifra_kvara, Nalog.ID_kvara;


<---Radnici--->
SELECT Ime_radnika, Prezime_radnika, Placa, Naziv_mjesta, Naziv_odjela
FROM radionica.Odjel INNER JOIN (radionica.Mjesto INNER JOIN radionica.Radnik ON Mjesto.ID = Mjesto_ID ) ON Odjel.ID = Sifra_odjela;



SELECT Ime_radnika, Prezime_radnika, Placa, Naziv_mjesta, Naziv_odjela
FROM radionica.Odjel INNER JOIN radionica.Mjesto INNER JOIN radionica.Radnik ON Mjesto.ID = Mjesto.ID  ON Odjel.ID = Sifra_odjela
