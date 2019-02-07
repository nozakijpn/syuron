%%
%% 長崎大学 論文用スタイルファイル
%%
%%       by shibata@cis.nagasaki-u.ac.jp Jan. 09, 2002
%%
\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{nagasaki}[2002/01/09 長崎大学卒論]
\LoadClass[a4j,16pt]{jreport}

%%
%% 修論オプション
%%
\newcommand{\@master}{0}
\DeclareOption{master}{\renewcommand{\@master}{1}}
\DeclareOption*{\PassOptionsToPackage\CurrentOption{nagasaki}}
\ProcessOptions

%%
%% 欧文・和文間のスペース
%%
\setlength{\xkanjiskip}{0.25em plus 0.15em minus 0.06em}

%%
%% 表題
%%
\renewcommand{\abstractname}{論文要旨}
\renewcommand{\bibname}{参考文献}
\renewcommand{\listfigurename}{図目次}
\renewcommand{\listtablename}{表目次}
\renewcommand{\appendixname}{付録}

%%
%% 目次や表目次などの先頭ページ
%%
\renewcommand{\tableofcontents}{%
  \if@twocolumn\@restonecoltrue\onecolumn
  \else\@restonecolfalse\fi
  \chapter*{\contentsname
    \@mkboth{\contentsname}{\contentsname}%
  }\thispagestyle{empty}\@starttoc{toc}%
  \if@restonecol\twocolumn\fi
}
\renewcommand{\listoffigures}{%
  \if@twocolumn\@restonecoltrue\onecolumn
  \else\@restonecolfalse\fi
  \chapter*{\listfigurename
  \@mkboth{\listfigurename}{\listfigurename}}%
  \thispagestyle{empty}%
  \@starttoc{lof}%
  \if@restonecol\twocolumn\fi
}
\renewcommand{\listoftables}{%
  \if@twocolumn\@restonecoltrue\onecolumn
  \else\@restonecolfalse\fi
  \chapter*{\listtablename
  \@mkboth{\listtablename}{\listtablename}}%
  \thispagestyle{empty}%
  \@starttoc{lot}%
  \if@restonecol\twocolumn\fi
}
\renewcommand*{\l@chapter}[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \addvspace{1.0em \@plus\p@}%
    \begingroup
      \parindent\z@ \rightskip\@pnumwidth \parfillskip-\rightskip
      \leavevmode\headerfont
      \setlength\@lnumwidth{4zw}%
      \advance\leftskip\@lnumwidth \hskip-\leftskip
      #1\nobreak\hfil\nobreak\hbox to\@pnumwidth{\hss#2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}

%%
%% float図表の制御関係
%%
\renewcommand{\topfraction}{.8}
\renewcommand{\textfraction}{.1}
\renewcommand{\floatpagefraction}{.6}

%%
%% 禁則処理関係
%%
\prebreakpenalty\jis"2147=10000      % 5000   ’
\postbreakpenalty\jis"2148=10000     % 5000   “
\prebreakpenalty\jis"2149=10000      % 5000   ”
\inhibitxspcode`〒=2

%%
%% 見出しのフォント
%%
\def\headerfont{\bfseries}

%%
%% 章
%%
\renewcommand{\chapter}{%
  \if@openright\cleardoublepage\else\clearpage\fi
\thispagestyle{plain}%
  \global\@topnum\z@
  \secdef\@chapter\@schapter}

\def\@makechapterhead#1{\hbox{}%
 \vskip2\Cvs {\parindent 0pt \raggedright
 \ifnum \c@secnumdepth >\m@ne \huge\headerfont \@chapapp\thechapter\@chappos
 \par \vskip1\Cvs  \fi \huge \headerfont #1\par \nobreak \vskip3\Cvs}}

\def\@makeschapterhead#1{\hbox{}%
 \vskip2\Cvs { \parindent 0pt \raggedright
 \huge \headerfont #1\par
 \nobreak \vskip3\Cvs} }

%%
%% ページ上部の柱関係
%%
\def\ps@headings{\let\ps@jpl@in\ps@headnombre
    \def\@oddfoot{\hfil\thepage\hfil}
    \def\@evenfoot{\hfil\thepage\hfil}
    \def\@evenhead{%
       \underline{%
       \hbox to \textwidth{{\leftmark}\hfil\rightmark}}}%
    \def\@oddhead{%
       \underline{%
       \hbox to \textwidth{{\leftmark}\hfil\rightmark}}}%
    \let\@mkboth\markboth
  \def\chaptermark##1{\markboth{%
     \ifnum \c@secnumdepth >\m@ne%
    \thechapter%
         \hskip1zw
     \fi
     ##1}{}}%
  \def\sectionmark##1{\markright{%
     \ifnum \c@secnumdepth >\z@ \thesection.\hskip1zw\fi
     ##1}}%
}

%%
%% text用分数
%%
\newcommand{\FRAC}[2]{\leavevmode\kern.1em%
  \raise.5ex\hbox{\the\scriptfont0 #1}\kern-.1em%
  /\kern-.15em\lower.25ex\hbox{\the\scriptfont0 #2}}

%%
%% 表紙
%%
\def\teacher#1{\def\@teacher{#1}}
\def\id#1{\def\@id{#1}}


\def\maketitle{\begin{titlepage}
 \let\footnotesize\small \let\footnoterule\relax \setcounter{page}{0}
 \ifnum\@ptsize=2
 \let\Huge\huge \let\huge\LARGE \let\LARGE\Large \normalsize\small
 \fi
 \null
 \vfil
 \begin{center}
  \renewcommand{\baselinestretch}{1.0}\large\normalsize
  \vskip -0.0cm
  \ifnum\@master=1
  \underline{\LARGE 修　士　論　文}
  \else
  \underline{\LARGE 卒　業　論　文}
  \fi
  \vskip 2cm
  \leftline{\hspace*{1.0cm} \underline{題　　目}} \vskip 0.5cm
   {\huge \headerfont \@title}\par \vskip 2cm
  \leftline{\hspace*{1.0cm} \underline{指導教員}}
  {\LARGE \@teacher} \vskip 5.1cm
  {\LARGE \@date} \ifnum\@ptsize=2\vskip 3.3cm\else\vskip 3.5cm\fi
  \ifnum\@master=1
  {\LARGE 長崎大学大学院 工学研究科}
  \else
  {\LARGE 長崎大学工学部}
  \fi
  \vskip 0.7cm
  \ifnum\@master=1
  {\LARGE 総合工学専攻 情報工学コース}
  \else
  {\LARGE 情報工学コース}
  \fi
  \vskip 1.0cm
  {\Huge \@author \LARGE (\@id)}
 \end{center} \par
\@thanks
\vfil
\end{titlepage}
\setcounter{footnote}{0} \let\thanks\relax
\let\maketitle\relax}

%%%
\endinput
