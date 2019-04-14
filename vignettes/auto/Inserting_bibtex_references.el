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
    "sec:org848e2e4"
    "sec:orge601e7c"
    "sec:orgb780a37"
    "sec:orgbaabdbb"
    "sec:macros-citations"
    "sec:org5309182"
    "sec:orgefd3695"
    "sec:org4871d85"
    "sec:org2375713"
    "sec:org657ff99"
    "sec:org2606b37"
    "org0aff802"
    "sec:orgb642964"
    "sec:org5f9a745"))
 :latex)

