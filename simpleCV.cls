% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.

% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.

% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <https://www.gnu.org/licenses/>.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Evan Machefer
% Date:   2020/09/08
% Email:  evan.machefer@gmail.com
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description: A simple CV class using LateX.
% Usage: pdflatex <CV-name.tex>
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{simpleCV}[2020/09/08 A simple CV class for LaTeX]
\LoadClass{article}

\pagestyle{empty}
% FONTS
\RequirePackage{fontawesome}

% MISC
\RequirePackage[x11names]{xcolor}
\RequirePackage{hyperref}

% MATHS
\RequirePackage{tikz}
\usetikzlibrary{patterns}


% LAYOUT
\footskip=3cm
\RequirePackage[a4paper,landscape,margin=1.cm, rmargin=3cm]{geometry}
\RequirePackage[calcwidth]{titlesec}

\titleformat{\section}[block]{\bf\LARGE\centering\color{DodgerBlue4}}{\thesection}{1em}{}


\setlength{\parindent}{0pt}
% NEW ENVIRONMENT
\newenvironment{talents}[1]{%
  \begin{tikzpicture}[overlay,remember picture]
    \fill[pattern=checkerboard%hexagons
    , pattern color= LightSkyBlue1!20](current page.north west) rectangle([xshift=0.32\paperwidth]current page.south west);
  \end{tikzpicture}%
  
  \begin{minipage}[c]{0.29\linewidth}
  \begin{center}
    \myName\\ 
    \myMail\\ 
    \myTel \\ 
    \myAdress\\ 
    \myBirth\\
  \end{center}
}{
\end{minipage}\hfill
}

\newenvironment{experiences}{\begin{minipage}[c]{0.55\linewidth}}{\end{minipage}}



% COMMANDS
\newcommand{\myName}{\textsc{\fontsize{40}{50}\selectfont\mname}} % Prénom Nom
\newcommand{\myMail}{\textbf{\large\faEnvelope\quad\href{mailto:\mmail}{\mmail}}}
\newcommand{\myAdress}{\madress, \mzipcode, \mcity}
\newcommand{\myBirth}{Né le \mbirth, à \mplace}
\newcommand{\myTel}{\faPhoneSquare\quad\mtel}
\newcommand{\myInfos}{%
  \myName\linebreak \myMail\linebreak\mtel\linebreak \myAdress\linebreak \myBirth
}

% PROGRESSION BARS
\newcommand{\sidebar}{0.6\linewidth}
\newcommand{\skill}[2]{\tikz{%
    \node[anchor=west] (A)at (0,0){\bf #1};
    \fill[black!20, rounded corners] (0.4\linewidth,-2pt)rectangle++(\sidebar, 6pt);
    \fill[orange!40, rounded corners] (0.4\linewidth,-2pt)rectangle++({#2 * \sidebar},6pt);
  }}