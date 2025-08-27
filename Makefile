# Makefile para compilar un documento LaTeX

# Nombre del archivo principal (sin extensión)
FILE = report

# Nombre de salida basado en el título (cambiar según el documento)
OUTPUT_NAME = propuesta-de-colaboracion-sistema-de-gestion-eudr

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
	-$(RM) $(OUTPUT_NAME).pdf del $(OUTPUT_NAME).pdf

pdf:
	$(LATEX) $(FILE).tex
	$(LATEX) $(FILE).tex
	if exist $(FILE).pdf copy $(FILE).pdf $(OUTPUT_NAME).pdf

.PHONY: all clean pdf