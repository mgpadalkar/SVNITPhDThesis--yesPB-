\ProvidesClass{SVNITPhDThesisPB}
%------------------------------------------------------------------------------
% thanks to : Ankur Dave's Tutorial (http://blog.ankurdave.com/2009/04/creating-your-own-latex-document-class.html)
% author : Milind Padalkar (milind.padalkar@gmail.com)
% supported by: Dr. Shailaja Patil (shailaja.patil11@gmail.com)
% motivation: All my friends in M.Tech. & PhD
% first created : Created as SVNITPhDReport.cls sometime in 2010.
% last modified on : 11-12-2013
% version : 13.12.11
% Adds page border to initial pages. Requires compilation using LaTeX=>PS=PDF
% based on: SVNITPhDReport.cls v12.11.20 used by Dr. Shailaja Patil
%------------------------------------------------------------------------------
% This class file is provided without any warranty and may be modified by the users at their own risk.
%------------------------------------------------------------------------------


\LoadClass[12pt]{report}

%User Created Fields
\makeatletter
\RequirePackage{ifthen}
	\newcommand{\PhDYears}[1]{\def \@PhDYears {#1}}
	\newcommand{\thesisType}[1]{\def \@thesisType {#1}}
	\newcommand{\course}[1]{\def \@course {#1}}
	\newcommand{\instlogo}[1]{\def \@instlogo {#1}}
	\newcommand{\dept}[1]{\def \@dept {#1}}
	\newcommand{\supervisorI}[1]{\def \@supervisorI {#1}}
	\newcommand{\stitleI}[1]{\def \@stitleI {#1}}	
	\newcommand{\stitleO}[1]{\def \@stitleO {#1}}		
	\newcommand{\supervisorD}[1]{\def \@supervisorD {#1}}
	\newcommand{\regno}[1]{\def \@regno {#1}}
	\newcommand{\countryInst}[1]{\def \@countryInst {#1}}
	\newcommand{\pinInst}[1]{\def \@pinInst {#1}}
	\newcommand{\addressInstN}[1]{\def \@addressInstN {#1}}
	\newcommand{\addressInstI}[1]{\def \@addressInstI {#1}}
	\newcommand{\addressInstD}[1]{\def \@addressInstD {#1}}
	\newcommand{\addressInstP}[1]{\def \@addressInstP {#1}}
	\newcommand{\acMonth}[1]{\def \@acMonth {#1}}
	\newcommand{\acYear}[1]{\def \@acYear {#1}}
	\newcommand{\calYear}[1]{\def \@calYear {#1}}
	\newcommand{\atitle}[1]{
		\def \@atitle {#1}
		%To place "his" when "mr or Mr or mr. or Mr." else "her"
		\ifthenelse{\equal{#1}{Mr.}}{\def \person {his}}{\relax}
		\ifthenelse{\equal{#1}{Mr}}{\def \person {his}}{\relax}
		\ifthenelse{\equal{#1}{mr.}}{\def \person {his}}{\relax}
		\ifthenelse{\equal{#1}{mr}}{\def \person {his}}{\relax}
		\ifthenelse{\equal{#1}{Ms.}}{\def \person {her}}{\relax}
		\ifthenelse{\equal{#1}{Ms}}{\def \person {her}}{\relax}
		\ifthenelse{\equal{#1}{ms.}}{\def \person {her}}{\relax}
		\ifthenelse{\equal{#1}{ms}}{\def \person {her}}{\relax}
		\ifthenelse{\equal{#1}{Mrs.}}{\def \person {her}}{\relax}
		\ifthenelse{\equal{#1}{Mrs}}{\def \person {her}}{\relax}
		\ifthenelse{\equal{#1}{mrs.}}{\def \person {her}}{\relax}
		\ifthenelse{\equal{#1}{mrs}}{\def \person {her}}{\relax}
	}
	\PhDYears{}
	\thesisType{}
	\course{}
	\instlogo{}
	\dept{}
	\supervisorI{}
	\supervisorD{}
	\stitleI{}
	\stitleO{}
	\regno{}
	\countryInst{}
	\pinInst{}
	\addressInstN{}
	\addressInstI{}
	\addressInstD{}
	\addressInstP{}
	\acMonth{}
	\acYear{}
	\calYear{}
	\atitle{}
\makeatother

%margins
\RequirePackage[a4paper]{geometry}
%\geometry{vmargin={2.54cm,2.54cm},hmargin={3.17cm,3.17cm},includefoot}
\geometry{vmargin={1in,1in},hmargin={1in,1in},includefoot}

%spacing
\RequirePackage{setspace}
\setstretch{1.5}

%figures
\RequirePackage{graphicx}

%proper underlining
\RequirePackage[normalem]{ulem}

%For landscape page
\RequirePackage{lscape}
% Usage : \begin{landscape}\end{landscape}

%For Hyperlinks within the document
\RequirePackage[]{hyperref}
\hypersetup{
    colorlinks=true,
    pdfborder={0 0 0},
}

%%Colors
\RequirePackage{xcolor}
\definecolor{white}{rgb}{1.0,1.0,1.0}
\definecolor{black}{rgb}{0.0,0.0,0.0}
\definecolor{bordercol}{rgb}{0.0,0.12,0.48}
% Package for special latin fonts
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}


%For page borders using PSTRICKS
\RequirePackage{pst-node}% http://ctan.org/pkg/pstricks
\RequirePackage{eso-pic}% http://ctan.org/pkg/eso-pic

%Custom border page command
\newcommand{\addpageborder}{
	\AddToShipoutPictureBG{%
		\begin{pspicture}(\paperwidth,\paperheight)
			\psset{xunit=\the\paperwidth,yunit=\the\paperheight,nodesep=1.5cm}
			\pnode(1,1){page.northeast}%
			\pnode(0,0){page.southwest}%
			%In
			\psframe[cornersize=relative,linestyle=solid,linewidth=3pt,linecolor=bordercol,framearc=0.0](0.060,0.044)(0.930,0.955)
			%Out
			\psframe[cornersize=relative,linestyle=solid,linewidth=1pt,linecolor=bordercol,framearc=0.0](0.056,0.040)(0.934,0.959)			
		\end{pspicture}
	}
}

%Clear border for a page
\newcommand{\clearpageborder}{
	\ClearShipoutPicture
}

% For numbering subsubsections
\setcounter{secnumdepth}{3}

%fonts
\newcommand*{\monocor}[1]{\usefont{T1}{pzc}{b}{n}#1\normalfont} %similar to Monotype Corsiva (ZapfChancery)
\newcommand*{\timesnr}[1]{\usefont{T1}{ptm}{m}{n}#1\normalfont} %Times New Roman
\newcommand*{\helveticaf}[1]{\usefont{T1}{phv}{b}{n}#1\normalfont} %Helvetica Extra bold with caps
\newcommand*{\courierf}[1]{\usefont{T1}{pcr}{m}{n}#1\normalfont} %Courier
\newcommand*{\avantf}[1]{\usefont{T1}{pag}{m}{n}#1\normalfont} %Avant
\newcommand*{\centuryf}[1]{\usefont{T1}{pnc}{m}{n}#1\normalfont} %Century
\newcommand*{\concretef}[1]{\usefont{T1}{ccr}{m}{n}#1\normalfont} %Concrete



%Title Page
\makeatletter
\def \maketitle{
%	\newgeometry{vmargin={1.54cm,1.54cm},hmargin={3.17cm,3.17cm}}
	\begin{titlepage}
		\begin{center}
			\vspace*{10pt}			
			
			%line1
			\courierf{
				\textbf{
					\Large
					\textcolor{black}{PhD \@thesisType}
					\normalsize
				}
			} \\ \vspace*{5pt}
				%line3
						\timesnr{
							\parbox{0.65\textwidth}{
								\centering
								\textbf{
									\small
									\textcolor{black}{\expandafter\lowercase\expandafter{entitled}}
								%	\textcolor{black}{entitled}}
									\normalsize
								}
							}
						} \\ \vspace*{20pt}
			
			
			%line3
			\timesnr{
				\parbox{0.65\textwidth}{
					\centering
					\textbf{
						\Large
						\textcolor{black}{\expandafter\uppercase\expandafter{\@title}}
						\normalsize
					}
				}
			} \\ \vspace*{15pt}
			
			%line4
			\timesnr{
			\parbox{0.65\textwidth}{
			\centering
			\textbf{
			\small
			\textcolor{black}{\footnotesize Submitted in partial fulfillment \\ for \\ the award of the degree of \normalsize } %\newline for \newline the award of the degree of \normalsize} 					
					%\centering for \newline  \centering the award of the degree of \normalsize}
				}
			} 
			}\\ \vspace*{15pt}
		 	\timesnr{
		 		\parbox{0.65\textwidth}{
		 				\centering
		 	%					 				\fontsize{18mm}{18mm}\selectfont
		 				\textbf{
		 				\Huge
%		 				\textcolor{black}{{\textcalligra\monocor{\Huge Doctor of Philosophy}}}
		 				\textcolor{black}{{\monocor{\Huge Doctor of Philosophy}}}
		 						%\centering for \newline  \centering the award of the degree of \normalsize}
		 					}
		 					}
		 			}\\ \vspace*{5pt}
		 				%line6-a
			\timesnr{
				\textbf{
					\small
					\textcolor{black}{\lowercase{by}}
					\normalsize
				}
			} \\ \vspace*{2pt}
			
			%line6-b
			\concretef{
						\textbf{
							\large
							\textcolor{black}{\@atitle\ \@author \\
							({\expandafter\uppercase\expandafter{\@regno}}) % % 
							}
							\normalsize
						}
					} \\ \vspace*{10pt}
			
			%line7-a
			\timesnr{
				\textbf{
					\footnotesize
					\textcolor{black}{Supervisor}
					\normalsize
				}
			} \\ \vspace*{-3pt}
			
			%line7-b
			\concretef{
				\textbf{
					\Large
					\textcolor{black}{\@stitleI\ \@supervisorI}
					\normalsize
				}
			} \\ \vspace*{30pt}
			
			%line8
			\ifx \@instlogo \@empty
				\relax
			\else			
				\includegraphics[width=0.25\textwidth]{\@instlogo} \\ \vspace*{-10pt}
			\fi
			
			%line9
		\timesnr{
			\textbf{
				\large % % 
				\textcolor{black}{\@acMonth, \@calYear}
				%\textcolor{black}{\@acMonth,\@calYear}
				\normalsize
				}
			 } \\ \vspace*{10pt}
			
			%line10-a
			\centuryf{
				\textbf{
					\Large
					\textcolor{black}{Department of \@dept}
					\normalsize
				}
			} \\ \vspace*{4pt}
			
			%line10-b
			\concretef{
				\parbox[c]{\textwidth}{ \centering
					\textbf{
						\Large
						\textcolor{black}{\expandafter\uppercase\expandafter{\@addressInstN}}
						\normalsize
					}
				}
			} \\ \vspace*{4pt}
			
			%line10-c
			\concretef{
				\parbox[c]{\textwidth}{ \centering
					\textbf{
						\Large
						\textcolor{black}{\expandafter\uppercase\expandafter{\@addressInstD},}
						\normalsize
					}
				}
			} \\ \vspace*{4pt}
			
			%line10-c
			\concretef{
				\parbox[c]{\textwidth}{ \centering
					\textbf{
						\Large
						\textcolor{black}{\expandafter\uppercase\expandafter{\@addressInstP}}
						\normalsize
					}
				}
			}
		\end{center}
	\end{titlepage}
%	\restoregeometry
}
\makeatother
%Table of Contents Page
\makeatletter
%Set the title of the ToC page to "Table of Contents" from "Contents"
\def\tableofcontents{\section*{\centering \Large Table of Contents}\@starttoc{toc}}
% How many levels of section head would you like to appear in the
%  Table of Contents?
%  0= chapter titles, 1= section titles, 2= subsection titles, 
%  3= subsubsection titles.
\setcounter{tocdepth}{3}
\newcommand{\bordertoc}{
			\tableofcontents
			\newpage
}
\def\l@chapter#1#2{{ 
	 \vspace*{10pt}
    \@dottedtocline{0}{0em}{1.2em}{\textbf{#1}}{\textbf{#2}}}} 
\def\l@spchapter#1#2{{
	\vspace*{10pt}
    \@dottedtocline{0}{0em}{1.2em}{\textbf{#1}}{\textbf{#2}}}}
\def\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
\def\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
\def\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
\def\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\def\l@subparagraph{\@dottedtocline{5}{13em}{5.8em}}
\makeatother


%List of figures - page heading
\makeatletter
\def\listoffigures{\section*{\centering \Large List of Figures}\@starttoc{lof}}
\makeatother


%List of tables - page heading
\makeatletter
\def\listoftables{\section*{\centering \Large List of Tables}\@starttoc{lot}}
\makeatother


%Chapter Head settings
\makeatletter
\renewcommand{\@makechapterhead}[1]{%
	\vspace*{50\p@}%
  	{\parindent \z@ \raggedleft \normalfont
    	\ifnum \c@secnumdepth >\m@ne
        	\huge\bfseries \@chapapp\space \textbf{\thechapter}
        	\par\nobreak
        	\vskip 20\p@
    	\fi
    	\interlinepenalty\@M
    	\Huge \bfseries \textbf{#1}\par\nobreak
    	\vskip 40\p@
  	}
}
\makeatother

%Decleration Page
\makeatletter
\newcommand{\putdecleration}{
			\hspace*{10pt}\parbox{0.90\textwidth}{
				\begin{center}
					\Large
						\underline{\textbf{Declaration}}
					\normalsize
				\end{center}
				\vspace*{20pt}
				\centuryf{
					{
						%\small
						\setstretch{2.5}
						\hspace*{15pt} I hereby declare that the work being presented in this \expandafter\lowercase\expandafter{\@thesisType}\ entitled ``\expandafter\uline\expandafter{\@title}'' by me i.e. \uline{\@atitle\ }\expandafter\uline\expandafter{\@author}, bearing Roll No: \expandafter\uppercase\expandafter{\expandafter\uline\expandafter{\@regno}} and submitted to the \@dept\ Department at \@addressInstN\ \@addressInstD, \@addressInstP; is an authentic record of my own work carried out during the period \@PhDYears\ under the supervision of \expandafter\uline\expandafter{\@stitleI\ \@supervisorI}.\\ \hspace*{15pt}
						Neither the source code there in, nor the content of the seminar report have been copied or downloaded from any other source. I understand that my result grades would be revoked if later it is found to be so.\\ %\hspace*{15pt}
						%I also declare that I have read all the instructions given below.
						\vspace*{50pt}
						\\
						\makebox[150px]{\hrulefill}
						\\
						\@author
					}
				}
			}
			\newpage
}
\makeatother

%%Certificate Page
\makeatletter
\newcommand{\putcertificate}{
		\begin{center}
			\Large
				\centuryf{
					\underline{
						\textbf{
							\uppercase{c\ e\ r\ t\ i\ f\ i\ c\ a\ t\ e}
						}
					}
				}
			\normalsize
		\end{center}
		\vspace*{20pt}
		\centuryf{
			\textbf{
				%\small
				This is to certify that the submitted PhD Thesis entitled ``\expandafter\uppercase\expandafter{\expandafter\uline\expandafter{\@title}}'' is an official record of actual research work carried out by \uline{\@atitle\ }\expandafter\uppercase\expandafter{\expandafter\uline\expandafter{\@author}} bearing Roll No: \expandafter\uppercase\expandafter{\expandafter\uline\expandafter{\@regno}} under my supervision and guidance. To the best of our knowledge, the matter embodied in the report has not been submitted for the award of similar degree elsewhere.
				\vspace*{20pt} \\
				\Large
				%	Certified by
					\vspace*{1cm} \\
				\normalsize
				\begin{minipage}[l]{0.45\textwidth}
					\hfill
				\end{minipage}
				\begin{minipage}[r]{0.55\textwidth}
					\centuryf{
						\textbf{
							\makebox[150px]{\hrulefill} \\ \vspace*{-5pt}
							(\ \@stitleI\ \@supervisorI\ ) \\ \vspace*{-5pt}
							\@supervisorD, \\ \vspace*{-5pt}
							Department of \@dept, \\ \vspace*{-5pt}
							\@addressInstI\ \@addressInstD, \\ \vspace*{-5pt}
							\@addressInstP\ -- \@pinInst, \\ \vspace*{-5pt}
							\@countryInst \\
							\vspace*{10pt}
						}
					}
				\end{minipage}
				\begin{minipage}[c]{\textwidth}
					\hfill
					\vspace*{2cm}
				\end{minipage}
				\begin{minipage}[l]{0.45\textwidth}
					\hfill
				\end{minipage}
				\begin{minipage}[r]{0.55\textwidth}
					\centuryf{
						\textbf{
							\makebox[150px]{\hrulefill} \\ \vspace*{-5pt}
							Head, \\ \vspace*{-5pt}
							Department of \@dept, \\ \vspace*{-5pt}
							\@addressInstI\ \@addressInstD, \\ \vspace*{-5pt}
							\@addressInstP\ -- \@pinInst, \\ \vspace*{-5pt}
							\@countryInst \\
						}
					}
				\end{minipage}
			}
		}
	\newpage
}
\makeatother

%Approval Sheet
\makeatletter
\newcommand{\putapproval}{
			\begin{center}
				\large
					\centuryf{
						Department of \@dept \\ \vspace*{10pt}
						%\textbf
						{
							\expandafter\uppercase\expandafter{\@addressInstN}\ \expandafter\uppercase\expandafter{\@addressInstD}, \\ \expandafter\uppercase\expandafter{\@addressInstP}
							\normalsize
							\vspace*{10pt} \\
							(\@acYear)
						}
					}
				\normalsize
			\end{center}
			\hspace*{20pt}\parbox{0.90\textwidth}{
				\centuryf{
					%\textbf
					{
						\begin{center}
							\vspace*{-10pt}
							Approval Sheet
						\end{center}
						\vspace*{-5pt}
						This is to state that the \expandafter\lowercase\expandafter{\@thesisType} entitled \expandafter\uline\expandafter{\@title} submitted by \expandafter\uline\expandafter{\@atitle\ \@author} (Admission No: \expandafter\uppercase\expandafter{\expandafter\uline\expandafter{\@regno}}) is approved.
						\vspace*{-5pt}
						\begin{center}
							\large
								Board of Examiners
							\normalsize
							\\ \vspace*{10pt} Examiners \\
							\vspace*{20pt}
							\makebox[150px]{\hrulefill}\\
							\vspace*{10pt}
							\makebox[150px]{\hrulefill}
							\\ \vspace*{5pt} Supervisor \\
							\vspace*{20pt}
							\makebox[150px]{\hrulefill}
							\\ \vspace*{10pt} Chairman \\
							\vspace*{30pt}
							\makebox[150px]{\hrulefill} \\
						\end{center}
					}
					Date:\ \makebox[100px]{\hrulefill} \\
					Place:\ \makebox[100px]{\hrulefill}
				}
			}
			\newpage
}
\makeatother


%Acknowledgement Page
\makeatletter
\newcommand{\putsvnitack}[1]{
%			\hspace*{10pt}\parbox{0.90\textwidth}{
				\begin{center}
					\large
						\timesnr{
							\textbf{
								Acknowledgements
							}
						}
					\normalsize				
				\end{center}
				\vspace*{20pt}
				{#1}
				\vspace*{20pt} \\
				\textbf{\@author}
%			}	
			\newpage
}
\makeatother


%Abstract Page
\makeatletter
\newcommand{\putsvnitabstract}[1]{
			%\hspace*{10pt}\parbox{0.90\textwidth}{
				\begin{center}
					\large
						\timesnr{
							\textbf{
								{
									Abstract
								}
							}
						}
					\normalsize				
				\end{center}
				\vspace*{40pt}
				{#1}
		%	}	
			\newpage
		}
\makeatother

% place bibliography in table of contents
%
\def\thebibliography#1{\cleardoublepage\chapter*{\raggedleft Bibliography}\addcontentsline{toc}{chapter}{Bibliography}\list
  {[\arabic{enumi}]}{\settowidth\labelwidth{[#1]}\leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \usecounter{enumi}}
    \def\newblock{\hskip .11em plus .33em minus .07em}
    \sloppy\clubpenalty4000\widowpenalty4000
    \sfcode`\.=1000\relax}
%

