Das Package enthält eine LaTeX documentclass sowie ein Beispielbericht zur Erstellung von Praxisphasenberichten im Rahmen der THM und StudiumPlus.

Als Vorlage wurden sowohl die Formatvorgaben aus dem Dokument "Richtlinien zum Wissenschaftlichen Arbeiten" (Stand Okt. 2019) benutzt.

Diese Vorlage ist eine Erweiterung von: [github.com/jnnks/thmreport](https://github.com/jnnks/thmreport)

[Bilder folgen hier]


# Erste Schritte
## Installation
Da das Paket nicht auf LaTeX Distributionen verfügbar ist, ist das Klonen des Repositories die bevorzugte Lösung.

`git clone git@github.com:leonknauf/thmreport.git`

## Erstellung eines Berichts
Das Template kann entsprechend angepasst werden und mit den eigenen Daten ausgefüllt werden.

# Features
Das Template existiert, um die Erstellung des Berichts einfacher zu gestalten. Viele Kleinigkeiten, die per Hand gemacht werden müssten, sind eingerichtet.

## Maße
Die vorgegebenen Abstände entsprechen den offiziellen Vorgaben der THM/StdPlus. Falls keine genauen Vorgaben gemacht werden, wurde das Dokument "Richtlinie Wissenschaftliches Arbeiten" selbst als Vorlage verwendet.

## Literaturverzeichnis
Zum Einsatz kommt biber/biblatex. Das ist ein Paket, welches in allen mordernen Tex Installationen vorhanden ist, bzw. installiert werden kann. 
Das Literaturverzeichnis wird nach Vorgabe am Ende des Dokumentes eingefügt und Zitate werden mit Verweis zum Literaturverzeichnis versehen (üblich im technischen Bereich).

## Zitieren
Zum Zitieren reicht es auch, `\cite{QUELLE}` zu nutzen


# Anspassung und Erweiterung
## Parameter zum Personalisieren
Die documentclass enthält Variablen, die nicht als Parameter repräsentiert sind. Dafür werden commands verwendet, die sich wie globale Variablen verhalten.

Werte wie Titel, Autor und Name der Firma müssen vorgegeben werden.

(Eine genaue Beschreibung aller Parameter wird hier noch eingefügt)
<!-- `abstractpath`[Zeichenkette]: relativer Pfad zu einer .tex Datei, die den Text des Abstrakts enthält. -->

<!-- `conficlausepath` [Zeichenkette]: relativer Pfad zu einer .tex Datei, die den Text der Vertraulichkeitsklausel -->

<!-- `bibpath`[Zeichenkette]: relativer Pfad zu einer .bib Datei, die die Definitionen des Literaturverzeichnisses enthält. -->

<!-- `lang`["en", "de"]: gibt an, ob der Bericht in Englisch oder Deutsch verfasst ist. -->

<!-- `type`["thesis", "report"]: gibt an, ob der Bericht ein Praxisphasenbericht oder eine Thesis ist. -->

<!-- `hasfigures`: gibt an, ob eine Liste der Abbildungen eingefügt werden soll -->
<!-- `hastables`: gibt an, ob eine Liste der Tabellen eingefügt werden soll -->
<!-- `haslistings`: gibt an, ob eine Liste der Listings eingefügt werden soll -->


# Eingebundene Packages
Es sind einige packages nötig, um die Funktionalität der Vorlage bereitzustellen.

* ifthen
    logische Algebra zum abfragen von Werten und ausführen von ensprechenden Anweisungen

* setspace
    Der zeilenabstand wird damit verändert.

* helvet 
    Helvetica Font (sehr ähnlich zu Arial)

* etoolbox
    Enthält `\AfterEndPreamble`, wird verwendet um Titelseite, Inhaltsangabe, etc. am Anfang des Dokuments einzufügen.

* biblatex
    Erstellung und Management der Bibliographie 

* chngcntr

* scaled

* tocloft

* babel

* csquotes

* titlesec

* fontenc

* parskip

* hyperref

* booktabs

* microtype

* caption

* fancyhdr

* xcolor

* graphicx

* geometry

## Packages nur für das Beispiel benötigt: 
* chemformula