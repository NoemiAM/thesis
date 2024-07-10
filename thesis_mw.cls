%%
%% This is file 'thesis_mw.cls',
%% A thesis class for the University of Amsterdam, the Netherlands, based
%% on the standard LaTeX book class.
%%
%% This package provides the following commands
%% \thesisfont : sets the overall font, for example 
%%               \thesisfont{cmr} : set to Computer Modern Times Roman
%%               \thesisfont{bch} : set to Bitstream Charter
%%               \thesisfont{phv} : set to Helvetica
%%
%% \thesischapterstyle : sets the style of the chapter titles, for example
%%                       \thesischapterstyle{\centering\Huge\bfseries\scshape}
%% 
%% \thesissectionstyle : set the style of the section, subsection and subsubsection titles 
%%                       \thesissectionstyle{\it\bfseries}
%%
%% \thesissectionsizes : sets the sizes of the section, subsection and subsubsection resp.
%%                       \thesissectionsizes{\Large}{\large}{\normalsize}
%%
%% \thesissectiondecoration
%% \thesisparagraphstyle
%% \thesisparagraphfont
%% \thesisparagraphsizes
%% \thesisheadrule
%% \thesisfootrule
%%
%% 

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{thesis_mw}[2004/06/01 v1.0 Thesis class based on the standard LaTeX book class v1.4e (Jeroen Wijnhout)]

\LoadClassWithOptions{book}

\renewcommand{\baselinestretch}{1.1}

\usepackage[%don't pass the dvips parameter here if we use the "crop" package
    includehead=true,
    includefoot=false,
    paperheight=240mm,
    paperwidth=170mm,
    top=20mm,%20mm
    bottom=20mm,%25mm
    left=20mm, %22mm,
    right=20mm, %20mm
    twoside
]
{geometry}

%\oddsidemargin 25mm
%\evensidemargin 20mm

\RequirePackage{thesisfrontmatter}
\RequirePackage{ifthen}
\RequirePackage{fancyhdr}

