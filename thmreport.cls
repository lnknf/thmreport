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
\RequirePackage{setspace}
\RequirePackage{inconsolata}
\RequirePackage[section]{placeins} %\FloatBarrier
\RequirePackage[htt]{hyphenat}

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

% Formeln formatieren
\renewcommand*{\theequation}{\arabic{equation}}
\let\orgautoref\autoref
\renewcommand{\autoref}[1]{\def\equationautorefname{Formel}\orgautoref{#1}}
\makeatletter
\@removefromreset{equation}{chapter}
\def\tagform@#1{\maketag@@@{\ignorespaces#1\unskip\@@italiccorr}}
\let\orgtheequation\theequation
\def\theequation{(\orgtheequation)}
\makeatother


% Formelverzeichnis formatieren
\newcommand{\listequationsname}{Formelverzeichnis}
\newlistof{myequations}{equ}{\listequationsname}
\newcommand{\myequations}[1]{%
\addcontentsline{equ}{myequations}{\protect\numberline{\theequation}#1}\par}
\renewcommand\cftmyequationsnumwidth{\setlength{25pt}}

% Warnings filtern
\WarningFilter{microtype}{Unable to apply patch `footnote'}
\WarningFilter{caption}{The option `hypcap=true' will be ignored for this}
\WarningFilter{latexfont}{Font shape}

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

  \pagenumbering{gobble}

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
  \pagenumbering{Roman}
  \setcounter{page}{2}
  \pagestyle{plain}
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
  
  % Formelverzeichnis einfügen falls \MyHasEquations angegeben
  \ifdef{\MyHasEquations}{
    \clearpage
    \addcontentsline{toc}{chapter}{Formelverzeichnis}
    \listofmyequations
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
  \addtocontents{toc}{\protect\setlength{\cftchapnumwidth}{65pt}}
  \renewcommand{\thechapter}{Anhang \Roman{chapter}}
  \newcommand{\anhang}[1]{%
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
\newcommand{\tmp}[1]{%
  \textcolor{red}{\textbf{#1}}%
}

%Befehl für Bilder
\newcommand{\img}[4][1]{%
  \begin{figure}[htb]%
    \includegraphics[width=#1\textwidth]{#3}%
    \caption{#2}%
    \label{#4}%
  \end{figure}%
}

% Befehl für 2 Bilder nebeneinander
\newcommand{\imgTwo}[6]{%
  \begin{figure}[htb]
    \centering
    \begin{minipage}[t]{.49\linewidth}
        \centering
        \includegraphics[width=\linewidth]{#2}
        \caption{#1}
        \label{#3}
    \end{minipage}
    \hfill
    \begin{minipage}[t]{.49\linewidth}
        \centering
        \includegraphics[width=\linewidth]{#5}
        \caption{#4}
        \label{#6}
    \end{minipage}
  \end{figure}
}

%Befehl für Anführungszeichen
\newcommand{\az}[1]{%
  \glqq #1\grqq{}%
}

%Befehl für Code
\newcommand{\code}[1]{%
  \texttt{#1}%
}

% Befehl für autoref Anhang
\newcommand{\autorefa}[1]{%
  \hyperref[#1]{\ref{#1}}%
}

%Metadaten:
\hypersetup{
  pdftitle   = {\reporttype},
  pdfauthor  = {\student},
  pdfsubject = {\MyTitle},
}

% Subsubsections nummerieren
% \setcounter{secnumdepth}{3}

% Subsubsections mit Punkten davor
\renewcommand{\subsubsection}[1]{\heading{#1}}

\makeatletter
\newcommand{\heading}[1]
{\par\vskip 2ex \@plus .2ex
 \hangindent=1em
 \noindent\makebox[2em][l]{$\,\bullet$}\textbf{\large #1}%
\par\vskip .5ex \@plus .2ex
\@afterheading}
\makeatother
