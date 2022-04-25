Dieses Projekt enthält eine LaTeX documentclass sowie ein Beispieldokument zur Erstellung von Praxisphasenberichten im Rahmen der THM und StudiumPlus.

Als Vorlage wurden die Formatvorgaben aus dem Dokument "Richtlinien zum Wissenschaftlichen Arbeiten" (Stand Okt. 2019) benutzt.

Diese Vorlage ist eine Erweiterung von: [github.com/jnnks/thmreport](https://github.com/jnnks/thmreport)

[Bilder folgen hier]


# Erste Schritte
## Installation
Da das Paket nicht auf LaTeX Distributionen verfügbar ist, ist das Klonen des Repositories die bevorzugte Lösung.

`git clone git@github.com:leonknauf/thmreport.git`

Alternativ kann auch die Template-Funktion von GitHub genutzt werden und so der Inhalt dieses Repositories in ein eigenes kopiert werden.

## Erstellung eines Berichts
Das Template kann entsprechend angepasst werden und mit den eigenen Daten ausgefüllt werden.

# Features
Das Template existiert, um die Erstellung des Berichts einfacher zu gestalten. Viele Kleinigkeiten, die per Hand gemacht werden müssten, sind bereits eingerichtet.

## Maße
Die vorgegebenen Abstände entsprechen den offiziellen Vorgaben der THM/StudimPlus. Falls keine genauen Vorgaben gemacht werden, wurde das Dokument "Richtlinie Wissenschaftliches Arbeiten" selbst als Vorlage verwendet.

## Firmenlogo
Es besteht die Möglichkeit ein Firmenlogo einzubinden. Dieses wird auf jeder Seite oben rechts erscheinen. Auf der Titelseite ist es unten rechts zu finden. Es sollten im besten Fall ähnliche Maße wie das Beispielbild aufweisen.

## Literaturverzeichnis
Zum Einsatz kommt biber/biblatex. Das ist ein Paket, welches in allen modernen TeX Installationen vorhanden ist, bzw. installiert werden kann. 
Das Literaturverzeichnis wird nach Vorgabe am Ende des Dokumentes eingefügt und Zitate werden mit Verweis zum Literaturverzeichnis versehen (üblich im technischen Bereich).

## Zitieren
Zum Zitieren reicht es aus, `\cite{QUELLE}` zu nutzen.

## Abkürzungsverzeichnis
Ein Abkürzungsverzeichnis kann automatisch eingebunden werden.

## Sperrvermerk
Ein beispielhafter Sperrvermerk ist bereits vorhanden und kann bei Bedarf genutzt werden.

## Abstract
Es besteht die Möglichkeit am Anfang des Dokumentes ein Abstract einzufügen. Dieses taucht nicht im Inhaltsverzeichnis auf.

## Eidesstattliche Erklärung / Versicherung
Eine beispielhafte Versicherung ist bereits vorhanden und kann bei Bedarf genutzt werden.

## Anhang
In der Datei `appendix.tex` wird der Anhang definiert. Ein neuer Anhang kann jeweils mittels `\anhang{Name des Anhangs}` definiert werden. 

# Anpassung und Erweiterung
## Parameter zum Personalisieren
Die documentclass enthält Variablen, die nicht als Parameter repräsentiert sind. Dafür werden Befehle verwendet, die sich wie globale Variablen verhalten.

### Erforderliche Parameter
* `MyType` [bachelor,master,projekt,praxis]: Gibt an, ob es sich um eine B/M Thesis oder einen Praxisphasen-/Projektstudiumsbericht handelt.

* `MySemester`: Semester mit Jahreszahl (nur benötigt wenn Type = praxis/projekt)

* `MyNumberPP`: Nummer der Praxisphase (nur benötigt wenn Type = praxis)

* `MyTitle`: Titel des Projekts / der Thesis

* `student`: Name des Studenten

* `studentStrasse`: Adresse des Studenten

* `studentOrt`: Wohnort des Studenten

* `matnr`: Matrikelnummer des Studenten

* `betreuer`: Name des Firmenbetreuers

* `professor`: Name des Professors / Hochschulbetreuers

* `firma`: Name des Partnerunternehmens

* `firmaOrt`: Ort des Unternehmens / Außenstelle

* `abgabedat`: Abgabedatum des Berichts (Für das aktuelle Datum kann `\today` verwendet werden)

### Optionale Parameter
Optionale Parameter können auskommentiert werden, wenn sie nicht benötigt werden.

* `MyHasTables`: Gibt an, ob eine Liste der Tabellen eingefügt werden soll.

* `MyHasFigures`: Gibt an, ob eine Liste der Abbildungen eingefügt werden soll.

* `MyAbbrevPath`: Relativer Pfad zu einer .tex Datei, die den Text des Abkürzungsverzeichnisses enthält.

* `MyConficlausepath`: Relativer Pfad zu einer .tex Datei, die den Text des Sperrvermerks enthält.

* `MyAbstractpath`: Relativer Pfad zu einer .tex Datei, die den Text des Abstracts enthält.

* `MyBibpath`: Relativer Pfad zu einer .bib Datei, die die Definitionen der Literaturquellen enthält.

* `MyStatutoryDeclPath`: Relativer Pfad zu einer .tex Datei, die den Text der eidesstattlichen Erklärung enthält.

* `MyLogo`: Relativer Pfad zu einem Bild, welches das Firmenlogo enthält.

* `MyAppendixPath`: Relativer Pfad zu einer .tex Datei, die den Text des Anhangs enthält.

# Eingebundene Packages
Es sind einige packages nötig, um die Funktionalität der Vorlage bereitzustellen.

* `ifthen`: Logische Algebra zum Abfragen von Werten und bedingtem Ausführen von Anweisungen.

* `setspace`: Bietet die Möglichkeit den Zeilenabstand zu verändern.

* `helvet`: Ändert die Schriftart zu Helvetica (sehr ähnlich zu Arial).

* `etoolbox`: Enthält u.A. `\AfterEndPreamble`. Wird verwendet, um bestimmte Inhalte am Anfang und Ende des Dokumentes einzufügen.

* `biblatex`: Erstellung und Verwaltung des Literaturverzeichnisses und der Literaturverweise. 

* `chngcntr`: Nummerierung von Tabellen und Abbildungen fortlaufen über das gesamte Dokument.

* `tocloft`: Formatierung von Einträgen in Inhalts-, Abbildungs- und Tabellenverzeichnis.

* `babel`: Ändert die Sprache von Texten wie "Inhaltsverzeichnis" auf Deutsch.

* `titlesec`: Formatieren von Kapitelüberschriften.

* `fontenc`: Ändert die Schriftcodierung. (z.B. ö tatsächlich ein ö und nicht o mit 2 Punkten darüber)

* `parskip`: Konfiguration des Absatzabstands.

* `hyperref`: Fügt Hyperlinks vom Inhaltsverzeichnis zu den Inhalten ein.

* `booktabs`: Paket zum Erstellen von simplen Tabellen.

* `microtype`: Optimierung von Wortabständen, Zeilenumbrüchen und Buchstaben-Skalierung.

* `caption`: Formatierung der Abbildungs- und Tabellenbeschriftungen.

* `fancyhdr`: Formatierung von Kopf- und Fußzeilen.

* `xcolor`: Verwenden von Farben. (z.B. horizontale Linie in der Kopfzeile)

* `graphicx`: Paket um Bilder mittels `\includegraphics{}` einzubinden.

* `geometry`: Anpassen des Seitenformats und der Seitenränder.

## Packages nur für das Beispiel benötigt: 
* `chemformula`: Erlaubt das Einfügen von chemischen Formeln mittels `\ch`.