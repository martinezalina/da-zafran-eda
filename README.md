# Zafrán

#### Time Series Data Analytics

## Objetivo

El objetivo de este proyecto es analizar **ingresos por ventas** de la Empresa Zafrán. Para ello se realiza la creación de una db en Postgre que contiene los datos originales de la empresa. Luego se procede a generar un esquema con tablas consolidadas. A posteriori se procede a analizar los datos.

Con el consolidado resultante (r00ventas.csv) se realizan dos modalidades de análisis:

1. Vía SQL
2. Vía python (notebooks)

En ambos caminos se llega a las mismas conclusiones. Igualmente les recomendamos realizar una lectura de los notebooks ya que por su naturaleza son mucho más visuales.

Una vez realizado el tratamiento de los datos, es posible alimentar el **Dashboard** realizado en **Google Data Studio** con el fin de visualizar todos los datos más relevantes sobre los ingresos de la empresa Zafrán.

## Dataset

Los datos son datos de ejemplo. Es decir, no son datos reales.

### Creación de Postgre Db

Dentro de la carpeta `SQLs` se encuentran las tablas en csv (`SQLs\tablas_csv` ). Para la creación de las mismas, se requiere ejecutar el archivo `SQLs\00. Creacion de tablas - Subida Manual.sql`.

Una vez cargado el contenido en la base de datos, se debe ejetutar el archivo `SQLs\01. Creación de tablas BI.sql` el cual creará el SCHEMA de BI.

### Análisis por SQL queries

Para visualizar los resultados de las querys y/o hacer un seguimiento del análisis exploratorio realizado, se recomienda utilizar las consultas del aarchivo `SQLs\02. Exploración.sql`.

### Datasets resultantes

Una vez montada la db y generado el SCHEMA BI, se generó la exportación del dataset consolidado `r00_ventas.csv`.

Una vez analizado, bajo las dos metodologías (SQL Queries y Python) se concluye generar un nuevo consolidado `r02_ventas_fix_sin_outliers.csv`.

Este último es que que se utiliza para alimentar el dashboard de ventas.

## EDA en Jupyter Notebook

Dentro de `Notebooks\` es posible acceder a dos notebooks de Jupyter en donde se realiza la primer lectura de los datos en `Notebooks\JupyterNotebook_prd_tablas.ipynb` y, el análisis exhaustivo del consolidado de ventas en `Notebooks\JupyterNotebook_prd_serie.ipynb`.

> Aclaración: Para poder correr los notebooks, no es necesario levantar la Db en postgreSQL. Todos los datasets utilizados se encuentran en este repo.

Desde el último notebook se obtiene, entre otras cosas:

- La descomposición de la serie BAR que nos permite analizar la tendencia y estacionalidad.
- La correlación que existe entre las marcas.

#### EDA checklist

- Time Series resample
- Missing Values
- Atypical Values / Outliers
- Correlation
- Autocorrelation
- Seasonal Components

## Tech stack

- Python
- Pandas
- Numpy
- Matplotlib
- Sklearn
- sqrt
- Plotly
- PostgreSQL
