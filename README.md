# Plantilla LaTeX Estructurada

Esta es una plantilla de documento LaTeX profesional con estructura modular y organizada.

## Estructura de Directorios

```
plantilla_latex_modificada/
├── report.tex              # Documento principal
├── tudelf-report.cls       # Clase de documento personalizada
├── cover.tex              # Definición de portada
├── Makefile               # Automatización de compilación
├── .gitignore            # Control de versiones
├── fonts/                # Fuentes tipográficas
│   ├── Lato-Regular.ttf
│   ├── Lato-Bold.ttf
│   ├── Lato-Italic.ttf
│   └── ...
├── images/               # Imágenes y gráficos
│   ├── ACT.png
│   ├── seriografia.jpg
│   ├── cover_background.jpg
│   └── ...
└── sections/            # Secciones del documento
    ├── 01-objeto.tex
    ├── 02-requisitos.tex
    ├── 03-arquitectura.tex
    └── 04-implementacion.tex
```

## Configuración

### Metadatos del documento
Modifica los metadatos en `report.tex`:

```latex
\title{Propuesta de colaboración}
\subtitle{Sistema de gestión eUDR}
\author{Altia}
\date{\today}
```

### Nombre de archivo de salida
Para cambiar el nombre del PDF generado, modifica la variable `OUTPUT_NAME` en el `Makefile`:

```makefile
OUTPUT_NAME = propuesta-de-colaboracion-sistema-de-gestion-eudr
```

## Compilación

### Usando Makefile
```bash
make clean    # Limpia archivos temporales
make pdf      # Compila el documento
make all      # Limpia y compila
```

### Compilación manual
```bash
xelatex report.tex
xelatex report.tex  # Segunda pasada para referencias
```

## Personalización

### Agregar nuevas secciones
1. Crea un nuevo archivo en `sections/` (ej. `05-nueva-seccion.tex`)
2. Añade `\input{sections/05-nueva-seccion.tex}` en `report.tex`

### Cambiar imágenes
- Coloca las nuevas imágenes en la carpeta `images/`
- Actualiza las referencias en los archivos correspondientes

### Modificar estilos
- Los colores y estilos se definen en `tudelf-report.cls`
- Las fuentes se cargan desde la carpeta `fonts/`

## Características

- **Seriografía automática**: Patrón de fondo en páginas 2+
- **Portada personalizada**: Diseño profesional con logos
- **Estructura modular**: Secciones en archivos separados
- **Fuentes personalizadas**: Lato como tipografía principal
- **Compilación automatizada**: Makefile con nombres parametrizados
- **Control de versiones**: .gitignore optimizado para LaTeX

## Requisitos

- XeLaTeX
- Fuentes Lato (incluidas en `fonts/`)
- Paquetes LaTeX: fontspec, tikz, babel, geometry, etc.

## Notas

- Utiliza texto Lorem Ipsum como ejemplo
- La seriografía aparece desde la página 2
- El documento se compila con XeLaTeX para soporte completo de fuentes