# Guía para IA: Trabajo con Plantilla LaTeX

## Comandos esenciales de compilación

### Compilación usando Makefile
```bash
make clean    # Limpia archivos temporales
make pdf      # Compila el documento
make all      # Limpia y compila
```

### Compilación manual (si falla Makefile)
```bash
xelatex report.tex
xelatex report.tex  # Segunda pasada para referencias
```

## Estructura del proyecto y archivos clave

### Archivo principal
- `report.tex` - Documento principal donde se definen metadatos y se incluyen secciones

### Configuración de estilos
- `tudelf-report.cls` - Clase personalizada con estilos, colores, fuentes y seriografía
- `cover.tex` - Definición de la portada

### Contenido modular
- `sections/` - Carpeta con secciones individuales del documento
  - `01-objeto.tex`
  - `02-requisitos.tex`
  - `03-arquitectura.tex`
  - `04-implementacion.tex`

### Recursos
- `images/` - Todas las imágenes (logos, seriografía, fondos)
- `fonts/` - Fuentes Lato personalizadas

## Propósito de la plantilla

Esta plantilla está **diseñada para propuestas comerciales** pero puede adaptarse para manuales técnicos.

### Configuración para propuestas comerciales:
- **Logo del cliente**: OBLIGATORIO incluir en `images/` y referenciar en `cover.tex`
- **Secciones estándar**: Objeto, Requisitos, Arquitectura, Implementación
- **Colores corporativos**: Personalizar en `tudelf-report.cls`

### Adaptación para manuales técnicos:
- **Cambiar secciones** en `sections/`: Introducción, Instalación, Configuración, Uso, etc.
- **Actualizar includes** en `report.tex`
- **Ajustar títulos** según tipo de manual

## Personalización de documentos

### Cambiar metadatos
Editar en `report.tex`:
```latex
\title{Tu Título}
\subtitle{Tu Subtítulo}
\author{Tu Nombre/Empresa}
\date{\today}
```

### Cambiar nombre del archivo de salida
1. Editar en `Makefile`:
```makefile
FILE = nombre-de-tu-documento
```
2. Renombrar el archivo principal `.tex` para que coincida con este nombre

### Modificar seriografía y cabeceras
La seriografía se configura en `tudelf-report.cls` líneas 85-99:
- Posición: `\put(\paperwidth-5cm, -1cm)`
- Imagen: `images/seriografia.jpg`
- Texto: Se define en dos bloques separados para título y subtítulo

### Gestión de logos e imágenes

#### Logo del cliente (CRÍTICO para propuestas comerciales):
1. **Colocar archivo** en `images/` (formatos: .png, .jpg, .pdf)
2. **Descomentar líneas 19-21** en `cover.tex`:
   ```latex
   \node[anchor=south west, inner sep=0pt] at ([xshift=2.5cm, yshift=2cm]current page.south west) {
       \includegraphics[height=1.5cm]{images/logo_cliente.png}
   };
   ```
3. **Ajustar nombre** del archivo si es necesario

#### Otros elementos visuales:
- **Logo corporativo**: Actualizar `images/ACT.png`
- **Seriografía**: Cambiar `images/seriografia.jpg` por patrón corporativo
- **Fondo portada**: Personalizar `images/cover_background.jpg`

### Añadir nuevas secciones
1. Crear archivo en `sections/` (ej: `05-nueva-seccion.tex`)
2. Agregar `\input{sections/05-nueva-seccion.tex}` en `report.tex`

### Ejemplos de secciones por tipo de documento:

**Propuestas comerciales:**
- 01-objeto.tex (Objetivo/Alcance)
- 02-requisitos.tex (Requisitos técnicos)
- 03-arquitectura.tex (Solución propuesta)
- 04-implementacion.tex (Plan de implementación)

**Manuales técnicos:**
- 01-introduccion.tex
- 02-instalacion.tex
- 03-configuracion.tex
- 04-uso.tex
- 05-troubleshooting.tex

## Resolución de problemas comunes

### Errores de compilación
- **Fuentes no encontradas**: Verificar que existan en `fonts/`
- **Imágenes no encontradas**: Verificar rutas en `images/`
- **Makefile falla**: Usar compilación manual con `xelatex`

### Ajustes de diseño
- **Colores**: Definidos en `tudelf-report.cls` líneas 29-33
- **Márgenes**: Configurados en líneas 20-26
- **Títulos**: Estilos en líneas 106-125

## Flujo de trabajo recomendado

1. **Siempre compilar** después de cambios importantes
2. **Verificar posicionamiento** de seriografía tras modificaciones
3. **Probar segunda pasada** si hay problemas con referencias
4. **Limpiar archivos temporales** si hay errores persistentes

## Notas técnicas

- **Motor LaTeX**: XeLaTeX (requerido para fuentes personalizadas)
- **Fuente principal**: Lato (incluida en el proyecto)
- **Seriografía**: Aparece desde página 2, posicionada en esquina superior derecha
- **Idioma**: Configurado para español

## Diagramas Gantt

### Paquetes necesarios
Para usar diagramas Gantt, agregar estos paquetes en `tudelf-report.cls`:
```latex
\usepackage{pgfgantt}
\usepackage{pdflscape}  % Para orientación landscape
\usepackage{float}      % Para posicionamiento [H]
```

### Ejemplo completo de diagrama Gantt
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
    \end{ganttchart}}
    \caption{Planificación temporal de la Fase 1}
    \label{fig:planificacion}
\end{figure}
\end{landscape}
```

### Elementos del diagrama Gantt:

**Configuración básica:**
- `x unit`: Ancho de cada unidad temporal
- `y unit title/chart`: Altura de títulos y barras
- `vgrid/hgrid`: Líneas de cuadrícula vertical/horizontal

**Elementos principales:**
- `\ganttgroup{Nombre}{inicio}{fin}`: Grupos/fases principales
- `\ganttbar{Tarea}{inicio}{fin}`: Tareas individuales
- `\ganttmilestone{Hito}{posición}`: Hitos importantes
- `\ganttlink{elemento1}{elemento2}`: Enlaces entre elementos

**Estilos personalizables:**
- `bar/.style={color, rounded corners}`: Estilo de barras
- `milestone/.style={diamond, color}`: Estilo de hitos
- `link/.style={arrow, color, thickness}`: Estilo de enlaces

### Tips para diagramas Gantt:
1. **Orientación landscape**: Usar para cronogramas largos
2. **Colores por fase**: Diferentes colores para cada etapa
3. **Hitos críticos**: Marcar entregas importantes
4. **Enlaces de dependencia**: Mostrar relaciones entre tareas
5. **Compilar dos veces**: Para referencias correctas

## Comandos útiles para IA

```bash
# Ver estructura del proyecto
ls -la

# Verificar archivos de sección
ls sections/

# Comprobar imágenes disponibles
ls images/

# Limpiar y recompilar completamente
make clean && make pdf
```