<center>
<img src="https://objetivo.news/download/multimedia.normal.bcba10cea1861629.Y29kZXJob3VzZS1xdWUtZXMtcXVlLWhhY2VuX25vcm1hbC53ZWJw.webp" style="width: 100% ; aspect-ratio:16/9">
</center>


# <center>Entrega de proyecto final</center>
@Matias Fredes

@53180-sql

@Carla Palermo Palermo @Santiago Angel Gonzalez Martin

@Anderson Michel Torres



---

### **Consignas:**
- La base de datos debe contener al menos:
    * ~ 15 tablas, entre las cuales debe haber al menos 1 tabla de hechos,  2 tablas transaccionales.
    * ~ 5 vistas.
    * ~ 2 stored procedure.
    * ~ 2  trigger.
    * ~ 2 funciones
    
- El documento debe contener:
    - Introducción
    - Objetivo
    - Situación problemática
    - Modelo de negocio
    - Diagrama de entidad relació
    - Listado de tablas con descripción de estructura (columna,descripción, tipo de datos, tipo de clave)
    - Scripts de creación de cada objeto de la base de datos
    - Scripts de inserción de datos
    - Informes generados en base a la información de la base
    - Herramientas y tecnologías usadas



---

## Tematica del proyecto

El proyecto consiste en el desarrollo de un Sistema de Gestión Académica para la Universidad Tecnológica Nacional (UTN) que permita administrar y organizar de manera eficiente los datos de estudiantes, cursos, inscripciones, notas y profesores. Este sistema está diseñado para mejorar la gestión de información académica, facilitar la inscripción de estudiantes a cursos, y proporcionar herramientas analíticas para evaluar el rendimiento estudiantil y la carga académica. 

## Modelo de negocio

El Sistema de Gestión Académica para la Universidad Tecnológica Nacional (UTN) se presenta como una solución que ofrece una propuesta de valor única al automatizar y optimizar la administración académica, permitiendo una gestión centralizada y segura de la información. De obtener resultados positivos, este sistema estará dirigido a universidades y centros educativos que buscan mejorar la eficiencia administrativa y ofrecer herramientas analíticas avanzadas.

## Diagrama entidad relacion (DER)

<center>
<img src="./images/DER.PNG" style="width: 100% ; aspect-ratio:16/9">
</center>

## Listado de tablas y descripcion

## Tabla ESTUDIANTES: Almacena la información de todos los alumnos de la facultad

| Campo         | Campo (completo)        | Tipo de dato | Longitud | Tipo de Clave | Not Null | Auto Incremental | Default | Clave Index | Clave Unique | Descripción                     |
|---------------|-------------------------|--------------|----------|---------------|----------|-------------------|---------|-------------|--------------|---------------------------------|
| ID_ESTUDIANTE | ID_DEL_ESTUDIANTE       | INT          |          | Primaria      | X        | X                 |         | X           | X            | Identificador del estudiante    |
| NOMBRE_EST    | NOMBRE_DEL_ESTUDIANTE   | VARCHAR      | 100      |               | X        |                   |         |             |              | Nombre del estudiante           |
| APELLIDO_EST  | APELLIDO_DEL_ESTUDIANTE | VARCHAR      | 100      |               | X        |                   |         |             |              | Apellido del estudiante         |
| FECHA_NAC     | FECHA_DE_NACIMIENTO     | DATE         |          |               | X        |                   |         |             |              | Fecha de nacimiento             |
| GENERO        | GENERO                  | VARCHAR      | 1        |               |          |                   |         |             |              | Género del estudiante (M/F)     |
| DIRECCION     | DIRECCION_DEL_DOMICILIO | VARCHAR      | 100      |               |          |                   |         |             |              | Dirección del estudiante        |
| CORREO_EST    | CORREO_DEL_ESTUDIANTE   | VARCHAR      | 100      |               | X        |                   |         |             | X            | Correo electrónico              |
| TEL_EST       | TELEFONO_DEL_ESTUDIANTE | VARCHAR      | 20       |               | X        |                   |         |             | X            | Número de teléfono              |


## Estructura e ingesta de datos

## Objetos de la base de datos

## Roles y permisos

## Back up de la base de datos

## Herramientas y tecnologias usadas

## Como levantar el proyecto en CodeSpaces GitHub
* env: Archivo con contraseñas y data secretas
* Makefile: Abstracción de creacción del proyecto
* docker-compose.yml: Permite generar las bases de datos en forma de contenedores

#### Pasos para arrancar el proyecto

* En la terminal de linux escribir :
    - `make` _si te da un error de que no conexion al socket, volver al correr el comando `make`_
    - `make clean-db` limpiar la base de datos
    - `make test-db` para mirar los datos de cada tabla
    - `make backup-db` para realizar un backup de mi base de datos
    - `make access-db` para acceder a la base de datos
