# Makefile para compilar un documento LaTeX

# Nombre del archivo principal (sin extensión) - cambiar según el documento
FILE = example-latin

# Comandos
LATEX = xelatex
RM = if exist

# Tareas
all: clean pdf

clean:
	-$(RM) $(FILE).aux del $(FILE).aux
	-$(RM) $(FILE).log del $(FILE).log
	-$(RM) $(FILE).toc del $(FILE).toc
	-$(RM) $(FILE).pdf del $(FILE).pdf

pdf:
	$(LATEX) $(FILE).tex
	$(LATEX) $(FILE).tex

.PHONY: all clean pdf