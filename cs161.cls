\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cs161}[2022/01/14 v1.0 by Nicholas Ngai]

\LoadClass[addpoints,11pt]{exam}

\RequirePackage[T1]{fontenc}
\RequirePackage[tt=false]{libertine}
\RequirePackage{microtype}
\RequirePackage{multicol}
\RequirePackage{listings}
\RequirePackage[straightquotes]{newtxtt}
\RequirePackage{sectsty}
\RequirePackage{tikz}
\RequirePackage{hyperref}

\makeatletter

% Config.
\newif{\ifanswerletters}
\newif{\iflargeprint}
\newif{\ifanswerletters}

% Course number, course name, instructor, term.
\newcommand{\courseno@ucbcs}{}
\newcommand{\coursename@ucbcs}{}
\newcommand{\courseterm@ucbcs}{}
\newcommand{\courseinstructor@ucbcs}{}
\newcommand{\courseno}{\renewcommand{\courseno@ucbcs}}
\newcommand{\coursename}{\renewcommand{\coursename@ucbcs}}
\newcommand{\courseterm}{\renewcommand{\courseterm@ucbcs}}
\newcommand{\courseinstructor}{\renewcommand{\courseinstructor@ucbcs}}

% Set section styles with sectsty.
\newcommand{\headerff@ucbcs}{\fontfamily{cmdh}\selectfont}
\sectionfont{\headerff@ucbcs\huge}
\subsectionfont{\headerff@ucbcs\Large}
\subsubsectionfont{\headerff@ucbcs\large}

% Set header and footer via exam class functionality.
\pagestyle{headandfoot}
\extraheadheight[1.3in]{0in}
\newcommand{\headerstyle@ucbcs}{\headerff@ucbcs\huge}
\firstpageheader{
  \hrule height 3pt\vspace{10pt}
  \headerstyle@ucbcs
  \strut\courseinstructor@ucbcs \\
  \strut\courseterm@ucbcs \\
  \vspace{5pt}\hrule height 3pt
}{
  \hrule width 0pt height 3pt\vspace{10pt}
  \headerstyle@ucbcs
  \strut\courseno@ucbcs \\
  \strut\coursename@ucbcs \\
  \vspace{5pt}\hrule width 0pt height 3pt
}{
  \hrule width 0pt height 3pt\vspace{10pt}
  \headerstyle@ucbcs
  \strut\@title \\
  \vspace{0.5\baselineskip}
  \vspace{5pt}\hrule width 0pt height 3pt
}
% \RequirePackage{tikz} above changes this from -1in to -0.25in. I have no idea
% why.
%\extrafootheight{-1in}
\newcommand{\footerstyle@ucbcs}{\footnotesize}
\firstpagefooter{
  \footerstyle@ucbcs
  \strut \\ \vspace{1em}
  \textit{This content is protected and may not be shared, uploaded, or distributed.}
}{
  \footerstyle@ucbcs
  Page \thepage{} of \numpages
}{}
\runningfooter{
  \footerstyle@ucbcs
  \@title \\ \vspace{1em}
  \textit{This content is protected and may not be shared, uploaded, or distributed.}
}{
  \footerstyle@ucbcs
  Page \thepage{} of \numpages
}{
  \footerstyle@ucbcs
  \courseno@ucbcs{} -- \courseterm@ucbcs
}

% Exam question formatting.
\qformat{\bf {\Large{Q\thequestion}} \quad \textit{\thequestiontitle} \hfill (\totalpoints{} \points)}
\renewcommand{\partlabel}{Q\thequestion.\arabic{partno}}

