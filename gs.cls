%% appunti.cls
%% Classe LaTeX personalizzata per appunti con supporto greco e Alegreya
%% 
%% Versione: 1.0
%% Compilazione richiesta: XeLaTeX

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{appunti}[2025/07/22 v1.0 Classe personalizzata per appunti]

% Opzioni della classe
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% Carica la classe base
\LoadClass[12pt,a4paper]{article}

% Verifica compilazione con XeLaTeX
\RequirePackage{iftex}
\ifXeTeX
    % Tutto ok, procediamo
\else
    \ClassError{appunti}{%
        Questa classe richiede XeLaTeX per funzionare correttamente.%
    }{%
        Compila il documento usando XeLaTeX invece di pdfLaTeX o LaTeX.%
    }
\fi

%% === FONT E ENCODING ===
% Configurazione per XeLaTeX
\RequirePackage{fontspec}
\RequirePackage{xunicode}
\RequirePackage{xltxtra}

% Font principale: Alegreya
\setmainfont{Alegreya}[
    Extension = .otf,
    UprightFont = *-Regular,
    BoldFont = *-Bold,
    ItalicFont = *-Italic,
    BoldItalicFont = *-BoldItalic
]

% Font sans serif (opzionale per titoli)
\setsansfont{AlegreyaSans}[
    Extension = .otf,
    UprightFont = *-Regular,
    BoldFont = *-Bold,
    ItalicFont = *-Italic,
    BoldItalicFont = *-BoldItalic
]

% Font monospace per codice
\setmonofont{JetBrains Mono}[
    Scale=0.9
]

%% === SUPPORTO LINGUISTICO ===
\RequirePackage{polyglossia}
\setmainlanguage{italian}
\setotherlanguage{greek}

% Configurazione per il greco
\newfontfamily\greekfont{GFS Artemisia}[
    Script=Greek,
    Scale=1.0
]

%% === LAYOUT E GEOMETRIA ===
\RequirePackage[
    margin=2.5cm,
    top=3cm,
    bottom=3cm,
    includeheadfoot
]{geometry}

%% === PACCHETTI ESSENZIALI ===
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{hyperref}

%% === CONFIGURAZIONE HYPERREF ===
% Configurazione automatica dei metadati PDF
\AtBeginDocument{%
    \hypersetup{
        colorlinks=false,
        bookmarksnumbered=true,
        bookmarksopen=true,
        pdftitle={\@title},
        pdfauthor={\@author},
        pdfsubject={Appunti di filosofia},
        pdfkeywords={filosofia, appunti, greco},
        pdfcreator={XeLaTeX con classe appunti},
        pdfproducer={LaTeX}
    }
}

%% === COMANDI PERSONALIZZATI ===

% Comando per testo in greco
\newcommand{\greco}[1]{\textgreek{#1}}

% Comando per enfasi filosofica
\newcommand{\concetto}[1]{\textbf{#1}}

% Comando per etimologie
\newcommand{\etimologia}[2]{%
    \textit{#1} (dal #2)%
}

% Ambiente per citazioni filosofiche
\newenvironment{citazionefilosofica}[1]
{%
    \def\citazioneautore{#1}%
    \begin{quote}
    \itshape
}{%
    \normalfont
    \begin{flushright}
    --- \citazioneautore
    \end{flushright}
    \end{quote}
}

%% === TITOLI E SEZIONI ===
\RequirePackage{titlesec}

% Personalizzazione titoli
\titleformat{\section}
    {\Large\bfseries\sffamily}
    {\thesection.}
    {0.5em}
    {}

\titleformat{\subsection}
    {\large\bfseries\sffamily}
    {\thesubsection.}
    {0.5em}
    {}

\titleformat{\subsubsection}
    {\normalsize\bfseries\sffamily}
    {\thesubsubsection.}
    {0.5em}
    {}

%% === HEADER E FOOTER ===
\RequirePackage{fancyhdr}
\pagestyle{fancy}

\fancyhf{} % Pulisce header e footer
\fancyhead[L]{\leftmark}
\fancyhead[R]{\thepage}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0pt}

% Stile per la prima pagina
\fancypagestyle{plain}{%
    \fancyhf{}
    \fancyfoot[C]{\thepage}
    \renewcommand{\headrulewidth}{0pt}
}

%% === FINE CLASSE ===