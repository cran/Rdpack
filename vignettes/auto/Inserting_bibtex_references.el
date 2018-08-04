(TeX-add-style-hook
 "Inserting_bibtex_references"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("jss" "a4paper" "twoside" "11pt" "nojss" "article")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("fontenc" "T1") ("geometry" "left=2cm" "right=2cm" "bottom=15mm") ("natbib" "authoryear" "round" "longnamesfirst")))
   (add-to-list 'LaTeX-verbatim-environments-local "alltt")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "jss"
    "jss11"
    "fontenc"
    "geometry"
    "graphicx"
    "color"
    "alltt"
    "natbib"
    "hyperref")
   (LaTeX-add-labels
    "sec:org288fce5"
    "sec:orgb2db2dc"
    "sec:orgb12f392"
    "sec:orgff243e0"
    "sec:macros-citations"
    "sec:org2098c9b"
    "sec:orgc23fd8d"
    "sec:org23ed409"
    "sec:org07ff283"
    "sec:org6b16cbc"
    "org50e22be"
    "sec:orge2b9228")
   (LaTeX-add-environments
    '("eptblFigure" LaTeX-env-args ["argument"] 0)
    '("epfigFigure" LaTeX-env-args ["argument"] 0)
    '("epFigure" LaTeX-env-args ["argument"] 0)))
 :latex)

