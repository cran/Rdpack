(TeX-add-style-hook
 "Inserting_figures_and_evaluated_examples"
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
    "sec:orgf215fe2"
    "sec:org80695a1"
    "sec:orgb3e0ae9"
    "sec:org00b2a6c"))
 :latex)

