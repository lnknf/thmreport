% 
% Klasse für THM Berichte
% Formatvorgaben von Okt 2019
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thmreport}[2019/10/01 THM Praxisphasenbericht/Thesis]
\LoadClass[12pt]{report} % Option "draft" um textüberschneidung (overfull box) durch schwarze kästchen markiert zu bekommen 

% ---Pakete laden---
\RequirePackage[ngerman]{babel}
\RequirePackage{csquotes}
\RequirePackage{titlesec}
\RequirePackage{ifthen}
\RequirePackage{etoolbox}
\RequirePackage[T1]{fontenc}
\RequirePackage{booktabs}
\RequirePackage{microtype}
\RequirePackage{silence}
\RequirePackage[singlelinecheck=false]{caption} % Linksbündig machen
\RequirePackage[titles]{tocloft}
\RequirePackage{parskip}
\RequirePackage[scaled]{helvet}
\RequirePackage{chngcntr}

% Literaturverwaltung (biblatex) einbinden, falls \MyBibpath angegeben
\ifdef{\MyBibpath}{  
  \RequirePackage[%
    backend=biber,%
    sorting=none,%
    style=template/LNI_custom,%
    hyperref=auto,
    block=space]{biblatex}
  \addbibresource{\MyBibpath}
}

% ausgelagerte eigene Pakete
\RequirePackage{template/thmpagestyles}
\RequirePackage{template/thmtitlepage}

% Diese Pakete müssen zuletzt geladen werden
\RequirePackage[hidelinks]{hyperref} % [unicode=true,pdfusetitle,bookmarks=true,bookmarksnumbered=false,bookmarksopen=false,breaklinks=false,pdfborder={0 0 0.7},backref=false,colorlinks=false]
\RequirePackage[nogroupskip,nopostdot,nonumberlist,style=super,toc]{glossaries}



