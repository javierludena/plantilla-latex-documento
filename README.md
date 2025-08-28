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
- Cada documento tiene su propio repositorio
- Historial de cambios independiente
- Posibilidad de colaboración específica por documento
- Versionado limpio por proyecto
- Fácil actualización de la plantilla base cuando sea necesario

### Ventajas de usar latex:
- Formato que puede trabajar IA/Cline no como .word
- Facilidad para rellenar el texto en secciones y no preocuparse por saltos de línea o visualización, ya que se compila directamente a PDF.

## Estructura de Directorios

```
plantilla_latex_modificada/
├── example-latin.tex       # Documento principal
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
Modifica los metadatos en `example-latin.tex`:

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

## Instalar Make en Windows

Para usar el Makefile en Windows necesitas instalar la herramienta Make.  
Puedes hacerlo de varias formas:

**Opción A: Usando Chocolatey**  
1. Instala Chocolatey (si no lo tienes):  
   Abre PowerShell como administrador y ejecuta:  
   ```powershell
   Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
   ```
2. Instala Make:  
   ```powershell
   choco install make
   ```

**Opción B: Usando Git Bash**  
- Si tienes Git para Windows instalado, puedes usar `make` desde Git Bash.

**Opción C: Usando MinGW**  
- Descarga MinGW desde http://www.mingw.org/
- Durante la instalación, selecciona el paquete `mingw32-make`.

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
2. Añade `\input{sections/05-nueva-seccion.tex}` en `example-latin.tex`

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
2. Actualizar `example-latin.tex` con las nuevas inclusiones
3. Ajustar título y subtítulo según el manual

## Características

- **Seriografía automática**: Patrón de fondo en páginas 2+
- **Portada personalizada**: Diseño profesional con logos del cliente y empresa
- **Estructura modular**: Secciones en archivos separados fácil de reorganizar
- **Fuentes personalizadas**: Lato como tipografía principal
- **Diagramas Gantt**: Soporte nativo para cronogramas de proyecto. Se incluye un ejemplo en la sección de implementación.
- **Compilación automatizada**: Makefile con nombres parametrizados
- **Control de versiones**: .gitignore optimizado para LaTeX

## Requisitos

- XeLaTeX (asegúrate de instalar el paquete "xelatex" desde MikTeX Console: ve a "Packages", busca "xelatex" y pulsa "Install")
- MikTeX: https://miktex.org/download
- Fuentes Lato (incluidas en `fonts/`)
- Paquetes LaTeX: fontspec, tikz, babel, geometry, etc.

## Notas

- Utiliza texto Lorem Ipsum como ejemplo
- La seriografía aparece desde la página 2
- El documento se compila con XeLaTeX para soporte completo de fuentes

## Añadir Imágenes

Para añadir una imagen en una sección, puedes utilizar el siguiente código:

```latex
\begin{figure}[H]
    \centering
    \includegraphics[width=0.5\textwidth]{images/SENECA.jpg}
    \caption{Lorem Ipsum}
    \label{fig:seneca}
\end{figure}
```

Asegúrate de que la imagen se encuentra en la carpeta `images/`.

## Añadir Diagramas de Gantt

Esta plantilla tiene soporte nativo para diagramas de Gantt utilizando el paquete `pgfgantt`.

### Paquetes necesarios

Los siguientes paquetes ya están incluidos en `tudelf-report.cls`:
```latex
\usepackage{pgfgantt}
\usepackage{pdflscape}  % Para orientación landscape
\usepackage{float}      % Para posicionamiento [H]
```

### Ejemplo de Diagrama de Gantt

Puedes añadir un diagrama de Gantt a tu documento con el siguiente código:

```latex
\subsection{Cronograma del Proyecto}

\begin{landscape}
\thispagestyle{empty}
\begin{figure}[H]
    \centering
    \makebox[\paperwidth][c]{% 
    \begin{ganttchart}[
        x unit=1.2cm,
        y unit title=0.6cm,
        y unit chart=0.7cm,
        vgrid={*{14}{draw=black!6}},
        hgrid={*{1}{draw=black!12}},
        title height=1,
        title label font=\footnotesize\bfseries,
        bar/.style={blue!40, rounded corners=2pt},
        bar height=0.7,
        bar label font=\footnotesize,
        group right shift=0,
        group height=.5,
        group peaks width={.2},
        group label font=\footnotesize\bfseries,
        group/.style={black!50},
        milestone/.style={diamond, draw=red!90, fill=red!90},
        milestone label font=\footnotesize,
        progress label text={},
        link/.style={-latex, red, thick},
        time slot format=simple
    ]{1}{19}
        % Título y semanas
        \gantttitle{Planificación Fase 1 (Abril - Septiembre 2025)}{19} \\
        \gantttitle{Semana}{19} \\
        \gantttitlelist{1,...,19}{1} \\
        
        % Fases Principales
        \ganttgroup{Análisis y Diseño}{1}{2} \\
        \ganttbar[name=analisis, bar/.style={fill=blue!20}]{Análisis Requisitos}{1}{1} \\
        \ganttbar[name=diseno, bar/.style={fill=blue!20}]{Diseño Sistema}{2}{2} \\
        \ganttmilestone[name=m1]{Diseño Completado}{2} \\
        
        \ganttgroup{Implementación}{3}{10} \\
        \ganttbar[name=auth, bar/.style={fill=green!20}]{Etapa 1: Autenticación}{3}{4} \\
        \ganttbar[name=averias, bar/.style={fill=green!20}]{Etapa 2: Gestión Averías}{5}{6} \\
        \ganttbar[name=penal, bar/.style={fill=green!20}]{Etapa 3: Penalizaciones}{7}{8} \\
        \ganttbar[name=kpis, bar/.style={fill=green!20}]{Etapa 4: Exportación}{9}{10} \\
        \ganttmilestone[name=m2]{Implementación Completada}{10} \\
        
        \ganttgroup{Pruebas e Integración}{11}{18} \\
        \ganttbar[name=testing, bar/.style={fill=orange!20}]{Testing}{11}{16} \\
        \ganttbar[name=optim, bar/.style={fill=orange!20}]{Optimización}{17}{18} \\
        \ganttmilestone[name=m3]{Pruebas Completadas}{18} \\
        
        \ganttgroup{Despliegue}{19}{19} \\
        \ganttbar[name=deploy, bar/.style={fill=purple!20}]{Despliegue Final}{19}{19} \\
        \ganttmilestone[name=m4]{Entrega}{19}

        % Enlaces entre etapas
        \ganttlink[link/.style={gray!50}]{analisis}{diseno}
        \ganttlink[link/.style={red}]{m1}{auth}
        \ganttlink[link/.style={gray!50}]{auth}{averias}
        \ganttlink[link/.style={gray!50}]{averias}{penal}
        \ganttlink[link/.style={gray!50}]{penal}{kpis}
        \ganttlink[link/.style={red}]{m2}{testing}
        \ganttlink[link/.style={gray!50}]{testing}{optim}
        \ganttlink[link/.style={red}]{m3}{deploy}
    \end{ganttchart}}%
    \caption{Planificación temporal de la Fase 1}
    \label{fig:planificacion}
\end{figure}
\end{landscape}
```

## Licencia

El código de esta plantilla se distribuye bajo la licencia MIT. Puedes encontrar el texto completo de la licencia en el fichero `LICENSE`.

**Nota sobre las imágenes:** La licencia MIT no se aplica a las imágenes contenidas en la carpeta `images/`. Estas imágenes se utilizan a modo de ejemplo y sus derechos pertenecen a sus respectivos autores.
