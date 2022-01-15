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
\extrafootheight{-1in}
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

\makeatother
