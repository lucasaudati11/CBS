% ========================================== IDENTIFICATION =============================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cbsdiscussionpaper}[2013/12/06 CBS Discussion Paper class]

% ==========================================  INITIAL CODE  =============================================
% Definieer een aantal strings. Deze worden voornamelijk gebruikt op de titelpagina. Afhankelijk van de
% taalinstelling worden de meeste strings geherdefinieerd. Verder moeten een aantal strings door de 
% gebruiker gedefinieerd worden. Dit kan met de verderop gedefinieerde opdrachten. 
\newcommand{\theNumberY}{year}
\newcommand{\theNumberI}{issue}
\newcommand{\theRemarks}{The views expressed in this paper are those of the author and do not necessarily reflect the policies of Statistics Netherlands.} 
\newcommand{\theDocumentNumber}{XXXXXXXXXXXXX}

% Stel de kleur in die gebruikt wordt voor de headings etc
\newcommand{\basecolor}{\color{rood}}

% De volgende strings zijn nodig voor de bibliografie. 
\newcommand{\harvardand}{}
\newcommand{\blz}{}

% =====================================  DECLARATION OF OPTIONS =========================================
\DeclareOption{oranje}{%
  \renewcommand{\basecolor}{\color{oranje}}
}
\DeclareOption{rood}{%
  \renewcommand{\basecolor}{\color{rood}}
}
\DeclareOption{blauw}{%
  \renewcommand{\basecolor}{\color{corporatelichtblauw}}
}
\DeclareOption{zwart}{%
  \renewcommand{\basecolor}{\color{black}}
}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}

% ======================================  EXECUTION OF OPTIONS ==========================================
\ProcessOptions*

% ========================================  PACKAGE LOADING =============================================
% Deze class is gebaseerd op de article class
\LoadClass[10pt]{article}

% Stel het papierformaat en de marges in met geometry
\RequirePackage[paper=a4paper,lmargin=4.7cm,rmargin=2.5cm,tmargin=2.81cm,bmargin=2.53cm]{geometry}

% De alinea's springen niet in maar zijn gescheiden met witruimte
\setlength{\parindent}{0pt}
\setlength{\parskip}{14pt plus 7pt minus 2pt}
%\setlength{\parskip}{1ex plus 0.5ex minus 0.2ex}

% Stel de kop en voetteksten in mbv de fancyhdr package
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[R]{\serif{Statistics Netherlands | Discussion paper \theNumberY|\theNumberI\hspace{1em}{\bf\thepage}}}
\renewcommand\headrulewidth{0pt}
\renewcommand\footrulewidth{0pt}

% Graphics is nodig om de cbs-logo te kunnen importeren en is verder ook meestal
% wel noodzakelijk. 
\RequirePackage{graphicx}

% Definieer de huisstijlkleuren
\RequirePackage{xcolor}
\definecolor{corporateblauw}{RGB}{39,29,108}
\definecolor{corporatelichtblauw}{RGB}{0,161,205}
\definecolor{oranje}{RGB}{243,146,0}
\definecolor{oranjevergrijsd}{RGB}{206,124,0}
\definecolor{rood}{RGB}{233,76,10}
\definecolor{roodvergrijsd}{RGB}{178,61,2}
\definecolor{lichtgrijs}{RGB}{236,236,236}
% TODO: de rest van de kleuren
\definecolor{codekleur}{RGB}{88, 88, 88}

% Met etoolbox kunnen bepaalde opdrachten conditioneel uitgevoerd worden. 
\RequirePackage{etoolbox}

% Laad package amsmath, sowieso handig en we willen de equations links uitgelijnd
\RequirePackage[fleqn]{amsmath}
\setlength{\mathindent}{5mm}

% Pas de ruimte rond equations aan. Deze is nu iets kleiner dan standaard. Dit 
% moet of geen ruimte zijn of gelijk aan de ruimte tussen de paragrafen. Het 
% nadeel van het laatste is dat je dan niet goed meer het onderscheid tussen
% paragrafen kan zien als er veel vergelijkingen in de tekst staat. 
\apptocmd\normalsize{%
 \abovedisplayskip=6pt plus 3pt minus 0pt
 \abovedisplayshortskip=6pt plus 3pt
 \belowdisplayskip=6pt plus 3pt minus 0pt
 \belowdisplayshortskip=6pt plus 3pt minus 0pt
}{}{}

