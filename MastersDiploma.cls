\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{MastersDiploma}[2018/02/08]
\LoadClass[14pt,a4paper]{extreport}

%========================================================================================================
%
%										Налаштування опцій класу
%
%========================================================================================================
\newif\ifelectronic
\DeclareOption{print}{
	\PassOptionsToPackage{colorlinks=false}{hyperref}
	\PassOptionsToPackage{pdfsubject={Version for Printing}}{hyperref}
	\electronicfalse
}

\DeclareOption{electronic}{
	\PassOptionsToPackage{colorlinks=true}{hyperref}
	\PassOptionsToPackage{pdfsubject={Electronic Version}}{hyperref}
	\electronicfalse
}

\ExecuteOptions{electronic}
\ProcessOptions\relax

%========================================================================================================
%
%										Геометрія сторінки
%
%========================================================================================================
\RequirePackage[%\\
	%showframe,
	a4paper,%
	footskip=0cm,%
	headsep=0.5cm,%
	top=2cm, %поле сверху
	bottom=2cm, %поле снизу
	left=2cm, %поле ліворуч
	right=1cm, %поле праворуч
]{geometry}
\RequirePackage{changepage}
\RequirePackage[figure,table]{totalcount}
%========================================================================================================
%
%										Налаштування мови та компіляторів
%
%========================================================================================================

\RequirePackage{ifluatex,ifxetex}
\newif\ifxetexorluatex
\ifxetex
	\xetexorluatextrue
\else
	\ifluatex
		\xetexorluatextrue
	\else
		\xetexorluatexfalse
	\fi
\fi
\ifxetexorluatex
	\usepackage{fontspec}
	\setsansfont{CMU Sans Serif}%{Arial}
	\setmainfont{CMU Serif}%{Times New Roman}
	\setmonofont{CMU Typewriter Text}%{Consolas}
	\defaultfontfeatures{Ligatures={TeX}}
\else
	\RequirePackage[T2A,T1]{fontenc}
	\RequirePackage[utf8]{inputenc}
	\input{glyphtounicode}
	\pdfgentounicode=1
	%\RequirePackage{pscyr}
	\RequirePackage{cmap}
	\renewcommand{\sfdefault}{fos}
	\renewcommand{\bfdefault}{b}
\fi
\RequirePackage[english,russian,ukrainian]{babel}

%========================================================================================================
%
%										Налаштування бібліографії
%
%========================================================================================================