\newcommand{\thesisfont}[1]
{
    \renewcommand{\rmdefault}{#1}
    \renewcommand{\sfdefault}{#1}
    \renewcommand{\ttdefault}{#1}
}
%use Bitstream Charter font (see /usr/share/texmf/fonts/afm) by default
\thesisfont{bch}

% \newcommand{\THESIS@chapterstyle}{\centering\small\it\bfseries}
% \newcommand{\thesischapterstyle}[1]{\renewcommand{\THESIS@chapterstyle}{#1}}

% \def\@makechapterhead#1%
% {%
%     \vspace*{10\p@}%
%     {
%         \parindent \z@ \raggedright \normalfont
%         \ifnum \c@secnumdepth >\m@ne
%             \if@mainmatter
%                 \THESIS@chapterstyle \@chapapp\space \thechapter
%                 \par\nobreak
%                 \vskip 1\p@
%             \fi
%         \fi
%         \interlinepenalty\@M
%         \THESIS@chapterstyle #1\par
%         \vskip 1\p@
%     }
% }

% \def\@makeschapterhead#1%
% {%
%     \vspace*{1\p@}%
%     {
%         \parindent \z@ \raggedright
%         \normalfont
%         \interlinepenalty\@M
%         \THESIS@chapterstyle  #1\par\nobreak
%         \vskip 1\p@
%     }
% }

\newcommand{\THESIS@sectiondecorationleft}{}
\newcommand{\THESIS@sectiondecorationright}{}
\newcommand{\thesissectiondecoration}[2]
{
    \renewcommand{\THESIS@sectiondecorationleft}{#1}
    \renewcommand{\THESIS@sectiondecorationright}{#2}
}
\renewcommand{\@seccntformat}[1]
{
    \THESIS@sectiondecorationleft\@nameuse{the#1}\THESIS@sectiondecorationright\quad
}

\newcommand{\THESIS@sectionstyle}{\bfseries}
\newcommand{\thesissectionstyle}[1]{\renewcommand{\THESIS@sectionstyle}{#1}}
\newcommand{\THESIS@sectionfont}{\normalfont}
\newcommand{\thesissectionfont}[1]{\renewcommand{\THESIS@sectionfont}{#1}}
\newcommand{\THESIS@sectionsize}{\Large}
\newcommand{\THESIS@subsectionsize}{\large}
\newcommand{\THESIS@subsubsectionsize}{\normalsize}
\newcommand{\thesissectionsizes}[3]
{
    \renewcommand{\THESIS@sectionsize}{#1}
    \renewcommand{\THESIS@subsectionsize}{#2}
    \renewcommand{\THESIS@subsubsectionsize}{#3}
}
\renewcommand\section{\@startsection {section}{1}{-5pt}%
            {-3.5ex \@plus -1ex \@minus -.2ex}%
             {2.3ex \@plus.2ex}%
             {\THESIS@sectionfont\THESIS@sectionsize\THESIS@sectionstyle}}
\renewcommand\subsection{\@startsection{subsection}{2}{-4pt}%
             {-3.25ex\@plus -1ex \@minus -.2ex}%
             {1.5ex \@plus .2ex}%
             {\THESIS@sectionfont\THESIS@subsectionsize\THESIS@sectionstyle}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
%             {-3.25ex\@plus -1ex \@minus -.2ex}%
%             {1.5ex \@plus .2ex}%
             {-1.25ex\@plus -1ex \@minus -.2ex}%
             {.5ex \@plus .2ex}%
             {\THESIS@sectionfont\THESIS@subsubsectionsize\THESIS@sectionstyle}}

\setlength{\parindent}{4ex}
\setlength{\parskip}{1ex}
\newcommand{\THESIS@paragraphstyle}{\bfseries}
\newcommand{\thesisparagraphstyle}[1]{\renewcommand{\THESIS@paragraphstyle}{#1}}
\newcommand{\THESIS@paragraphfont}{\normalfont}
\newcommand{\thesisparagraphfont}[1]{\renewcommand{\THESIS@paragraphfont}{#1}}
\newcommand{\THESIS@paragraphsize}{\normalsize}
\newcommand{\THESIS@subparagraphsize}{\normalsize}
\newcommand{\thesisparagraphsizes}[2]
{
    \renewcommand{\THESIS@paragraphsize}{#1}
    \renewcommand{\THESIS@subparagraphsize}{#2}
}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
             {3.25ex \@plus1ex \@minus.2ex}%
             {-1em}%
             {\THESIS@paragraphfont\THESIS@paragraphsize\THESIS@paragraphstyle}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
             {3.25ex \@plus1ex \@minus .2ex}%
             {-1em}%
             {\THESIS@paragraphfont\THESIS@subparagraphsize\THESIS@paragraphstyle}}

\newcommand{\maketitlefinish}
{
    \setcounter{footnote}{0}%
    \global\let\maketitle\relax
    \global\let\@author\@empty
    \global\let\@date\@empty
    \global\let\@title\@empty
    \global\let\THESIS@subtitle\@empty
    \global\let\THESIS@rectormagnificus\@empty
    \global\let\THESIS@theday\@empty
    \global\let\THESIS@thetime\@empty
    \global\let\THESIS@placeofbirth\@empty
    \global\let\THESIS@promotor\@empty
    \global\let\THESIS@copromotor\@empty
    \global\let\title\relax
    \global\let\subtitle\relax
    \global\let\rectormagnificus\relax
    \global\let\theday\relax
    \global\let\thetime\relax
    \global\let\placeofbirth\relax
    \global\let\promotor\relax
    \global\let\copromotor\relax
    \global\let\author\relax
    \global\let\date\relax
    \global\let\and\relax
}

\if@titlepage
\renewcommand{\maketitle}
{	%\includegraphics{Testing.pdf}
	%\includepdf[pages=1, fitpaper]{Testing.pdf}
	%\newpage
    \makethesisfrontpage
    \makethesiscolofon
    \makethesisannouncepage
    \makethesiscomitteepage
    \maketitlefinish
    \newpage\pagestyle{thesisheadings}
}
\fi

\newcommand{\notation}[2]
{
    \cleardoublepage\pagestyle{plain}
    \chapter*{#1}
    #2
    \cleardoublepage\pagestyle{thesisheadings}
}

\newcommand{\preface}[1]{
    \chapter*{#1}
    \markboth{Preface}{Preface}
    \addcontentsline{toc}{chapter}{#1}
}

\newcommand{\basedon}[2]
{
    \cleardoublepage\pagestyle{plain}
    \chapter*{#1}
    \textsf{#2}
    \cleardoublepage\pagestyle{thesisheadings}
}
\newcommand{\acknowledgements}[2]{%
	\chapter*{#1}\markboth{#1}{#1}
	\addcontentsline{toc}{chapter}{#1}
	#2
}
\newcommand{\summary}[2]{%
	\chapter*{#1}\markboth{#1}{#1}
	\addcontentsline{toc}{chapter}{#1}
	#2
}
\newcommand{\curriculumvitae}[2]{%
	\chapter*{#1}\markboth{#1}{#1}
	\addcontentsline{toc}{chapter}{#1}
	#2
}

%%use fancy headers
\newcommand{\thesisheadrule}[1]{\renewcommand{\headrulewidth}{#1}}
\newcommand{\thesisfootrule}[1]{\renewcommand{\footrulewidth}{#1}}
\newcommand{\thesisfootnoterule}[2]
{
 %   \renewcommand{\footnoterule}{\rule{#1}{#2}\vspace{-#2}} %BvR
}
\thesisfootnoterule{0pt}{0pt}

\fancypagestyle{plain}
{
    \fancyhead{}
    \renewcommand{\headrulewidth}{0.6pt}
%    \renewcommand{\footrulewidth}{0.6pt}
    \fancyfoot[C]{\thepage}
}
\fancypagestyle{thesisheadings}
{
     \fancyhead{}
     \fancyfoot{}
    \fancyhead[CE]{\nouppercase{\it\leftmark}} % BvR
    \fancyhead[CO]{\nouppercase{\it\rightmark}} % BvR
    \renewcommand{\headrulewidth}{0.6pt}
%    \renewcommand{\footrulewidth}{0.6pt} % BvR
     \fancyfoot[C]{\thepage}
}
\pagestyle{thesisheadings}
% \renewcommand{\chaptermark}[1]{\markboth{\@chapapp{} \thechapter{} - #1}{}}
\renewcommand{\chaptermark}[1]{\markboth{\thechapter{}. #1}{}}
%%
%% End of file 'thesis.cls'.
