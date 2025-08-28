# Plantilla LaTeX Estructurada

Esta es una plantilla de documento LaTeX profesional con estructura modular y organizada.

## Propósito de la plantilla

Esta plantilla está **diseñada específicamente para propuestas comerciales**, aunque también puede adaptarse para otros tipos de documentos como manuales técnicos.

### Casos de uso principales:
- 📋 **Propuestas comerciales** - Configuración por defecto
- 📖 **Manuales técnicos** - Cambiar las secciones según necesidades
- 📄 **Documentos corporativos** - Reportes, análisis, etc.

## Cómo usar esta plantilla

### Método recomendado: Fork del repositorio

1. **Crear un fork** de este repositorio para cada nuevo documento
2. **Clonar** tu fork localmente:
   ```bash
   git clone https://github.com/tu-usuario/nombre-de-tu-fork.git
   ```
3. **Personalizar** los metadatos y contenido para tu documento específico
4. **Compilar** y trabajar en tu copia independiente

### Ventajas de usar forks:
- ✅ Cada documento tiene su propio repositorio
- ✅ Historial de cambios independiente
- ✅ Posibilidad de colaboración específica por documento
- ✅ Versionado limpio por proyecto
- ✅ Fácil actualización de la plantilla base cuando sea necesario

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
Para cambiar el nombre del PDF generado, modifica la variable `FILE` en el `Makefile`:

```makefile
FILE = example-latin
```

También debes renombrar el archivo principal `.tex` para que coincida con este nombre.

**Archivo principal de ejemplo:** `example-latin.tex`

## Compilación

La compilación se realiza usando el Makefile incluido:

```bash
make clean    # Limpia archivos temporales
make pdf      # Compila el documento
make all      # Limpia y compila
```

## Personalización

### Agregar nuevas secciones
1. Crea un nuevo archivo en `sections/` (ej. `05-nueva-seccion.tex`)
2. Añade `\input{sections/05-nueva-seccion.tex}` en `report.tex`

### Cambiar imágenes y logos

#### Logo del cliente (para propuestas comerciales):
1. **Colocar el archivo** del logo en la carpeta `images/`
   - Formatos soportados: `.png`, `.jpg`, `.pdf`  
   - Nombre sugerido: `logo_cliente.png`
2. **Descomentar las líneas** en `cover.tex` (líneas 19-21):
   ```latex
   \node[anchor=south west, inner sep=0pt] at ([xshift=2.5cm, yshift=2cm]current page.south west) {
       \includegraphics[height=1.5cm]{images/logo_cliente.png}
   };
   ```
3. **Ajustar el nombre** del archivo si es necesario

#### Otros elementos visuales:
- **Logo de empresa**: Actualiza `images/ACT.png` con tu logo corporativo
- **Seriografía**: Cambia `images/seriografia.jpg` por tu patrón de fondo
- **Fondo de portada**: Actualiza `images/cover_background.jpg` según diseño

> ⚠️ **IMPORTANTE**: Para propuestas comerciales, siempre incluir el logo del cliente siguiendo los pasos anteriores

### Modificar estilos
- Los colores y estilos se definen en `tudelf-report.cls`
- Las fuentes se cargan desde la carpeta `fonts/`

## Adaptación para diferentes tipos de documento

### Para propuestas comerciales (configuración actual):
- Secciones: Objeto, Requisitos, Arquitectura, Implementación
- **Incluir logo del cliente** en `images/` y referenciarlo en `cover.tex`
- Personalizar colores corporativos en `tudelf-report.cls`

### Para manuales técnicos:
1. Cambiar las secciones en `sections/`:
   - `01-introduccion.tex`
   - `02-instalacion.tex` 
   - `03-configuracion.tex`
   - `04-uso.tex`
   - `05-troubleshooting.tex`
2. Actualizar `report.tex` con las nuevas inclusiones
3. Ajustar título y subtítulo según el manual

## Características

- **Seriografía automática**: Patrón de fondo en páginas 2+
- **Portada personalizada**: Diseño profesional con logos del cliente y empresa
- **Estructura modular**: Secciones en archivos separados fácil de reorganizar
- **Fuentes personalizadas**: Lato como tipografía principal
- **Diagramas Gantt**: Soporte nativo para cronogramas de proyecto
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