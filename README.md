Dieses Projekt enthält eine LaTeX documentclass sowie ein Beispieldokument zur Erstellung von Praxisphasenberichten im Rahmen der THM und StudiumPlus.

Als Vorlage wurden die Formatvorgaben aus dem Dokument "Richtlinien zum Wissenschaftlichen Arbeiten" (Stand Okt. 2019) benutzt.

Diese Vorlage ist eine Erweiterung von: [github.com/jnnks/thmreport](https://github.com/jnnks/thmreport)

Ein Beispieldokument kann [hier](https://github.com/leonknauf/thmreport/blob/master/example.pdf) angesehen werden.

# Erste Schritte
## Installation
Da das Paket nicht auf LaTeX Distributionen verfügbar ist, ist das Klonen des Repositories die bevorzugte Lösung.

`git clone https://github.com/leonknauf/thmreport.git`

Alternativ kann auch die Template-Funktion von GitHub genutzt werden und so der Inhalt dieses Repositories in ein eigenes kopiert werden.

## Softwareumgebung

Dieses Projekt wurde mit der LaTeX-Distribution [TeXLive](https://www.tug.org/texlive/) in Visual Studio Code mit der Erweiterung [LaTeX-Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) erstellt.

[Anleitung zum Installieren von TeXLive](https://www.dante.de/installation-von-tex-live-unter-windows/)
[Anleitung zum Installieren von LaTeX-Workshop](https://github.com/James-Yu/LaTeX-Workshop/wiki/Install)

Zur Rechtschreibprüfung kann die Erweiterung [LTeX](https://marketplace.visualstudio.com/items?itemName=valentjn.vscode-ltex) verwendet werden.
Optional kann dort noch die Prüfung mittels n-gram Datensätzen aktiviert werden.
Siehe dazu folgende [Anleitung](https://dev.languagetool.org/finding-errors-using-n-gram-data.html). Der Pfad der Datensätze muss in folgender Einstellung von LTeX angegeben werden: `ltex.additionalRules.languageModel` (siehe [LTeX Settings](https://valentjn.github.io/ltex/settings.html#ltexadditionalruleslanguagemodel))

# Features
Das Template existiert, um die Erstellung des Berichts einfacher zu gestalten. Viele Kleinigkeiten, die per Hand gemacht werden müssten, sind bereits eingerichtet.

## Maße
Die vorgegebenen Abstände entsprechen den offiziellen Vorgaben der THM/StudiumPlus. Falls keine genauen Vorgaben gemacht werden, wurde das Dokument "Richtlinie Wissenschaftliches Arbeiten" selbst als Vorlage verwendet.

## Bilder
Bilder können mittels `\img` eingebunden werden. Dabei müssen eine Beschreibung, der Pfad zu der Bilddatei und ein Label und das Bild referenzieren zu können angegeben werden.

## Firmenlogo
Es besteht die Möglichkeit ein Firmenlogo einzubinden. Dieses wird auf jeder Seite oben rechts erscheinen. Auf der Titelseite ist es unten rechts zu finden. Es sollten im besten Fall ähnliche Maße wie das Beispielbild aufweisen.

## Literaturverzeichnis
Zum Einsatz kommt biber/biblatex. Das ist ein Paket, welches in allen modernen TeX Installationen vorhanden ist, bzw. installiert werden kann. 
Das Literaturverzeichnis wird nach Vorgabe am Ende des Dokumentes eingefügt und Zitate werden mit Verweis zum Literaturverzeichnis versehen (üblich im technischen Bereich).

## Zitieren
Zum Zitieren reicht es aus, `\cite{QUELLE}` zu nutzen.

## Abkürzungsverzeichnis
Ein Abkürzungsverzeichnis kann anhand der verwendeten Abkürzungen automatisch erstellt werden. Abkürzungen werden mit `\abk` erstellt.

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

* `MyHasEquations`: Gibt an, ob eine Liste der Formeln eingefügt werden soll.

* `MyAbbrevPath`: Relativer Pfad zu einer .tex Datei, die die Definitionen der Abkürzungen enthält.

* `MyConficlausepath`: Relativer Pfad zu einer .tex Datei, die den Text des Sperrvermerks enthält.

* `MyAbstractpath`: Relativer Pfad zu einer .tex Datei, die den Text des Abstracts enthält.

* `MyBibpath`: Relativer Pfad zu einer .bib Datei, die die Definitionen der Literaturquellen enthält.

* `MyStatutoryDeclPath`: Relativer Pfad zu einer .tex Datei, die den Text der eidesstattlichen Erklärung enthält.

* `MyLogo`: Relativer Pfad zu einem Bild, welches das Firmenlogo enthält.

* `MyAppendixPath`: Relativer Pfad zu einer .tex Datei, die den Text des Anhangs enthält.

# Eingebundene Packages
Es sind einige packages nötig, um die Funktionalität der Vorlage bereitzustellen.

* `babel`: Ändert die Sprache von Texten wie "Inhaltsverzeichnis" auf Deutsch.

* `csquotes`: Passt u.A. die Anführungszeichen an die Sprache an. (Wird von `babel` benötigt).

* `titlesec`: Formatieren von Kapitelüberschriften.

* `ifthen`: Logische Algebra zum Abfragen von Werten und bedingtem Ausführen von Anweisungen.

* `etoolbox`: Enthält u.A. `\AfterEndPreamble`. Wird verwendet, um bestimmte Inhalte am Anfang und Ende des Dokumentes einzufügen.

* `fontenc`: Ändert die Schriftcodierung. (z.B. ö tatsächlich ein ö und nicht o mit 2 Punkten darüber)

* `booktabs`: Paket zum Erstellen von simplen Tabellen.

* `microtype`: Optimierung von Wortabständen, Zeilenumbrüchen und Buchstaben-Skalierung.

* `silence`: Unterdrücken von nicht vermeidbaren Warnungen.

* `caption`: Formatierung der Abbildungs- und Tabellenbeschriftungen.

* `tocloft`: Formatierung von Einträgen in Inhalts-, Abbildungs- und Tabellenverzeichnis.

* `parskip`: Konfiguration des Absatzabstands.

* `helvet`: Ändert die Schriftart zu Helvetica (sehr ähnlich zu Arial).

* `chngcntr`: Nummerierung von Tabellen und Abbildungen fortlaufen über das gesamte Dokument.

* `setspace`: Bietet die Möglichkeit den Zeilenabstand zu verändern.

* `inconsolata`: Setzt Consolas als Schriftart für Monospace Schrift.

* `placeins`: Verhindert das Anzeigen von Floats(figure, table, ...) im nächsten Absatz.

* `hyphenat`: Ermöglicht Zeilenumbrüche in Monospace Textstellen.

* `biblatex`: Erstellung und Verwaltung des Literaturverzeichnisses und der Literaturverweise. 

* `fancyhdr`: Formatierung von Kopf- und Fußzeilen.

* `xcolor`: Verwenden von Farben. (z.B. horizontale Linie in der Kopfzeile)

* `graphicx`: Paket um Bilder mittels `\includegraphics{}` einzubinden.

* `geometry`: Anpassen des Seitenformats und der Seitenränder.

* `hyperref`: Fügt Hyperlinks vom Inhaltsverzeichnis zu den Inhalten ein.

* `glossaries`: Verwenden von Abkürzungen, automatisches Erstellen eines Abkürzungsverzeichnisses.

## Packages nur für das Beispiel benötigt: 
* `chemformula`: Erlaubt das Einfügen von chemischen Formeln mittels `\ch`.