\usepackage[backend=biber, style=gost-numeric, sorting=none, babel=other, isbn=true, url=false]{biblatex}
\newbibmacro{string+url}[1]{%
	\iffieldundef{url}{#1}{\href{\thefield{url}}{#1}}%
}
\DeclareFieldFormat{title}{\usebibmacro{string+url}{#1}}
% Не підтримується Укрю.мова!!!
\DefineBibliographyStrings{ukrainian}{%
	bibliography = {ПЕРЕЛІК ПОСИЛАНЬ},
}

\renewcommand*{\mkbibhdnamefamily}[1]{#1}

\RequirePackage{csquotes}
\RequirePackage{totcount}
\newtotcounter{citenum}
\AtEveryBibitem{\stepcounter{citenum}}


%========================================================================================================
%
%										Налаштування типографських вимог
%
%========================================================================================================

\RequirePackage{microtype}
%\ifluatex
%	\RequirePackage[nosingleletter, hyphenation, lastparline]{impnattypo}
%\fi
\usepackage[all]{nowidow}
%\clubpenalty =1000
%\widowpenalty=1000

%========================================================================================================
%
%										Пакети
%
%========================================================================================================

\RequirePackage[overload]{textcase}
\RequirePackage{xurl}
\let\MakeUppercase\MakeTextUppercase
\RequirePackage{indentfirst}
% ------------------------------------ Плаваючі об'єкти -------------------------------------------------
%\RequirePackage{caption,subfigure}
\RequirePackage{subfig}
\RequirePackage{graphicx}
\RequirePackage{float}
\renewcommand\thesubfigure{\alph{subfigure}}
\RequirePackage{wrapfig}
% ------------------------------------ Математика -------------------------------------------------------
\ifluatex
	\RequirePackage{lualatex-math}
	\RequirePackage{amsmath}
	\RequirePackage[math-style=TeX,bold-style=TeX]{unicode-math}
\else
	\RequirePackage{amsfonts}
	\RequirePackage{amssymb}
\fi
\RequirePackage{currfile}
% ---------------------------------------- Таблиці ------------------------------------------------------
\usepackage{longtable}
\usepackage{makecell}
	\renewcommand\theadfont{\normalsize}
\usepackage{array,ragged2e}
\setlength\arrayrulewidth{1pt}
\RequirePackage{booktabs}
\RequirePackage{tabularx}
\newcolumntype{R}{>{\footnotesize}r}
\newcolumntype{L}{>{\footnotesize}l}
\RequirePackage{tabularray}
\RequirePackage{varwidth}
\usepackage{adjustbox}
\RequirePackage{setspace}
\newcolumntype{M}[1]{>{\begin{varwidth}[t]{#1}}l<{\end{varwidth}}}
\newcommand{\centercell}[1]{\multicolumn{1}{c}{#1}}
\newcommand{\specialcell}[3][c]{%
	\begin{tabular}[#1]{@{}#2@{}}#3\end{tabular}}
\RequirePackage{colortbl}
\setlength{\aboverulesep}{0pt}
\setlength{\belowrulesep}{0pt}
\setlength{\extrarowheight}{0.75ex}
\RequirePackage{multirow}
% ------------------------------------- Пакети LaTeX3 ---------------------------------------------------
\RequirePackage{xparse}
% -------------------------------------------------------------------------------------------------------
\RequirePackage{lastpage}
\RequirePackage{pdftexcmds}
\usepackage{tikz}
\usetikzlibrary{calc, tikzmark}
\usepackage{pgfplots}
\usepgfplotslibrary{units}
\pgfplotsset{compat=newest}
%========================================================================================================
%
%										Хімічні формули
%
%========================================================================================================

\RequirePackage{mhchem}

%========================================================================================================
%
%										    Інтервали
%
%========================================================================================================
\renewcommand{\baselinestretch}{1.5}
\setlength{\parindent}{1cm}%


%========================================================================================================
%
%										   Рубрикація
%
%========================================================================================================
\RequirePackage{titlesec, titletoc}
\def\@period{.}
\let\cleardoublepage\clearpage

% ---------------------------------------- Лічильник зносок починаються з кожної сторінки ---------------
\@newctr{footnote}[page]
% ---------------------------------------- Верстка ЗМІСТУ для Розділів ----------------------------------

\titlecontents{chapter}% <section-type>
[0pt]% <left>
{}% <above-code>
{\ifappendix\renewcommand{\@chapapp}{\appendixname}\fi\MakeUppercase{\@chapapp}\ \thecontentslabel\@period\ }% <numbered-entry-format>
{}% <numberless-entry-format>
{\titlerule*[0.85pc]{.}\contentspage}% <filler-page-format>

\titlecontents{section}% <section-type>
[2em]% <left>
{}% <above-code>
{\ifappendix\appendixname\ \fi\thecontentslabel\@period\ }% <numbered-entry-format>
{}% <numberless-entry-format>
{\titlerule*[0.75pc]{.}\contentspage}% <filler-page-format>\\

\titlecontents{subsection}% <section-type>
[3.9em]% <left>
{}% <above-code>
{\ifappendix\appendixname\ \fi\thecontentslabel\@period\ }% <numbered-entry-format>
{}% <numberless-entry-format>
{\titlerule*[0.75pc]{.}\contentspage}% <filler-page-format>\\\\

% ---------------------------------------- Верстка РОЗДІЛІВ ---------------------------------------------
\setcounter{secnumdepth}{5}

\newif\ifappendix

\assignpagestyle{\chapter}{main}
%\titleformat{\chapter}[display]
%{\bfseries\filcenter}
%{\MakeUppercase{\chaptertitlename} \thechapter}
%{1em}
%{\MakeUppercase}{}


\titleformat{\chapter}[display]
{\bfseries\filcenter}
{\MakeUppercase{\@chapapp}\ \thechapter\@period}
{1em}
{\MakeUppercase}{}

\titleformat{\section}[block]
{\bfseries\hspace{\parindent}}
{\ifappendix\appendixname\ \fi\thesection\@period\ }
{1ex}{}

\titleformat{\subsection}[block]
{\bfseries\hspace{\parindent}}
{\thesubsection\@period\ }
{1ex}{}

\titleformat{\subsubsection}[block]
{\hspace{\parindent}}
{\thesubsubsection\@period\ }
{1ex}{}

%
\titlespacing*{\chapter}{0pt}% left
{-30pt}% before
{2em} % after
\titlespacing*{\section}{0pt}{2em}{2em}
\titlespacing*{\subsection}{0pt}{2em}{2em}
% ---------------------------------------- Верстка ДОДАТКІВ ---------------------------------------------

\newcommand\appendixone[1]{\par
	\gdef\thechapter{\@Alph\c@chapter}
	\@addtoreset{table}{section}
	\renewcommand\thetable%
	{\thechapter.\@arabic\c@table}
	\setcounter{chapter}{0}%
	\setcounter{section}{0}%
	\clearpage\pagestyle{main}
	\appendixtrue
	\addtocontents{toc}{\protect\appendixtrue}
	\renewcommand{\@chapapp}{\appendixname}
	\if@twocolumn
		\@restonecoltrue\onecolumn
	\else
		\@restonecolfalse
	\fi
	\chapter{#1}%
	%	\addcontentsline{toc}{chapter}{\appendixnames}
	\if@restonecol\twocolumn\fi
}


\renewcommand\appendix{\par
	\gdef\thesection{\@Alph\c@section}
	\@addtoreset{table}{section}
	\renewcommand\thetable%
	{\thesection.\@arabic\c@table}
	\setcounter{chapter}{0}%
	\setcounter{section}{0}%
	\clearpage\pagestyle{main}
	\appendixtrue
	\addtocontents{toc}{\protect\appendixtrue}
	\if@twocolumn
		\@restonecoltrue\onecolumn
	\else
		\@restonecolfalse
	\fi
	\def\appendixnames{ДОДАТКИ}
	\chapter*{\appendixnames}%
	\addcontentsline{toc}{chapter}{\appendixnames}
	\if@restonecol\twocolumn\fi
}

%========================================================================================================
%
%										Колонтитули
%
%========================================================================================================
\def\ps@main{%

	\renewcommand{\@oddhead}%
	{\hfill\thepage%
	}%

	\renewcommand{\@evenhead}%
	{\thepage\hfill%
	}%

	\renewcommand{\@oddfoot}{\@empty}
	\renewcommand{\@evenfoot}{\@empty}

}

%========================================================================================================
%
%										Підписи під таблицями, рисунками та списки
%
%========================================================================================================
\RequirePackage[skip=5pt]{caption}
\DeclareCaptionLabelFormat{rightlabel}{\hfill #1~#2}
\captionsetup[figure]{font=small, format=plain, justification=centerlast, labelsep=period, skip=12pt}
\renewcommand{\belowcaptionskip}{15pt}
\captionsetup[table]{font=small, position=above, labelformat=rightlabel, labelsep=newline,justification=centering}
\RequirePackage[inline]{enumitem}
\setlist{nolistsep}
\renewcommand{\labelitemi}{-}
\renewcommand{\labelenumi}{\arabic{enumi})}
\renewcommand{\labelenumii}{\alph{enumii})}
\setenumerate{align=left,leftmargin=0pt,labelindent=\parindent,%
	labelwidth=0pt,labelsep=1ex,listparindent=\parindent,%
	itemindent=\dimexpr\labelindent+\labelwidth+\labelsep-\leftmargin}

% ------------------------------------------------ Відступи в формулах ----------------------------------
	\setlength\abovedisplayskip{1ex}
	\setlength\belowdisplayskip{1ex}
	\setlength\abovedisplayshortskip{1ex}
	\setlength\belowdisplayshortskip{1ex}
% ----------------------------------------- Відступ між написом та рисунком -----------------------------

\setlength{\textfloatsep}{5pt}

% --------------------------------------------- Bibliography spacing ------------------------------------
%\newlength{\bibitemsep}\setlength{\bibitemsep}{.1\baselineskip plus .05\baselineskip minus .05\baselineskip}
\newlength{\bibparskip}\setlength{\bibparskip}{0pt}
\let\oldthebibliography\thebibliography
\renewcommand\thebibliography[1]{%
	\oldthebibliography{#1}%
	\setlength{\parskip}{\bibitemsep}%
	\setlength{\itemsep}{\bibparskip}%
}

%========================================================================================================
%
%										Команди для титульних сторінок
%
%========================================================================================================
\newcounter{tmark}\setcounter{tmark}{0}
\newcommand{\mfield}[5]{%
	\settowidth{\@tempdima}{#2}%
	\settowidth{\@tempdimb}{#3}%
	\stepcounter{tmark}%
	\setlength{\@tempdimc}{\dimexpr #1 - \@tempdimb - \@tempdima}%
	% #1 = total width
	% #2 = text on the left
	% #3 = text on the right
	% #4 = text above the rule
	% #5 = text below the rule
	#2\rule[-0.2\baselineskip]{\@tempdimc}{0.5pt}\tikzmark{\thetmark}#3%
	\begin{tikzpicture}[overlay,remember picture]
		\node at ([xshift=-(\@tempdimc/2),yshift=.15\baselineskip]pic cs:\thetmark) {#4};
		\node at ([xshift=-(\@tempdimc/2),yshift=-.6\baselineskip]pic cs:\thetmark) {\scriptsize #5};
	\end{tikzpicture}%
	\vspace*{1ex}%
}

%========================================================================================================
%
%										            HYPERREF
%
%========================================================================================================

\RequirePackage[%
	bookmarks = true,
	bookmarksnumbered=true,
	unicode,
	linktocpage = true,
	hypertexnames=false,
	pdftoolbar=false,
	pdfpagelayout=TwoPageRight,
	pdfauthor={},
	pdfdisplaydoctitle=true,
	pdfkeywords={Masters Diploma},
	pdfencoding=auto
]%
{hyperref}

% ------------------------------------ Патч для україомовної назви розділу для nameref ------------------ %
\addto\extrasukrainian{%
	\renewcommand{\chapterautorefname}{}%
}
% ------------------------------------------------------------------------------------------------------- %
\def\permille{\ensuremath{{}^\text{o}\mkern-5mu/\mkern-3mu_\text{oo}}}
\let\@udcprint\@empty
\def\udc#1{%
	\if\relax\detokenize{#1}\relax
	\else
		\def\@udcprint{\hskip1ex#1}
	\fi
}

%========================================================================================================
%
%										            Titlepage
%
%========================================================================================================

\let\@retsenzent\@empty
\def\retsenzent#1{%
	\if\relax\detokenize{#1}\relax
	\else
		\def\@retsenzent{#1}
	\fi
}

\let\@konsultant\@empty
\def\konsultant#1{%
	\if\relax\detokenize{#1}\relax
	\else
		\def\@konsultant{#1}
	\fi
}

\let\@kerivnyk\@empty
\def\kerivnyk#1{%
	\if\relax\detokenize{#1}\relax
	\else
		\def\@kerivnyk{#1}
	\fi
}

\let\@kurs\@empty
\def\kurs#1{%
	\if\relax\detokenize{#1}\relax
	\else
		\def\@kurs{#1}
	\fi
}

\let\@grupa\@empty
\def\grupa#1{%
	\if\relax\detokenize{#1}\relax
	\else
		\def\@grupa{#1}
	\fi
}

\AtBeginDocument{\hypersetup{pdftitle={\@title}}}
\AtBeginDocument{%
	\let\phi\varphi
	\let\epsilon\varepsilon
	\DeclareMathOperator{\const}{const}
}

\let\@specialnist\@empty
\def\specialnist#1{%
	\if\relax\detokenize{#1}\relax
	\else
	\def\@specialnist{%
		#1
	}%
	\fi
}

\let\@authorinitials\@empty
\def\authorinitials#1{%
	\if\relax\detokenize{#1}\relax
	\else
	\def\@authorinitials{%
		#1
	}%
	\fi
}


\def\titlepage{%
	\newgeometry{
		showframe,
		footskip=0cm,%
		headsep=0cm,%
		top=1cm, %поле сверху
		bottom=1cm, %поле снизу
		left=2cm, %поле ліворуч
		right=1cm, %поле праворуч
	}
	\thispagestyle{empty}
	\begin{center}\bfseries
%		\MakeUppercase{Міністерство освіти і науки України}\\
		\MakeUppercase{Національний Технічний Університет України}\\
		\MakeUppercase{<<Київський політехнічний інститут}\\ \MakeLowercase{імені} 	\MakeUppercase{Ігоря Сікорського>>}\\
		\MakeUppercase{Навчально-науковий Фізико-технічний інститут}\\
		\MakeUppercase{Кафедра прикладної фізики}
	\end{center}

	\noindent%
	\begin{minipage}[t]{0.5\linewidth}
%		<<На правах рукопису>>\\
%		УДК~\@udcprint\\
	\end{minipage}
	\hfill\begin{minipage}[t]{0.5\linewidth}
		<<До захисту допущено>>\\
		В. о. завідувача кафедри\\
		\mfield{0.2\linewidth}{}{}{}{(підпис)} \mfield{0.75\linewidth}{}{}{Г.~Є.~Монастирський}{(ініціали, прізвище)}\\

		%\mfield{0.1\linewidth}{<<}{>>}{\methodcomday}{} \mfield{0.55\linewidth}{}{}{\methodcommonth}{}~\the\year~р.\\
	\end{minipage}

	\begin{center}
		{\Large\bfseries Магістерська дисертація}\\
		{\bfseries на здобуття ступеня магістра}\\
	\end{center}
	\vskip2ex
	\mfield{\textwidth}{зі спеціальності}{}{\@specialnist }{(код і назва)}

    \savebox{\@tempboxa}{на тему: }
	\noindent\begin{minipage}[t]{\wd\@tempboxa}
		\usebox\@tempboxa
	\end{minipage}
	\begin{minipage}[t]{\dimexpr\textwidth - \wd\@tempboxa}
		\bfseries \@title
	\end{minipage}

	\vfill

	\noindent\mfield{6cm}{Виконав: студент}{курсу}{\@kurs}{}, \mfield{5cm}{групи}{}{\@grupa}{}

	\noindent\mfield{0.8\textwidth}{}{}{\@author}{(прізвище, ім’я, по батькові)} \mfield{0.2\textwidth}{}{}{}{(підпис)}

	\vfill

	\noindent\mfield{0.8\textwidth}{Науковий керівник}{}{\@kerivnyk}{(посада, науковий ступінь, вчене звання, прізвище та ініціали)} \mfield{0.2\textwidth}{}{}{}{(підпис)}

	\noindent\mfield{0.3\textwidth}{Консультант}{}{2, 3}{(номер розділу)} \mfield{0.49\textwidth}{}{}{\@konsultant}{(посада, науковий ступінь, вчене звання, прізвище та ініціали)} \mfield{0.2\textwidth}{}{}{}{(підпис)}

	\noindent\mfield{0.8\textwidth}{Рецензент}{}{\@retsenzent}{(посада, науковий ступінь, вчене звання, прізвище та ініціали)} \mfield{0.2\textwidth}{}{}{}{(підпис)}

	\vfill

	\hfill\begin{minipage}[t]{0.5\linewidth}
		\linespread{1.0}\selectfont
		Засвідчую, що у цій дипломній роботі немає запозичень з праць інших авторів без відповідних посилань.
		\vspace*{1ex}

		\mfield{6cm}{Студент}{}{}{(підпис)}
	\end{minipage}

	\vfill

	\begin{center}
		Київ -- \the\year
	\end{center}
	\restoregeometry
}

\let\@univapproved\@empty
\def\univapproved#1#2#3#4{%
		\if\relax\detokenize{#1}\relax
			\else
			\if\relax\detokenize{#2}\relax
				\else
				\if\relax\detokenize{#3}\relax
					\else
					\if\relax\detokenize{#4}\relax
						\else
							\def\@univapproved{%
							\mfield{0.1\textwidth}{<<}{>>}{#1}{}\mfield{0.2\textwidth}{}{#3}{#2}{} №\ #4
							}%
					\fi
				\fi
			\fi
		\fi
}

\let\@submission\@empty
\def\submission#1#2#3{%
	\if\relax\detokenize{#1}\relax
		\else
			\if\relax\detokenize{#2}\relax
				\else
					\if\relax\detokenize{#3}\relax
						\else
							\def\@submission{%
								\mfield{0.15\textwidth}{<<}{>>}{#1}{}\mfield{0.3\textwidth}{}{#3}{#2}{}
							}%
					\fi
			\fi
		\fi
}

\let\@issuing\@empty
\def\issuing#1#2#3{%
	\if\relax\detokenize{#1}\relax
	\else
	\if\relax\detokenize{#2}\relax
	\else
	\if\relax\detokenize{#3}\relax
	\else
	\def\@issuing{%
		\mfield{0.15\textwidth}{<<}{>>}{#1}{}\mfield{0.3\textwidth}{}{#3}{#2}{}
	}%
	\fi
	\fi
	\fi
}

\let\@searchobject\@empty
\def\searchobject#1{%
	\if\relax\detokenize{#1}\relax
	\else
	\def\@searchobject{%
		#1
	}%
	\fi
}


\let\@predmet\@empty
\def\predmet#1{%
	\if\relax\detokenize{#1}\relax
	\else
	\def\@predmet{%
		#1
	}%
	\fi
}

\let\@tasks\@empty
\def\tasks#1{%
	\if\relax\detokenize{#1}\relax
	\else
	\def\@tasks{%
		#1
	}%
	\fi
}

\let\@illustrations\@empty
\def\illustrations#1{%
	\if\relax\detokenize{#1}\relax
	\else
	\def\@illustrations{%
		#1
	}%
	\fi
}

\let\@publications\@empty
\def\publications#1{%
	\if\relax\detokenize{#1}\relax
	\else
	\def\@publications{%
		#1
	}%
	\fi
}
\tikzset{
	double arrow_1/.style args={#1 colored by #2 and #3 and #4}{
		-stealth,line width=#1,#2,#4, % first arrow
		postaction={draw,-stealth,#3,#4,line width=(#1)/3,
			shorten <=(#1)/4,shorten >=2*(#1)/3} % second arrow
	}
}
\tikzset{
	double arrow_2/.style args={#1 colored by #2 and #3 and #4}{
		-stealth,line width=#1,#2,#4, % first arrow
		postaction={draw,-stealth,#3,#4,line width=(#1)/3,
			shorten <=(#1)/1.5,shorten >=2*(#1)/5} % second arrow
	}
}
\endinput