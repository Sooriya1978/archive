# Convertendo para doc usando tex4ht:
    
    apt-get install tex4ht
    latex filename.tex
    bibtex filename.aux
    mk4ht oolatex filename.tex

# Convertendo para doc usando pandoc:

    pandoc -f latex -t odt -o output.odt input.tex
