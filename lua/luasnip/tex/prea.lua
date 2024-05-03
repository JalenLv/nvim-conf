local s = require('luasnip').snippet

local helpers = require 'custom.LuaSnip.luasnip-helper-funcs'
local line_begin = helpers.line_begin
local tex = helpers.tex_utils

return {
  s(
    {
      trig = 'prea',
      desc = 'fast generate preamble',
      snippetTpye = 'autosnippet',
      regTrig = false,
    },
    fmta(
      [[
        \ProvidesPackage{prea}

        % Chinese Support
        <>\usepackage{ctex}

        \usepackage[a4paper, margin=1in]{geometry}

        % Set Font - Times New Roman
        \usepackage{fontspec}
        \setmainfont{Times New Roman}

        \usepackage{indentfirst}

        \usepackage{multicol}
        \setlength{\columnsep}{1cm}

        % increase the row height of a single row: \addstackgap{}
        \usepackage{stackengine}

        \usepackage{amsmath, amssymb, amsthm,  mathtools}
        \usepackage{aligned-overset}
        \usepackage{verbatim}

        \usepackage{graphicx}
        \graphicspath{{images/}}
        \usepackage{wrapstuff}
        \usepackage{subfig}
        \renewcommand{\thesubfigure}{Figure \arabic{subfigure}}
        \captionsetup[subfigure]{labelformat=simple, labelsep=colon}

        \usepackage{hyperref}

        \usepackage[backend=biber]{biblatex}
        % \addbibresource{citation.bib}

        \usepackage{subfiles}

        % Differential Sign
        \newcommand{\dif}{\ensuremath{\operatorname{d}\!}}

        % Define \figref command
        \newcommand{\figref}[1]{\figurename~\ref{#1}}
        % Define \tabref command
        \newcommand{\tabref}[1]{\tablename~\ref{#1}}

        % Listing Package Settings
        \usepackage{listings}
        \usepackage{xcolor}

        \definecolor{codegreen}{rgb}{0,0.6,0}
        \definecolor{codegray}{rgb}{0.5,0.5,0.5}
        \definecolor{codepurple}{rgb}{0.58,0,0.82}
        \definecolor{backcolour}{rgb}{0.95,0.95,0.92}

        \lstdefinestyle{mystyle}{
            backgroundcolor=\color{backcolour},
            commentstyle=\color{codegreen},
            keywordstyle=\color{magenta},
            numberstyle=\tiny\color{codegray},
            stringstyle=\color{codepurple},
            basicstyle=\ttfamily\footnotesize,
            breakatwhitespace=false,
            breaklines=true,
            captionpos=b,
            keepspaces=true,
            numbers=left,
            numbersep=5pt,
            showspaces=false,
            showstringspaces=false,
            showtabs=false,
            tabsize=4
        }
        \lstset{style=mystyle}

        % Trigonometric and Hyperbolic Functions Supplements
        \DeclareMathOperator{\sech}{sech}
        \DeclareMathOperator{\csch}{csch}
        \DeclareMathOperator{\arcsec}{arcsec}
        \DeclareMathOperator{\arccot}{arccot}
        \DeclareMathOperator{\arccsc}{arccsc}
        \DeclareMathOperator{\arcosh}{arccosh}
        \DeclareMathOperator{\arsinh}{arsinh}
        \DeclareMathOperator{\artanh}{artanh}
        \DeclareMathOperator{\arsech}{arsech}
        \DeclareMathOperator{\arcsch}{arcsch}
        \DeclareMathOperator{\arcoth}{arcoth} 

        % Tikz Packages
        \usepackage{physics}
        \usepackage{tikz}
        \usepackage{mathdots}
        \usepackage{yhmath}
        \usepackage{cancel}
        \usepackage{color}
        \usepackage{siunitx}
        \usepackage{array}
        \usepackage{multirow}
        \usepackage{gensymb}
        \usepackage{tabularx}
        \usepackage{extarrows}
        \usepackage{booktabs}
        \usetikzlibrary{fadings}
        \usetikzlibrary{patterns}
        \usetikzlibrary{shadows.blur}
        \usetikzlibrary{shapes}

      ]],
      { i(0, '% ') }
    ),
    { condition = line_begin }
  ),
}
