\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cs161}[2022/01/14 v1.0 by Nicholas Ngai]

\LoadClass{exam}

\RequirePackage[T1]{fontenc}
\RequirePackage{sectsty}

\makeatletter

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

\makeatother
