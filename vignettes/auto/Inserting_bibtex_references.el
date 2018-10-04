(TeX-add-style-hook
 "Inserting_bibtex_references"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("jss" "a4paper" "twoside" "11pt" "nojss" "article")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("fontenc" "T1") ("geometry" "left=2cm" "right=2cm" "bottom=15mm") ("natbib" "authoryear" "round" "longnamesfirst")))
   (add-to-list 'LaTeX-verbatim-environments-local "alltt")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
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
    "sec:orgc79b3b3"
    "sec:orgfe7800e"
    "sec:org2fea1e8"
    "sec:orgdc147ec"
    "sec:macros-citations"
    "sec:org11e5fdf"
    "sec:orgbc3d713"
    "sec:org6190898"
    "sec:org9275454"
    "sec:org2e4d56c"
    "org7452bb4"
    "sec:org32276c9"
    "sec:org85c7e54"))
 :latex)