% Maak het document op in Corbel met Cambria voor headings; Cambria is te 
% benaderen met \serif
\RequirePackage{fontspec}
\setmainfont[Numbers={Lining}]{Calibri}
\setmonofont[Scale=MatchLowercase]{Consolas}
\setsansfont{Cambria}
\newfontfamily\serif{Cambria}

\RequirePackage[bold-style=ISO]{unicode-math}
\setmathfont{Cambria Math}

% Opmaak van headings
\RequirePackage{titlesec}
\titleformat{\section}{\raggedright\serif\fontsize{24}{29}\selectfont\bfseries\basecolor{}}{\llap{\hspace*{-1cm}\thesection\hfill}}{0em}{}[]
\titleformat{\subsection}{\raggedright\serif\fontsize{13}{15}\selectfont\bfseries\basecolor{}}{\llap{\hspace*{-1cm}\thesubsection\hfill}}{0em}{}[]
\titleformat{\subsubsection}{\raggedright\serif\normalsize\bfseries\basecolor{}}{\thesubsubsection}{1em}{}[]

\titlespacing{\subsection}{0pt}{42pt plus 10pt minus 5pt}{28pt plus 5pt minus 2pt}
\titlespacing{\subsection}{0pt}{14pt plus 5pt minus 2pt}{0pt plus 5pt}
\titlespacing{\subsubsection}{0pt}{14pt plus 5pt minus 2pt}{-14pt plus 2pt}

% Laat secties in de bijlage met letters genummerd zijn
\renewcommand\appendix{\par
  \clearpage
  \section*{\appendixname}
  \vspace*{-20pt}
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \gdef\thesection{\@Roman\c@section}}

% voorkom dat figuren en tabellen voor de section komen voor report
\RequirePackage[section]{placeins}

% Formatting of table of contents
\RequirePackage{titletoc}
\setcounter{tocdepth}{2}
\titlecontents{section}[2em] 
{}
{\large\bf\basecolor{}\serif{\contentslabel{2em}}}
{\hspace*{-2em}}
{\hspace{1em}\large\bf\basecolor{}\serif{\contentspage}}        

\titlecontents{subsection}[4em] 
{\vspace{-14pt}}
{\fontsize{9.25pt}{14pt}\contentslabel{2em}}
{\hspace*{-2em}}
{\hspace{1em}\fontsize{9.25pt}{14pt}\contentspage}        

% Gebruik een italic font voor bijschriften van figuren en tabellen.  
\RequirePackage[font={sf,bf},justification=raggedright,labelsep=quad,singlelinecheck=false]{caption}
% Verklein afstand caption-figuur/tabel
\captionsetup[table]{skip=2pt}
\captionsetup[figure]{skip=2pt}
% Nummer tabellen en figuren binnen sections
\numberwithin{table}{section}
\numberwithin{figure}{section}

% Voetnoten
\RequirePackage[hang,norule]{footmisc}
\setlength{\skip\footins}{10mm plus 2mm}
\renewcommand\@makefnmark{\mbox{\textsuperscript{\normalfont\@thefnmark)}}}
\setlength{\footnotemargin}{5mm}

% Tikz is nodig om de titel pagina te tekenen
\RequirePackage{tikz}
\usetikzlibrary{positioning}

% Stel lijsten in
\RequirePackage{enumitem}
\setlist{nolistsep, labelindent=0pt, leftmargin=5mm} 
\setlist[itemize]{label=\normalfont\textendash}
\setlist[enumerate,2]{label=\alph*.}


% ===========================================  MAIN CODE ================================================

