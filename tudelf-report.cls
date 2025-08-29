\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tudelf-report}[2024/08/24 TU Delft report class]

\LoadClass[a4paper, 11pt]{report}

\usepackage[main=spanish]{babel}

\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{graphicx}
\usepackage{xcolor}
\usepackage{geometry}
\usepackage{eso-pic}
\usepackage{fontspec}
\usepackage{fancyhdr}
\usepackage{tikz}
\usepackage{ifthen}
\usepackage{pgfgantt}
\usepackage{pdflscape}
\usepackage{float}
\usepackage[skins]{tcolorbox}
\usepackage{tabularx}

% Page layout
\geometry{
    a4paper,
    left=25mm,
    right=25mm,
    top=25mm,
    bottom=30mm
}
\setlength{\headheight}{39pt} % Adjust headheight for the logo

% Colors
\definecolor{dark-teal}{HTML}{005f6f}
\definecolor{dark-blue}{HTML}{002d40}
\definecolor{light-blue}{HTML}{00a9ce}
\definecolor{light-grey}{HTML}{f5f5f5}
\definecolor{light-blue-original}{HTML}{00a9ce}

% Fonts
% Setup for xelatex or lualatex, fonts are in the fonts/ directory
\setmainfont{Lato-Regular.ttf}[
    Path=./fonts/,
    Extension=.ttf,
    UprightFont = Lato-Regular,
    BoldFont = Lato-Bold,
    ItalicFont = Lato-Italic,
    BoldItalicFont = Lato-BoldItalic,
    FontFace = {ub}{n}{Lato-Black},
    FontFace = {ub}{it}{Lato-BlackItalic}
]
\setsansfont{Lato-Regular.ttf}[
    Path=./fonts/,
    Extension=.ttf,
    UprightFont = Lato-Regular,
    BoldFont = Lato-Bold,
    ItalicFont = Lato-Italic,
    BoldItalicFont = Lato-BoldItalic,
    FontFace = {ub}{n}{Lato-Black},
    FontFace = {ub}{it}{Lato-BlackItalic}
]

% Title and author commands
\newcommand{\thetitle}{}
\newcommand{\thesubtitle}{}
\newcommand{\theauthor}{}
\newcommand{\thedate}{\today}
\renewcommand{\title}[1]{\renewcommand{\thetitle}{#1}}
\newcommand{\subtitle}[1]{\renewcommand{\thesubtitle}{#1}}
\renewcommand{\author}[1]{\renewcommand{\theauthor}{#1}}
\renewcommand{\date}[1]{\renewcommand{\thedate}{#1}}
\newcommand{\thesupervisor}{}
\newcommand{\supervisor}[1]{\renewcommand{\thesupervisor}{#1}}
\newcommand{\thedistribution}{}
\newcommand{\distribution}[1]{\renewcommand{\thedistribution}{#1}}

% Header and footer



% Header and footer
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\fancyfoot[C]{\thepage}
\fancyhead[L]{\includegraphics[height=1.2cm]{images/ACT.png}}

% Seriografia in header
\fancyhead[R]{\begin{tikzpicture}[remember picture, overlay]
    
\node[anchor=north east, inner sep=0pt] at (\paperwidth-2.5cm, -1.5cm) {\includegraphics[width=5.5cm]{images/seriografia.jpg}};
    
\node[anchor=north east, inner sep=0pt, text=dark-blue, font=\bfseries, text width=3.5cm, align=center] at (\paperwidth-3.5cm, -2.5cm) {\thetitle};
\end{tikzpicture}}

% Redefine the 'plain' pagestyle for chapter beginnings
\fancypagestyle{plain}{
  \fancyhf{}
    \fancyhead[L]{\includegraphics[height=1.2cm]{images/ACT.png}}
  \fancyfoot[C]{\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}

% Title page


% Redefine the 'plain' pagestyle for chapter beginnings
\fancypagestyle{plain}{
  \fancyhf{}
    \fancyhead[L]{\includegraphics[height=1.2cm]{images/ACT.png}}
  \fancyfoot[C]{\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}

% SERIOGRAFIA: Descomenta las líneas siguientes para activar la seriografía en páginas 2+
% \AddToShipoutPicture{
%   \ifthenelse{\value{page}>1}{
%     \AtPageUpperLeft{
%       \put(\paperwidth-5.75cm, 0cm){
%         \includegraphics[width=5.5cm, height=4cm]{images/seriografia.jpg}%
%       }
%       \put(\paperwidth-4cm, -1.5cm){
%         \parbox{3.5cm}{\centering \color{dark-blue} \fontsize{10}{12}\selectfont \textbf{\thetitle}}
%       }
%     }
%   }{}
% }

% Title page
\renewcommand{\maketitle}{
    \begin{titlepage}
        \input{cover.tex}
    \end{titlepage}
}

% Box for versioning page
\newtcolorbox{infobox}[2][]{
    colback=white,
    colframe=light-grey,
    fonttitle=\bfseries,
    coltitle=white,
    colbacktitle=dark-blue,
    title=#2,
    attach boxed title to top left={yshift=-2mm, xshift=10mm},
    boxed title style={
        colframe=dark-blue,
        boxrule=0pt,
        arc=2mm,
    },
    #1
}

% Chapter style
\usepackage{titlesec}
\titleformat{\chapter}[display]
    {\normalfont\Huge\fontseries{ub}\selectfont\sffamily\color{dark-teal}}
    {\chaptertitlename\ \thechapter}{20pt}{\Huge}
\titlespacing*{\chapter}{0pt}{50pt}{40pt}

\titleformat{\section}
    {\normalfont\Large\bfseries\sffamily\color{dark-blue}}
    {\thesection}{1em}{}
\titlespacing*{\section}{0pt}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}

\titleformat{\subsection}
    {\normalfont\large\bfseries\sffamily\color{dark-teal}}
    {\thesubsection}{1em}{}
\titlespacing*{\subsection}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}

\titleformat{\subsubsection}
    {\normalfont\normalsize\bfseries\sffamily\color{dark-blue}}
    {\thesubsubsection}{1em}{}
\titlespacing*{\subsubsection}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}
