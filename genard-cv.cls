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

\RequirePackage{iflang}

\pagestyle{empty}

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
\newcommand{\subtitle}{}

%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

% \definecolor{white}{RGB}{255,255,255}

% \definecolor{darkgray}{HTML}{333333}
% \definecolor{gray}{HTML}{4D4D4D}
% \definecolor{lightgray}{HTML}{999999}
% \definecolor{verylightgray}{HTML}{F7F7F7}

% \ifdefined\@cv@print
% 	\colorlet{fillheader}{white}
% 	\colorlet{header}{gray}
% \else
% 	\colorlet{fillheader}{gray}
% 	\colorlet{header}{white}
% \fi
% \colorlet{textcolor}{black!75}
% \colorlet{headercolor}{black!75}

\color{black!85}
\AtBeginDocument{\color{black!85}\global\let\default@color\current@color}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage{microtype}

\renewcommand{\familydefault}{\sfdefault}
% \RequirePackage{fontspec}
\RequirePackage{fontawesome}

%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%

\renewcommand{\section}[1]{
	\par\vspace{\baselineskip}{\Large\bfseries#1}\vspace{-0.2cm}
	\noindent\makebox[\linewidth]{\rule{\textwidth}{0.4pt}}\vspace{-0.3cm}
}

\newcommand{\iconsection}[2]{
	\par\vspace{\baselineskip}#1 {\Large\bfseries#2}\vspace{-0.2cm}
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
\usetikzlibrary{positioning, backgrounds, shadows.blur}

\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{header}{%

	% Header background
	\begin{tikzpicture}[remember picture,overlay]
		\node[yshift=-5cm] at (current page.north west) {%
			\begin{tikzpicture}[remember picture, overlay]
				\fill[black!0] (0,0) rectangle (21cm,5cm);
			\end{tikzpicture}
		};
	 \end{tikzpicture}

	% Photo
	\newcommand{\photo}[2][shadow=true]{
		\begin{textblock}{3.0}(1, 0.5)
			\noindent
			\begin{tikzpicture}
			\ifthenelse{\equal{shadow=true}{##1}}{
				\node[blur shadow={shadow xshift=.8ex,shadow yshift=-.8ex}, fill=white,draw] at (0,0) {\includegraphics[width=2.5cm]{##2}};				
			}{
				\node[fill=white,draw] at (0,0) {\includegraphics[width=2.5cm]{##2}};
			}
			\end{tikzpicture}
		\end{textblock}
	}

	% Name
	\begin{textblock}{8}(2.5, 1)	
			\centering
			\medskip
			{\Huge\bfseries \firstname~\lastname\\}
			\bigskip\bigskip
			{\Large \subtitle}
	\end{textblock}

	% Profession
	\begin{tikzpicture}[remember picture,overlay]
		\node[yshift=-5.5cm] at (current page.north west){
			\begin{tikzpicture}[remember picture, overlay]
				\fill[black!3] (0,0) rectangle (21cm,0.7cm);
				\node[xshift=2.5cm, yshift=0.35cm](d){\scriptsize \IfLanguageName{french}{Mis à jour le}{Updated on} {\scriptsize\today}};
				\node[xshift=10.5cm, yshift=0.35cm](p){\Large \bfseries \profession};
				% \draw[-] (p.north west) -- (p.north east);
				\fill[black!7] (0,0) rectangle (21cm,0.07cm);
				\fill[black!7] (0,0.7cm) rectangle (21cm,0.77cm);
			\end{tikzpicture}
		};
	\end{tikzpicture}


	% Contact
	\begin{textblock}{8.0}(11, 5)
}{%
	\end{textblock}
}

\newenvironment{contact}[1][]{%
	\newcommand{\addinfo}[2]{%\noindent
		\noindent\par
		\begin{tikzpicture}
			\node[rectangle, rounded corners, fill=black!10, minimum height=1.5em] (a) {\mbox{\raggedleft ##1 :}};
			\node[anchor=north west, xshift=0.1cm] at (a.north east) {\parbox{6cm}{##2}};
		\end{tikzpicture}\\\vspace{-0.2cm}%
	}

	\let\arraystretch\oldarraystretch
	\newcommand{\arraystretch}{1.5}
	\let\oldarraystretch\arraystretch

	\newcommand{\dispvcard}{
		\begin{textblock}{3}(17,1)
			\ifthenelse{\equal{vcard=true}{#1}}{\vcard}{}
		\end{textblock}
	}

	\ifthenelse{\equal{vcard=true}{#1}}{
		\begin{textblock}{6}(11,0.5)
	}{
		\begin{textblock}{6}(13,0.5)
	}
}{%
	\end{textblock}
	\dispvcard
}

%%%%%%%%%
% About %
%%%%%%%%%

\newenvironment{about}{%
	\iconsection{\faInfoSign}{\IfLanguageName{french}{Informations}{About}}%
	\vspace{2mm}
	% \def\arraystretch{0.8}%
	\newcommand{\addinfo}[2]{%
		\parbox{2cm}{\bfseries\raggedleft ##1} & \parbox{3 cm}{\raggedright ##2}\\%
	}

	\begin{tabular}{cc}%
}{%
	\end{tabular}%
	\vspace{0.5cm}%
}

%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
	\begin{textblock}{5}(15.5, 5.5)
	\begin{flushleft}
}{%
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
	\newcommand{\experience}{
		\iconsection{\faCogs}{\IfLanguageName{french}{Expériences professionnelles}{Professional experience}}
	}
	\newcommand{\education}{
		\iconsection{\faBook}{\IfLanguageName{french}{Formation}{Education}}
	}

	\begin{textblock}{14.5}(0.5, 5.5)
	\begin{flushleft}
}{%
	\end{flushleft}
	\end{textblock}
}

\newenvironment{entry}[4]{%
	\par\vspace{2mm}%
	\parbox{3.7cm}{#1}%
	\begin{minipage}{8.5cm}
		{\raggedright\bfseries\large#2}%
	\end{minipage}
	{\hfill\small#3}\\%
	{\large#4}\\\vspace{1mm}%

	\hfill\begin{minipage}{\dimexpr\textwidth-5mm}
	\begin{tabular}{|l}
}{%
	\end{tabular}%
	\end{minipage}
	\vspace{0.2cm}
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
    	\psbarcode[linecolor=black!75]{%
BEGIN:VCARD
VERSION:3.0
N:\lastname;\firstname
FN:\firstname \lastname
TEL;TYPE=WORK,VOICE:\phone
EMAIL;TYPE=PREF,INTERNET:\email
END:VCARD
}{width=1.181 height=1.181 eclevel=M}{qrcode}%
    \end{pspicture}
}

% %%%%%%%%%%%%%%
% Rating dots %
% %%%%%%%%%%%%%%

\RequirePackage{wasysym}

\newcommand{\dotrating}{%
        \ifnum\count0<\count2 %
            \newmoon
        \else
            \fullmoon
        \fi
            \hspace{.5em}%
         \ifnum\count0<3
            \advance\count0 1 %
            \expandafter\dotrating
         \fi
}

\newcounter{skillsNumber}

\newcommand{\skills}{
	\iconsection{\faCode}{\IfLanguageName{french}{Compétences}{Skills}}
	\vspace{0.5cm}
}

\newenvironment{skillgroup}[1]{%
    \setcounter{skillsNumber}{0}%
    \newcommand{\skill}[2]{%
       \parbox{2.5cm}{##1}&\count0=0\count2=##2\relax
           \dotrating\\%
    }
%
    \renewcommand{\arraystretch}{1.5}%b

	\rotatebox{90}{\llap{\tiny\uppercase{#1}}}%
	\begin{tabular}[t]{@{}|ll}%
}{%
    \end{tabular}%
    \vspace{0.5cm}%
}

\RequirePackage{colortbl}

\newcommand{\skillscaption}{
	% \noindent\makebox[\linewidth]{\rule{0.25\textwidth}{0pt}\rule{0.5\textwidth}{0.4pt}\rule{0.25\textwidth}{0pt}}
	\rotatebox{90}{\llap{\tiny\uppercase{caption}}}%
	\begin{tabular}[t]{@{}|rl}
		\rowcolor{black!4} \parbox{2.5cm}{\raggedleft \IfLanguageName{french}{Débutant}{Beginner}} & \count0=0\count2=1\relax\dotrating\\
		\rowcolor{black!4} \parbox{2.5cm}{\raggedleft \IfLanguageName{french}{Intermédiaire}{Intermediate}} & \count0=0\count2=2\relax\dotrating\\
		\rowcolor{black!4} \parbox{2.5cm}{\raggedleft \IfLanguageName{french}{Avancé}{Advanced}} & \count0=0\count2=3\relax\dotrating\\
		\rowcolor{black!4} \parbox{2.5cm}{\raggedleft \IfLanguageName{french}{Expert}{Expert}} & \count0=0\count2=4\relax\dotrating\\
	\end{tabular}	
}

%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=0cm,top=0cm,right=0cm,bottom=0cm,nohead,nofoot]{geometry}

\ifdefined\@cv@print
	\RequirePackage[pdfborder={0 0 0}, hidelinks]{hyperref}
\else
	\RequirePackage[pdfborder={0 0 0}, colorlinks=true, urlcolor=red!15!blue!90]{hyperref}
\fi


\hypersetup{
  pdfinfo={
	  pdfproducer={},
	  Title={CV},
	  Subject={CV},
	  Author={Elie Génard https://github.com/elaye},
	  Keywords={https://github.com/elaye/genard\_cv}
  }
}