% Discussion paper nummer
\newcommand{\Number}[2]{\renewcommand{\theNumberY}{#1}\renewcommand{\theNumberI}{#2}}

% Nummer gebruikt door publicatiebureau
\newcommand{\DocumentNumber}[1]{\renewcommand{\theDocumentNumber}{#1}}

% Instellen sector name; genegeerd in discussionpapers
\newcommand{\Sector}[1]{}

% Trefwoorden; genegeerd in discussionpapers
\newcommand{\Keywords}[1]{}

% Projectnummer; genegeerd in discussionpapers
\newcommand{\Projectnummer}[1]{}

% Subtitle; genegeerd in discussionpapers
\newcommand{\Subtitle}[1]{}

% Instellen van adres; genegeerd in discussionpapers
\newcommand{\Adres}[1]{}
\newcommand{\AdresDenHaag}{}
\newcommand{\AdresHeerlen}{}

% Environment voor als figuren of tabellen in de linker marge moeten uitsteken
\newenvironment{wijd}{%
  \hspace*{-2.2cm}\minipage{16cm}
}{%
  \endminipage
}

% Environment voor code
\RequirePackage{fancyvrb}
% ruimte tussen tekst en Verbatim is te groot, verklein met 6pt
\FV@AddToHook{\FV@ListParameterHook}{\topsep=-6pt}
\RecustomVerbatimEnvironment{Verbatim}{Verbatim}
  {frame=lines,rulecolor=\basecolor{},formatcom=\color{codekleur}}
\newenvironment{code}{
  \VerbatimEnvironment
  \vspace{-5pt}\begin{Verbatim}
}{\end{Verbatim}}

\newcommand{\cd}[1]{\textcolor{codekleur}{\texttt{#1}}}

% Maketitle
\renewcommand{\maketitle}{%
  \thispagestyle{empty}
  \begin{tikzpicture}[remember picture, overlay]
    % background
    \node[shift={(0,0)}] at (current page.south west) { 
      \begin{tikzpicture}[remember picture, overlay]
        \draw[orange, fill=oranje] (0,0) rectangle (current page.north east);
      \end{tikzpicture}
    };
    % logo
    \node(logo)[rounded corners=2mm, fill=white, inner sep=2mm, anchor=north west, shift={(0cm, -2.2cm)}, text ragged] at (current page.north west){
      \noindent\hspace{13mm}\parbox[t][18mm]{4.7cm}{
        \includegraphics[height=1.5cm]{cbs_logo_discussionpaper.pdf}
      }
    };
    % discussion paper
    \node(disc)[rounded corners=2mm, fill=roodvergrijsd, inner sep=6mm, below=0cm of logo.south west, anchor=north west] {
      \noindent\hspace{9mm}\fontsize{20pt}{28pt}\bf\color{white}\serif Discussion Paper\hspace*{3mm}
    }; 
    % title
    \node(title)[rounded corners=2mm, fill=white, inner sep=5mm, below=0cm of disc.south west, anchor=north west] {
      \hspace{10mm}\parbox[t][9.4cm]{16.7cm}{
        \raggedright\color{roodvergrijsd}
        \noindent{\fontsize{36pt}{42pt}\bf\serif\@title\par}
        \par\vspace{\stretch{1}}{\fontsize{12pt}{20pt}\serif\theRemarks\par}
      }
    };
    % paper number
    \node(number)[rounded corners=2mm, inner sep=4mm, fill=rood, below=0cm of title.south west, anchor=north west] {
      \noindent\hspace{11mm}\parbox[t][10mm]{5.7cm}{
        \fontsize{36pt}{42pt}\bf\serif\color{white}\theNumberY{} | \theNumberI\par
      }
    };
    % authors 
    \node(authors)[inner sep=5mm, below=0cm of number.south west, anchor=north west] {
      \hspace{10mm}\parbox[t][8.5cm][b]{15cm}{
        \color{roodvergrijsd}\fontsize{16pt}{21pt}\bf\serif\@author\par
      }

    };
    % white bar left on page
    \node[shift={(0,0)}] at (current page.south west) { 
      \begin{tikzpicture}[remember picture, overlay]
        \draw[white, fill=white] (0,0) rectangle (10mm, \paperheight);
      \end{tikzpicture}
    };
  \end{tikzpicture}
  \clearpage
}

% Abstract + keywords
\renewenvironment{abstract}{%
  \bf
} {%
}

% Achterpagina met colofon
\fancypagestyle{backpage}{%
\fancyhf{}
\fancyfoot[L]{\hspace*{-2.2cm}\scriptsize{\theDocumentNumber}}}

\AtEndDocument{%
\clearpage
\thispagestyle{backpage}
\vspace*{\stretch{1}}
\hspace*{1cm}\begin{minipage}{12cm}
\small
{\it Publisher}\\
Statistics Netherlands\\
Henri Faasdreef 312, 2492 JP The Hague\\
www.cbs.nl\\

Prepress: Statistics Netherlands, Grafimedia\\
Design: Edenspiekermann\\

{\it Information}\\
Telephone +31 88 570 70 70, fax +31 70 337 59 94\\
Via contact form: www.cbs.nl/information\\

{\it Where to order}\\
verkoop@cbs.nl\\
Fax +31 45 570 62 68\\
ISSN 1572-0314\\

© Statistics Netherlands, The Hague/Heerlen 2014.\\
Reproduction is permitted, provided Statistics Netherlands is quoted as the source
\end{minipage}
}


% Stel regelafstand in
\AtBeginDocument{\setlength\baselineskip{14pt}}
\raggedright