% Warnings filtern
\WarningFilter{microtype}{Unable to apply patch `footnote'}

% Captions von Tabellen und Abbildungen formatieren
\captionsetup[figure]{labelfont={bf}} % "Abbildung X" fett machen
\captionsetup[table]{labelfont={bf}} % "Tabelle X" fett machen

% Tabellen- und Abbildungsverzeichnis formatieren
\renewcommand\cftfigindent{\setlength{1pt}}
\renewcommand\cftfignumwidth{\setlength{73pt}}
\renewcommand\cftfigpresnum{Abbildung }
\renewcommand\cftfigaftersnum{:}
\renewcommand\cfttabindent{\setlength{1pt}}
\renewcommand\cfttabnumwidth{\setlength{58pt}}
\renewcommand\cfttabpresnum{Tabelle }
\renewcommand\cfttabaftersnum{:}

% Zeilenabstand 1.5-fach
\RequirePackage{setspace}
\onehalfspacing

% Schriftart
\renewcommand{\familydefault}{\sfdefault}

% Abkürzungsverzeichnis
\ifdef{\MyAbbrevPath}{

  % Befehl für Abkürzungen
  \newcommand{\abk}[3]{
    \newglossaryentry{#1}
    {
        name={#2},
        description={#3}
    }
  }
  \makeglossaries
  \setlength{\glsdescwidth}{0.9\textwidth}
  \input{\MyAbbrevPath}
}

% Texte für Type und Subttype definieren
\ifthenelse{\equal{\MyType}{bachelor}}{
  % Dokument ist eine Thesis
  \def\reporttype{Bachelor-Thesis}
  \def\reportsubtype{zur Erlangung des Grades Bachelor of Engineering}
}{
  \ifthenelse{\equal{\MyType}{master}}{
    % Dokument ist ein Praxisphasenbericht    
    \def\reporttype{Master-Thesis}
    \def\reportsubtype{zur Erlangung des Grades Master of Engineering}
  }{
    \ifthenelse{\equal{\MyType}{praxis}}{
    % Dokument ist ein Praxisphasenbericht    
    \def\reporttype{\MyNummerPP. Praxisphase im \MySemester}
    \def\reportsubtype{ }
    }{
      \ifthenelse{\equal{\MyType}{projekt}}{
        % Dokument ist ein Praxisphasenbericht    
        \def\reporttype{Projektstudium im \MySemester}
        \def\reportsubtype{ }
      }{
        % Dokument ist nichts davon
        \def\reporttype{type}
        \def\reportsubtype{subtype}
      }
    }
  }
}

% Standardelemente des Dokuments generieren
\AfterEndPreamble{
  \maketitle 

  \pagenumbering{Roman}
  \setcounter{page}{2}
  \pagestyle{plain}

  % Sperrvermerk einfügen falls \MyConficlausepath angegeben
  \ifdef{\MyConficlausepath}{
    \chapter*{Sperrvermerk}
    \chaptermark{Sperrvermerk}
    \input{\MyConficlausepath}
  }

  % Abstract einfügen falls \MyAbstractpath angegeben
  \ifdef{\MyAbstractpath}{
    \chapter*{Abstrakt}
    \chaptermark{Abstrakt}
    \input{\MyAbstractpath}
  }

  % Inhaltsverzeichnis einfügen
  \clearpage
  \singlespacing
  \tableofcontents
  \onehalfspacing
  
  % Liste der Abbildungen einfügen falls \MyHasFigures angegeben
  \ifdef{\MyHasFigures}{
    \clearpage
    \addcontentsline{toc}{chapter}{Abbildungsverzeichnis}
    \begingroup
    \renewcommand*{\addvspace}[1]{}
    \listoffigures
    \endgroup
  }
  
  % Liste der Tabellen einfügen falls \MyHasTables angegeben
  \ifdef{\MyHasTables}{
    \clearpage
    \addcontentsline{toc}{chapter}{Tabellenverzeichnis}
    \listoftables
  }
  
  % Abkürzungsverzeichnis einfügen falls \MyAbbrevPath angegeben
  \ifdef{\MyAbbrevPath}{
    \clearpage
    \printglossary[title=Abkürzungsverzeichnis]
  }
    
  \clearpage
  \pagenumbering{arabic}
  \pagestyle{main}
}

% Literaturverzeichnis einfügen falls \MyBibpath angegeben
% (important: AtEndDocument needs to be defined, before biblatex is imported; see https://tex.stackexchange.com/questions/371814)
\AtEndDocument{
  % \pagestyle{empty}
  \ifdef{\MyBibpath}{
    \printbibliography
    \addcontentsline{toc}{chapter}{Literaturverzeichnis}
  }

  \ifdef{\MyStatutoryDeclPath}{
    \clearpage
    \chapter*{Versicherung}
    \chaptermark{Versicherung}
    \addcontentsline{toc}{chapter}{Versicherung}
    \input{\MyStatutoryDeclPath}
  }

  
  \clearpage
  \appendix
  \addtocontents{toc}{\protect\setlength{\cftchapnumwidth}{75pt}}
  \renewcommand{\thechapter}{Anhang \Roman{chapter}}
  \newcommand{\anhang}[1]{
    \chapter{#1}%
    \chaptermark{\thechapter \quad #1}%
  }
  \ifthenelse{\isundefined{\MyAppendixPath}}{
  }{
    \input{\MyAppendixPath}
  }
}

% Literaturverwaltung (biblatex) einbinden, falls \MyBibpath angegeben
\ifdef{\MyBibpath}{  
  \addbibresource{\MyBibpath}
}

% Nummerierung von Abbildungen und Tabellen fortlaufend und nicht Kapitelabhängig
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}

% Kapitelüberschriften formatieren
\titleformat{\chapter}
  {\normalfont\LARGE\bfseries}{\thechapter}{1em}{}
\titlespacing*{\chapter}{0pt}{-5.8ex}{1.3ex plus .2ex}

%Highlighting von vorübergehenden Änderungen
\newcommand{\tmp}[1]{
  \textcolor{red}{\textbf{#1}}
}

%Befehl für Bilder
\newcommand{\img}[3]{
  \begin{figure}[h]
    \includegraphics[width=\textwidth]{#2}
    \caption{#1}
    \label{#3}
  \end{figure}
}

\hypersetup{
  pdftitle   = {\reporttype},
  pdfauthor  = {\student},
  pdfsubject = {\MyTitle},
}