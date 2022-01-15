\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cs161}[2022/01/14 v1.0 by Nicholas Ngai]

\LoadClass[addpoints]{exam}

\RequirePackage[T1]{fontenc}
\RequirePackage[tt=false]{libertine}
\RequirePackage{microtype}
\RequirePackage{multicol}
\RequirePackage[straightquotes]{newtxtt}
\RequirePackage{sectsty}
\RequirePackage{tikz}
\RequirePackage{hyperref}

\makeatletter

% Config.
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
\extrafootheight{-0.25in}
\newcommand{\footerstyle@ucbcs}{\footnotesize}
\firstpagefooter{}{
  \footerstyle@ucbcs
  Page \thepage{} of \numpages
}{}
\runningfooter{
  \footerstyle@ucbcs
  \@title
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

% Multiple-choice formatting.
\newif{\ifcorrectchoice@ucbcs}
\newcommand{\coloredbubble@ucbcs}[1][none]{\tikz[baseline=-0.5ex]\draw[black,very thick,fill=#1] (0,0) circle (0.5em);}
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
    \setlength{\itemsep}{1em}
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
    \setlength{\itemsep}{1em}
}{
  \end{enumerate}
  \ifnum\numcols@ucbcs>1
    \end{multicols}
  \fi
}

\makeatother