% Redefine parts environment and uplevel command to prevent parts from being
% broken across pages.
\let\oldparts@ucbcs\parts
\let\endoldparts@ucbcs\endparts
\newif\ifprevpart@ucbcs
\newlength{\oldparskip@ucbcs}
\renewenvironment{parts}{
  \begin{oldparts@ucbcs}
  \let\oldpart@ucbcs\part
  \renewcommand{\part}{
    \ifprevpart@ucbcs
      \end{minipage}
    \fi
    \strut
    \setlength{\oldparskip@ucbcs}{\parskip}
    \begin{minipage}[t]{\linewidth}
    \setlength{\parskip}{\oldparskip@ucbcs}
    \prevpart@ucbcstrue
    \oldpart@ucbcs
  }
}{
  \end{minipage}
  \prevpart@ucbcsfalse
  \end{oldparts@ucbcs}
}
\let\olduplevel@ucbcs\uplevel
\renewcommand{\uplevel}[1]{
  \ifprevpart@ucbcs
    \end{minipage}
  \fi
  \olduplevel@ucbcs{#1}
  \ifprevpart@ucbcs
    \setlength{\oldparskip@ucbcs}{\parskip}
    \begin{minipage}[t]{\linewidth}
    \setlength{\parskip}{\oldparskip@ucbcs}
  \fi
}

% Redefine \pagebreak so it works in parts.
\let\oldpagebreak@ucbcs\pagebreak
\renewcommand{\pagebreak}{
  \ifprevpart@ucbcs
    \end{minipage}
  \fi
  \oldpagebreak@ucbcs
  \ifprevpart@ucbcs
    \start{minipage}
  \fi
}

% Multiple-choice formatting.
\newif{\ifcorrectchoice@ucbcs}
\newcommand{\coloredbubble@ucbcs}[1][none]{\tikz[baseline=-0.5ex]\draw[black,very thick,fill=#1] (0,0) circle (4.5pt);}
\newcommand{\bubble@ucbcs}{\coloredbubble@ucbcs}
\newcommand{\solbubble@ucbcs}{\coloredbubble@ucbcs[black]}
\newcommand{\choice}{\correctchoice@ucbcsfalse\item\ifanswerletters(\Alph{enumi})\fi\ }
\newcommand{\CorrectChoice}{\correctchoice@ucbcstrue\item\ifanswerletters(\Alph{enumi})\fi\ }
\newcommand{\numcols@ucbcs}{} % TODO Error if \renewcommand isn't called.
\renewenvironment{choices}[1][1]{
  \renewcommand{\numcols@ucbcs}{#1}
  \ifnum\numcols@ucbcs>1
    \begin{multicols}{\numcols@ucbcs}
  \fi
  \begin{enumerate}
    \renewcommand{\labelenumi}{\ifprintanswers\ifcorrectchoice@ucbcs\solbubble@ucbcs\else\bubble@ucbcs\fi\else\bubble@ucbcs\fi}
    \setlength{\itemsep}{\iflargeprint0.25em\else1em\fi}
}{
  \end{enumerate}
  \ifnum\numcols@ucbcs>1
    \end{multicols}
  \fi
}

% Select-all formatting.
% Use \ifcorrectchoice@ucbcs, \choice, \CorrectChoice, and \numcols@ucbcs from above.
\newcommand{\coloredselect@ucbcs}[1][none]{\tikz[baseline=0.1ex]\draw[black,very thick,fill=#1] (0,0) rectangle (8pt, 8pt);}
\newcommand{\select@ucbcs}{\coloredselect@ucbcs}
\newcommand{\solselect@ucbcs}{\coloredselect@ucbcs[black]}
\renewenvironment{checkboxes}[1][1]{
  \renewcommand{\numcols@ucbcs}{#1}
  \ifnum\numcols@ucbcs>1
    \begin{multicols}{\numcols@ucbcs}
  \fi
  \begin{enumerate}
    \renewcommand{\labelenumi}{\ifprintanswers\ifcorrectchoice@ucbcs\solselect@ucbcs\else\select@ucbcs\fi\else\select@ucbcs\fi}
    \setlength{\itemsep}{\iflargeprint0.25em\else1em\fi}
}{
  \end{enumerate}
  \ifnum\numcols@ucbcs>1
    \end{multicols}
  \fi
}

% listings formating.
\lstset{
  numbers=left,
  stepnumber=1,
  numbersep=5pt,
  showspaces=false,
  showstringspaces=false,
  showtabs=false,
  frame=single,
  tabsize=4,
  breaklines=true,
  breakatwhitespace=false,
}

% Large print.
\let\olddocument@ucbcs\document
\renewcommand{\document}{
  \iflargeprint
    \extraheadheight[0.8in]{-0.5in}
    \extrawidth{1in}
  \fi
  \olddocument@ucbcs
  \iflargeprint
    \LARGE
  \fi
}

\makeatother
