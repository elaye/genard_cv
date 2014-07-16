%!TEX root = cv.tex
\ProvidesClass{genard-cv}[2014/05/26 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption{debug}{\def\@cv@debug{}}
\DeclareOption*{%
	\PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}

\pagestyle{empty}

% \def\mystrut(#1){\vrule height #1cm width 0pt}

%%%%%%%%%%%%%
% Variables %
%%%%%%%%%%%%%

% Empty definition to make sure the command doesn't already exists
\newcommand{\firstname}{}
\newcommand{\lastname}{}
\newcommand{\phone}{}
\newcommand{\email}{}
\newcommand{\adress}{}
\newcommand{\city}{}
\newcommand{\profession}{}

%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

% \definecolor{darkgray}{HTML}{333333}
% \definecolor{gray}{HTML}{4D4D4D}
% \definecolor{lightgray}{HTML}{999999}
% \definecolor{verylightgray}{HTML}{F7F7F7}

\ifdefined\@cv@print
	\colorlet{fillheader}{white}
	\colorlet{header}{gray}
\else
	\colorlet{fillheader}{gray}
	\colorlet{header}{white}
\fi
\colorlet{textcolor}{black!75}
\colorlet{headercolor}{black!75}

\color{black!75}
\AtBeginDocument{\color{black!75}\global\let\default@color\current@color}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage{microtype}

\renewcommand{\familydefault}{\sfdefault}

\RequirePackage{fontawesome}

%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%

\renewcommand{\section}[1]{
	\par\vspace{\baselineskip}{\Large\bfseries\color{headercolor}#1}\vspace{-0.2cm}
	\noindent\makebox[\linewidth]{\rule{\textwidth}{0.4pt}}\vspace{-0.3cm}
}

\newcommand{\iconsection}[2]{
	\par\vspace{\baselineskip}#1 {\Large\bfseries\color{headercolor}#2}\vspace{-0.2cm}
	\noindent\makebox[\linewidth]{\rule{\textwidth}{0.4pt}}\vspace{-0.4cm}
}

%%%%%%%%%%
% Header %
%%%%%%%%%%

\ifdefined\@cv@debug
	\RequirePackage[absolute,overlay,showboxes]{textpos}
\else
	\RequirePackage[absolute,overlay]{textpos}
\fi
\RequirePackage{graphicx}
\RequirePackage{wrapfig}
\RequirePackage{pdfpages}
\RequirePackage{tikz}
\usetikzlibrary{positioning,backgrounds,shadows.blur}

\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{header}{%

	\begin{tikzpicture}[remember picture,overlay]
		\node[yshift=-6cm] at (current page.north west) {%
			\begin{tikzpicture}[remember picture, overlay]
				\fill[black!0] (0,0) rectangle (21cm,6cm);
			\end{tikzpicture}
		};
	 \end{tikzpicture}

	% Photo
	\newcommand{\photo}[1]{
		\begin{textblock}{3.0}(1, 0.5)
		\noindent
			\begin{tikzpicture}
				\node[blur shadow={shadow xshift=.8ex,shadow yshift=-.8ex},fill=white,draw] at (0,0) {\includegraphics[width=3cm]{##1}};
			\end{tikzpicture}
			% \includegraphics[width=3cm]{##1}
			% \includegraphics{photo/photo.pdf}
			% \includepdf[pages=-]{photo/photo.pdf}
			% \includegraphics{photo/photo.pdf}
		\end{textblock}
	}

	% Name
	\begin{textblock}{7.0}(5, 1.0)
			\centering
			\Huge\bfseries \firstname\\\vspace{0.2cm}
			\lastname
	\end{textblock}

	% Profession
	% \newcommand{\profession}[1]{%
	% 	\begin{textblock}{21.0}(0, 5)%
	% 			{\hfill \Large  \bfseries ##1 \hfill}%
	% 	\end{textblock}%
	% }

	\begin{tikzpicture}[remember picture,overlay]
		\node[yshift=-6.5cm] at (current page.north west){
			\begin{tikzpicture}[remember picture, overlay]
				\fill[black!5] (0,0) rectangle (21cm,0.7cm);
				\node[xshift=10.5cm, yshift=0.35cm](p){\Large \bfseries \profession};
				% \draw[-] (p.north west) -- (p.north east);
				\fill[black!7] (0,0) rectangle (21cm,0.07cm);
				\fill[black!7] (0,0.7cm) rectangle (21cm,0.77cm);
			\end{tikzpicture}
		};
	\end{tikzpicture}
	% Contact
	\begin{textblock}{6.0}(11, 0.5)
}{%
	\end{textblock}

	% \begin{textblock}{3}(17.5, 0.5)
	% 	\vcard
	% \end{textblock}
}

\newenvironment{contact}[1][]{%
	\newcommand{\addinfo}[2]{%\noindent
		% \pill{##1} & \shortstack{##2}\\%
		\parbox{1cm}{\raggedleft\large ##1} & \parbox{4.5cm}{\raggedright\large ##2}\\%
	}

	\let\arraystretch\oldarraystretch
	\newcommand{\arraystretch}{1.5}
	\let\oldarraystretch\arraystretch

	\newcommand{\dispvcard}{
		\ifthenelse{\equal{vcard=true}{#1}}{\vcard}{}
	}
	
	\begin{tabular}{c|c}
}{%
	\end{tabular}
	\dispvcard
}

\newcommand{\pill}[1]{%
	\begin{tikzpicture}
		\node (a1) [rectangle, rounded corners, fill] {#1};
	\end{tikzpicture}
}

%%%%%%%%%
% About %
%%%%%%%%%

\newenvironment{about}{%
	\iconsection{\faInfoSign}{About}%
	\def\arraystretch{0.5}%
	\newcommand{\addinfo}[2]{%
		% \pill{##1} & \shortstack{##2}\\%
		\parbox{2cm}{\bfseries\raggedright ##1:} & \parbox{3 cm}{\raggedright ##2}\\%
	}

	\begin{tabular}{cc}
}{%
	\end{tabular}
}

% %%%%%%%%%%%%%%
% % Side block %
% %%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
	\begin{textblock}{5}(15.5, 6)
	\begin{flushleft}
	\obeycr
}{%
	\restorecr
	\end{flushleft}
	\end{textblock}
}

%%%%%%%%
% Body %
%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{body}{%
	\newcommand{\experience}[1]{
		\iconsection{\faCogs}{##1}
	}
	\newcommand{\education}[1]{
		\iconsection{\faBook}{##1}
	}
	% \newcommand{\entry}[2]{
	% 	% \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
	% 	\par\vspace{0.2cm}{\color{headercolor}\MakeUppercase{##1}}%\vspace{0.2cm}
	% 	% {\large\bfseries\color{headercolor} ##1}
	% 	\par\vspace{-0.1cm}{\color{headercolor} ##2}\\
	% }

	\begin{textblock}{14.5}(0.5, 6)
	\begin{flushleft}
	% \obeycr
}{%
	% \restorecr
	\end{flushleft}
	\end{textblock}
}

\newenvironment{entry}[4]{%
	\par\vspace{0.2cm}%
	\parbox{4cm}{\color{headercolor}#1}%
	{\color{headercolor}\raggedright\bfseries\large#2}%
	{\hfill\small\color{headercolor}#3}\\%
	{\large#4}\\%
}{%
}

%%%%%%%%%
% VCard %
%%%%%%%%%

\RequirePackage{pst-barcode}

{\obeylines\gdef^^M{^^J}%
 \catcode`\@=0 %
 \catcode`\\=12 %
 @gdef@n{\n}}

% VCard example

% \newcommand{\vcard}{
% 	\begin{pspicture}(1in,1in)
%     	\obeylines
%     	\psbarcode{%
% BEGIN:VCARD
% VERSION:3.0
% N:Gump;Forrest
% FN:Forrest Gump
% ORG:Bubba Gump Shrimp Co.
% TITLE:Shrimp Man
% TEL;TYPE=WORK,VOICE:(111) 555-1212
% TEL;TYPE=HOME,VOICE:(404) 555-1212
% ADR;TYPE=WORK:;;100 Waters Edge;Baytown;LA;30314;United States of America
% LABEL;TYPE=WORK:100 Waters Edge\n Baytown, LA 30314\n United States of America
% ADR;TYPE=HOME:;;42 Plantation St.;Baytown;LA;30314;United States of America
% LABEL;TYPE=HOME:42 Plantation St.\n Baytown, LA 30314\n United States of America
% EMAIL;TYPE=PREF,INTERNET:forrestgump@example.com
% REV:20080424T195243Z
% END:VCARD
% }{width=2.0 height=2.0}{qrcode}%
%     \end{pspicture}
% }

\newcommand{\vcard}{
	\noindent
	\begin{pspicture}(3cm,3cm)
    	\obeylines
    	\psbarcode[linecolor=black!15]{%
BEGIN:VCARD
VERSION:3.0
N:\lastname;\firstname
FN:\firstname \lastname
TEL;TYPE=WORK,VOICE:\phone
EMAIL;TYPE=PREF,INTERNET:\email
END:VCARD
}{width=1.181 height=1.181}{qrcode}%
    \end{pspicture}
}

%%%%%%%%%%%%%%%
% Rating dots %
%%%%%%%%%%%%%%%
\RequirePackage{pgffor}
\RequirePackage{wasysym}
\newcommand{\dotrating}[1]{
	\foreach \n in {1,...,4}{%
		\ifnum\n>#1%
			\fullmoon%
		\else%
			\newmoon%
		\fi%
		~
	}
}

\RequirePackage{multirow}
\RequirePackage{rotating}
\RequirePackage{ifthen}

\newcounter{skillsNumber}

\newenvironment{skillgroup}[2]{%

	\setcounter{skillsNumber}{0}

	\newcommand{\skill}[2]{
		\addtocounter{skillsNumber}{1}
		\ifthenelse{\equal{1}{\value{skillsNumber}}}{
			\multirow{#2}{*}{
				\rotatebox{90}{\centering
					\tiny\uppercase{#1}
				}
			}
		}{}
		& \parbox{2.5cm}{\raggedright##1} & \dotrating{##2} \\
	}

	\renewcommand{\arraystretch}{0.5}

	\begin{tabular}{|r|ll}
}{%
	\end{tabular}
	% \vspace{0.5cm}
<<<<<<< HEAD
=======
}

\RequirePackage{colortbl}

\newcommand{\skillscaption}{
	\begin{tabular}{rl}
		\rowcolor{black!0} Beginner & \dotrating{1}\\
		\rowcolor{black!0} Intermediate & \dotrating{2}\\
		\rowcolor{black!0} Advanced & \dotrating{3}\\
		\rowcolor{black!0} Expert & \dotrating{4}\\
	\end{tabular}	
>>>>>>> 7fa5ca5b23d38f42d3c7abf736ba1d60544e8c64
}

% %%%%%%%%%%%%%%%%
% % Other tweaks %
% %%%%%%%%%%%%%%%%

% \RequirePackage[left=6.1cm,top=2cm,right=1.5cm,bottom=2.5cm,nohead,nofoot]{geometry}
\RequirePackage[left=0cm,top=0cm,right=0cm,bottom=0cm,nohead,nofoot]{geometry}
\RequirePackage[colorlinks=false, pdfborder={0 0 0}, hidelinks]{hyperref}
