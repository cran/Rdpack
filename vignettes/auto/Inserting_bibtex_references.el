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
    "sec:org778a336"
    "sec:orgd4ad0fc"
    "sec:orgb97375b"
    "sec:org3007a43"
    "sec:macros-citations"
    "sec:org89632ba"
    "sec:orgfdcfa4f"
    "sec:orgb5b1c57"
    "sec:org98c15ef"
    "sec:org5c929bd"
    "sec:org9e2f214"
    "sec:org83922f5"
    "sec:org663630e"
    "sec:org54eca5d"))
 :latex)

