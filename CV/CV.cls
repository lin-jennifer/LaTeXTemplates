
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{CV}[Academic CV Class from Resume source]


\LoadClass[11pt,letterpaper]{article} 

\RequirePackage[T1]{fontenc}
\RequirePackage[a-1b]{pdfx}


%\usepackage{times}
\usepackage{calc}
\usepackage[shortcuts]{extdash}
\usepackage{hyperref}

\usepackage{graphicx} 

\reversemarginpar

\usepackage[paper=letterpaper,
            marginparwidth=1.2in,     % Length of section titles
            marginparsep=.075in,       % Space between titles and text
            margin=0.5in,               % 1 inch margins
            tmargin=0.65in,
            includemp,
            headsep=10pt]{geometry}

\setlength{\parindent}{0in}

\usepackage[shortlabels]{enumitem}



\makeatletter
\newlength{\bibhang}
\setlength{\bibhang}{0em}
\newlength{\bibsep}
{\@listi \global\bibsep\itemsep \global\advance\bibsep by\parsep}
\newlist{bibsection}{itemize}{3}
\setlist[bibsection]{label=,leftmargin=\bibhang,%
	itemindent=-\bibhang,
	itemsep=\bibsep,parsep=\z@,partopsep=0pt,
	topsep=0pt}
\newlist{bibenum}{enumerate}{3}
\setlist[bibenum]{label=[\arabic*],leftmargin={\bibhang+\widthof{[999]}},% resume 
	itemindent=-\bibhang,
	itemsep=0.05in,parsep=\z@,partopsep=0pt,
	topsep=0pt}
\let\oldendbibenum\endbibenum
\def\endbibenum{\oldendbibenum\vspace{-.6\baselineskip}}
\let\oldendbibsection\endbibsection
\def\endbibsection{\oldendbibsection\vspace{-.6\baselineskip}}
\makeatother


% For name and page number on top right of the page starting on second page
% Set Name in the CV.tex file
\usepackage{fancyhdr,lastpage}
\pagestyle{fancy}
%\pagestyle{empty}      % Uncomment this to get rid of page numbers
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyfootoffset{\marginparsep+\marginparwidth}
\rhead{\emph{\name} -- \thepage} 
\AtBeginDocument{\thispagestyle{empty}}
\newlength{\footpageshift}
\setlength{\footpageshift}
          {0.5\textwidth+0.5\marginparsep+0.5\marginparwidth-2in}
%\lfoot{\hspace{\footpageshift}%
%       \parbox{4in}{\, \hfill %
 %                   \arabic{page} of \protect\pageref*{LastPage} % +LP
%                    \arabic{page}                               % -LP
%                    \hfill \,}}


% Creates Section 
\renewcommand{\section}[1]{{\hspace*{-\marginparsep minus \marginparwidth}%
		\begin{minipage}[t]{\textwidth+\marginparwidth+\marginparsep}%
			\vspace{.2cm}
			\phantomsection\addcontentsline{toc}{section}{#1}
			{\LARGE \textbf {#1}}\\
			%\vspace{0.1cm}
			\medskip
			%\hrule
			\rule{\columnwidth}{1.2pt}
		\end{minipage}
	\par}
}

% Creates Subsection
\renewcommand{\subsection}[1]{\pagebreak[3]%
    \vspace{1.3\baselineskip}%
    \phantomsection\addcontentsline{toc}{subsection}{#1}%
    \noindent\llap{\scshape\smash{\parbox[t]{\marginparwidth}{\hyphenpenalty=10000\raggedright #1}}}%
    \vspace{-\baselineskip}\par}


% List commands
\newcommand*\fixendlist[1]{%
    \expandafter\let\csname preFixEndListend#1\expandafter\endcsname\csname end#1\endcsname
    \expandafter\def\csname end#1\endcsname{\csname preFixEndListend#1\endcsname\vspace{-0.6\baselineskip}}}

\let\originalItem\item
\newcommand*\fixouterlist[1]{%
    \expandafter\let\csname preFixOuterList#1\expandafter\endcsname\csname #1\endcsname
    \expandafter\def\csname #1\endcsname{\let\oldItem\item\def\item{\pagebreak[2]\oldItem}\csname preFixOuterList#1\endcsname}
    \expandafter\let\csname preFixOuterListend#1\expandafter\endcsname\csname end#1\endcsname
    \expandafter\def\csname end#1\endcsname{\let\item\oldItem\csname preFixOuterListend#1\endcsname}}
\newcommand*\fixinnerlist[1]{%
    \expandafter\let\csname preFixInnerList#1\expandafter\endcsname\csname #1\endcsname
    \expandafter\def\csname #1\endcsname{\let\oldItem\item\let\item\originalItem\csname preFixInnerList#1\endcsname}
    \expandafter\let\csname preFixInnerListend#1\expandafter\endcsname\csname end#1\endcsname
    \expandafter\def\csname end#1\endcsname{\csname preFixInnerListend#1\endcsname\let\item\oldItem}}

\newlist{outerlist}{itemize}{3}
    \setlist[outerlist]{label=\enskip\textbullet,leftmargin=*}
    \fixendlist{outerlist}
    \fixouterlist{outerlist}

\newlist{lonelist}{itemize}{3}
    \setlist[lonelist]{label=\enskip\textbullet,leftmargin=*,partopsep=0pt,topsep=0pt}
    \fixendlist{lonelist}
    \fixouterlist{lonelist}

\newlist{innerlist}{itemize}{3}
    \setlist[innerlist]{label=\enskip\textbullet,leftmargin=*,parsep=0pt,itemsep=0pt,topsep=0pt,partopsep=0pt}
    \fixinnerlist{innerlist}

\newlist{loneinnerlist}{itemize}{3}
    \setlist[loneinnerlist]{label=\enskip\textbullet,leftmargin=*,parsep=0pt,itemsep=0pt,topsep=0pt,partopsep=0pt}
    \fixendlist{loneinnerlist}
    \fixinnerlist{loneinnerlist}

\newcommand{\blankline}{\quad\pagebreak[3]}
\newcommand{\halfblankline}{\quad\vspace{-0.5\baselineskip}\pagebreak[3]}

\usepackage{doi}
\usepackage{url}

\urlstyle{same}
\providecommand*\emaillink[1]{\nolinkurl{#1}}
\providecommand*\email[1]{\href{mailto:#1}{\emaillink{#1}}}






