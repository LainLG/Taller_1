# Taller 1: Bases de Datos


## Caso de Estudio

### Empresa de zapatos.

La empresa santandereana **huellitas** crece rápidamente, sus dueños se dieron cuenta de la necesidad de sistematizar ciertos procesos de la cadena de producción de la empresa. Para esta tarea han contratado a su grupo de desarrollo y usted es el encargado de modelar y generar la estructura de base de datos para la persistencia del nuevo sistema de la empresa, el ingeniero de requerimientos redacto para usted el modelo de trabajo de la empresa:La cadena de producción de zapatos requiere de maestros zapateros, cortadores y ayudantes, es necesario que en la base
de datos se almacene la información de estas personas y se relaciones con los productos que genera en la cadena de producción. La empresa recibe lotes de moldes, materiales, suelas y accesorios, cada lote debe ser identificado, y también se debe registrar la fecha de recepción y la fecha en la cual el lote se agotó (si aplica), los lotes son gestionados por los ayudantes.Para crear un zapato la empresa requiere de tres elementos:

* Un molde de hierro y plástico que posee la talla y forma de determinado tipo de zapato. Los moldes son creados por una empresa externa y se reciben en lotes, cada molde debe ser identificado y puede ser usado para ensamblar muchos zapatos.

* Los trozos de material que generan los cortadores desde un determinado lote de material, un zapato puede estar compuesto por dos, tres o más trozos que pueden ser de un mismo material o diferentes materiales.

* Una suela que depende del tipo de zapato, pero que fabrica una empresa externa y pertenecen a un lote determinado.

El proceso para generar un lote de zapatos consta de tres partes:

1. Los maestros zapateros se reúnen para crear el diseño, seleccionado los rangos de tallas, cantidad de trozos y materiales involucrados, así como el tipo de suela.
2. Se determina el número de zapatos a fabricar y el tiempo para cada lote, luego los cortadores generan los trozos de material necesarios para crear un lote de zapatos.
3. Los ayudantes preparan las suelas del zapato y los maestros zapateros con base en el diseño elegido seleccionan varios moldes, realiza el proceso de pegado de los trozos y la unión de la suela para la construcción de cada zapato. Adicionalmente algunos zapatos pueden tener accesorios como cadenas, figuras, entre otros que pueden o no ser adicionados por el maestro zapatero dependiendo del diseño elegido.En resumen, cuando se termina de fabricar un zapato el sistema debe permitir realizar la trazabilidad de su construcción, permitiendo conocer a que lote pertenece el zapato, sus propiedades, que maestro zapatero lo realizó y en que molde, quien fue el ayudante que lo asistió, que suela se usó, que trozos se usaron, quien fue el cortador que genero esos trozos, de que materiales y de que lotes se generaron.

#### Actividades:

1. La descripción generada por el ingeniero de requerimientos no especifica las propiedades de muchos componentes de la cadena de producción del zapato, realice un modelo entidad relación y adicione las propiedades que considere necesarias.

2. Después de generar y normalizar un modelo entidad relación, realice un análisis y responda las siguientes preguntas:

    * Si un empleado pasa de ser ayudante a maestro zapatero,cómo se ve afectado los registros que ya se encontraban en base de datos de este empleado, ¿es posible hacer el cambio de rol sin afectarlos?Actividades:

        * Si un empleado ayudante pasa a ser maestro zapatero se modifica la clase Persona_cargo donde se cambia el id de cargo y se modifica la fecha de fin de carga (Valor por defecto Null) se agrega el cargo de ayudante al atributo cargo_antiguo y se agrega un nuevo usuario esto hace que se pueda llevar un registro de los cambios de cargos del personal pero genera algo de redundancia de datos.

    * Si a la mitad de la producción se decide cambiar un diseño de un zapato, que ya no usa dos si no tres trozos de material, cada uno de un material diferente. ¿Puedo modificar este registro sin afectar los lotes ya generados de este diseño?

        * No si se modifica el un diseño de zapato todo los zapatos se modifican ya que estos estan relacionados con el diseño.

3. En su motor de base de datos preferido cree la base de datos con base en el modelo entidad relación que realizó. Luego realice las siguientes operaciones y adjunte el código SQL que permite realizaras.

##### Actividades:

* Insertar 3 maestros zapateros, 2 ayudantes y 2 cortadores en base de datos.

* Insertar un nuevo diseño de un zapato.

* Insertar un nuevo lote de 10 zapatos generados a partir de este diseño y con los empleados ya creados.

* Modificar el rol de un empleado de ayudante a maestro zapatero.

* Actualizar un diseño de un zapato agregando un accesorio nuevo.

* Actualizar un diseño de un zapato agregando un trozo de un material diferente.

* Eliminar un zapato de un lote.

* Eliminar un diseño de un zapato en base de datos que ya tenga un lote de 10 zapatos generados.

* Insertar un nuevo accesorio en base de datos y luego insertar un diseño que use este accesorio.

#### Actividades:

4. Una vez tenga la base de datos con la estructura y los datos cargados, realice las siguientes consultas en base de datos incluya el código SQL en el informe.

* Realizar una consulta que permita conocer en que zapatos fue usado determinado molde.

* Realizar una consulta que permita conocer que lotes de material fueron usados en la construcción de un zapato.

* Realizar un consulta que permita conocer cuanto zapatos se crearon para un diseño determinado.