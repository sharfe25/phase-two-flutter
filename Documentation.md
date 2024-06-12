# Documentación del Diseño

## Modelos de Datos
En este proyecto, se han definido varios modelos de datos para representar las entidades principales que se manejan en la aplicación. Algunos de los modelos de datos más importantes incluyen:

- **CategoryModel**: Este modelo representa una categoría de productos en la tienda. Contiene campos como id para identificar la categoría y name para el nombre de la categoría.

- **ProductModel**: Este modelo representa un producto en la tienda. Contiene campos como id para identificar el producto, title para el nombre del producto, image para la URL de la imagen del producto, y price para el precio del producto.

Estos modelos de datos se utilizan para estructurar y representar la información obtenida de la API y para facilitar su manipulación en la aplicación.

## Solicitud y Procesamiento de la API
Para realizar solicitudes a la API y procesar los datos recibidos, se ha implementado una capa de servicios. Cada servicio corresponde a una entidad principal en la aplicación (por ejemplo, CategoryService para las categorías y ProductService para los productos).

### Ejemplo de CategoryService
El CategoryService tiene un método getAllCategories() que se encarga de obtener todas las categorías de productos desde la API. La solicitud se realiza utilizando el adaptador HTTP HTTPAdapter, que maneja las solicitudes HTTP y devuelve los datos en forma de Either.

### Implementación del Control de Errores con Either
Para manejar los errores que pueden ocurrir al realizar solicitudes a la API o al procesar los datos, se ha utilizado la clase Either de la biblioteca Dartz. Esta clase representa un tipo que puede ser uno de dos tipos: Left (correcto) o Right (error).

**Ejemplo de Uso de Either**
```
final Either<List<CategoryModel>, int> result = await CategoryService().getAllCategories();

result.fold(
  (List<CategoryModel> categories) {
    // Procesar datos exitosos
    // categories contiene la lista de categorías
  },
  (int error) {
    // Manejar el error
    // error contiene el código de error
  },
);
```
Al usar Either, podemos manejar de manera más elegante y segura los casos de éxito y error en nuestras solicitudes a la API y operaciones de procesamiento de datos. Esto ayuda a mejorar la robustez y la legibilidad del código.