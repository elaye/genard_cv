\ProvidesClass{genard-cv}[2014/05/26 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}

\pagestyle{empty}

% \def\mystrut(#1){\vrule height #1cm width 0pt}

%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}
\definecolor{verylightgray}{HTML}{F7F7F7}

\ifdefined\@cv@print
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

\color{gray}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\renewcommand{\familydefault}{\sfdefault}

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{graphicx}
\RequirePackage{wrapfig}
\RequirePackage{tikz}
\usetikzlibrary{positioning,backgrounds}

\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{header}[2]{%

    \begin{tikzpicture}[remember picture,overlay]
      \node[yshift=-6cm] at (current page.north west) {%
        \begin{tikzpicture}[remember picture, overlay]
          \fill[verylightgray] (0,0) rectangle (21cm,6cm);
         \end{tikzpicture}
          };
     \end{tikzpicture}

    % Photo
    \newcommand{\photo}[1]{
      \begin{textblock}{3.0}(1, 0.5)
          \includegraphics[width=3cm]{##1}
      \end{textblock}
    }

    % Name
    \begin{textblock}{10.0}(5, 1.5)

      \begin{centering}
        {\Huge \bfseries #1\\\vspace{0.5cm}
        \hfill #2 \hfill}
      \end{centering}

    \end{textblock}

    % Profession
    \newcommand{\profession}[1]{
      \begin{textblock}{21.0}(0, 5)
          {\hfill \Large  \bfseries ##1 \hfill}   
      \end{textblock}
    }

        % Contact
    \begin{textblock}{7.0}(13, 0.5)
}{%
    \end{textblock}
}

\newenvironment{contact}{%
  \newcommand{\addinfo}[2]{%
    % \pill{##1} & \shortstack{##2}\\%
    \parbox{2cm}{\raggedleft ##1} & \parbox{7cm}{\raggedright ##2}\\%
  }
  \begin{tabular}{c|c}
}{%
  \end{tabular}
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
  \def\arraystretch{0.5}%
  \par\vspace{\baselineskip}{\Large\bfseries\color{headercolor} About}
  \noindent\makebox[\linewidth]{\rule{\textwidth}{0.4pt}}
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
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
  }
  \begin{textblock}{5}(15.5, 6)
  \begin{flushleft}
  \obeycr
}{%
  \restorecr
  \end{flushleft}
  \end{textblock}
  \let\section\oldsection
}

%%%%%%%%
% Body %
%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{body}{%
  \newcommand{\cat}[1]{
    % \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
    \par\vspace{\baselineskip}{\Large\bfseries\color{headercolor} ##1}
    \noindent\makebox[\linewidth]{\rule{\textwidth}{0.4pt}}
  }
  \newcommand{\entry}[2]{
    % \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
    {\large\bfseries\color{headercolor} ##1}
    {\color{headercolor} ##2}\\
  }
  \begin{textblock}{14.5}(0.5, 6)
  \begin{flushleft}
  % \obeycr
}{%
  % \restorecr
  \end{flushleft}
  \end{textblock}
}

%%%%%%%%%
% VCard %
%%%%%%%%%


%%%%%%%%%%%%%%%
% Rating dots %
%%%%%%%%%%%%%%%
\RequirePackage{pgffor}
\RequirePackage{wasysym}
\newcommand{\dotrating}[1]{
  \foreach \n in {1,...,5}{%
    \ifnum\n>#1%
      \fullmoon%
    \else%
      \newmoon%
    \fi%
    ~
  }
}

\newenvironment{skillgroup}[1]{%
#1
  \newcommand{\skill}[2]{
    ##1 & \dotrating{##2}\\
  }
  \begin{tabular}{ll}
}{%
  \end{tabular}
}

% %%%%%%%%%%%%%%%%
% % Other tweaks %
% %%%%%%%%%%%%%%%%

% \RequirePackage[left=6.1cm,top=2cm,right=1.5cm,bottom=2.5cm,nohead,nofoot]{geometry}
\RequirePackage[left=0cm,top=0cm,right=0cm,bottom=0cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}