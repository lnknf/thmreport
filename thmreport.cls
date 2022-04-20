% 
% Klasse für THM Berichte
% Formatvorgaben von Okt 2019
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thmreport}[2019/10/01 THM Praxisphasenbericht/Thesis]
\LoadClass[12pt,draft]{report}

% ---Pakete laden---
\RequirePackage[ngerman]{babel}
\RequirePackage{csquotes}
\RequirePackage{titlesec}
\RequirePackage{ifthen}
\RequirePackage{etoolbox}
\RequirePackage{listings}
\RequirePackage[T1]{fontenc}
\RequirePackage{parskip}
\RequirePackage[hidelinks]{hyperref} % [unicode=true,pdfusetitle,bookmarks=true,bookmarksnumbered=false,bookmarksopen=false,breaklinks=false,pdfborder={0 0 0.7},backref=false,colorlinks=false]
\RequirePackage{booktabs}
\RequirePackage{microtype}

% captions von Tabellen und Abbildungen linksbündig machen
\RequirePackage[singlelinecheck=false]{caption}

% ausgelagerte eigene Pakete
\RequirePackage{template/thmpagestyles}
\RequirePackage{template/thmtitlepage}


% Zeilenabstand 1.5-fach
\RequirePackage{setspace}
\onehalfspacing

% Schriftart
\RequirePackage[scaled]{helvet}
\renewcommand{\familydefault}{\sfdefault}


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

  % Inhaltsverzeichnus einfügen
  \tableofcontents

  % Liste der Abbildungen einfügen falls \MyHasFigures angegeben
  \ifdefined\MyHasFigures \listoffigures \fi
  
  % Liste der Tabellen einfügen falls \MyHasTables angegeben
  \ifdefined\MyHasTables \listoftables \fi
  
  % Abkürzungsverzeichnis einfügen falls \MyAbbrevPath angegeben
  \ifdef{\MyAbbrevPath}{
    \chapter*{Abkürzungsverzeichnis}
    \chaptermark{Abkürzungsverzeichnis}
    \input{\MyAbbrevPath}
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
  }

  \ifdef{\MyVersicherungPfad}{
    \chapter*{Versicherung}
    \chaptermark{Versicherung}
    \input{\MyVersicherungPfad}
  }
}


% Literaturverwaltung (biblatex) einbinden, falls \MyBibpath angegeben
\ifdef{\MyBibpath}{  

  \usepackage[%
    backend=biber,%
    sorting=none,%
    style=template/LNI_custom,%
    hyperref=auto]{biblatex}
  \addbibresource{\MyBibpath}

}

% Nummerierung von Abbildungen und Tabellen fortlaufend und nicht Kapitelabhängig
\RequirePackage{chngcntr}
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}

% Kapitelüberschriften formatieren
\titleformat{\chapter}
  {\normalfont\LARGE\bfseries}{\thechapter}{1em}{}
\titlespacing*{\chapter}{0pt}{-3ex plus 1ex minus .2ex}{1.3ex plus .2ex}