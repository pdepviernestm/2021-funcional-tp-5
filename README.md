# TP-5 !

## Tareas

- [ ] Aceptar el assignment y clonar el repositorio con el ejercicio
- [ ] Ir a la carpeta donde descargaste la kata. Ejemplo: `cd /home/juan/haskell/2020-funcional-tp-5`. Ejecutar `stack build --test`.
- [ ] Reemplazar la lista de integrantes con los nombres de los integrantes del equipo en el archivo README.md
- [ ] Resolver el ejercicio siguiendo [un esquema de trabajo](https://github.com/pdep-utn/enunciados-miercoles-noche/blob/master/pages/haskell/trabajo.md), eso incluye
- [ ] Ejecutar los tests con `stack test` y que den verde
- [ ] A medida que vas resolviendo el ejercicio, subir [el progreso a git](https://github.com/pdep-utn/enunciados-miercoles-noche/blob/master/pages/git/resolverConflictos.md)

## Integrantes

**Equipo:**  Team Rocket

- Juan Fernandes (@juanFdS)
- Federico Romero (@fecheromero)

## Objetivos

Los objetivos de este tp son practicar los conceptos vistos en la clase: composición y aplicación parcial.

## Pre-requisitos

Necesitás haber instalado el ambiente según se explica en el [TP-0](https://classroom.github.com/a/--fY8B_v).

## Ayuda

Si tienen dudas con Haskell pueden ayudarte todo el tiempo con esta documentación

- [Guía de lenguajes](https://docs.google.com/document/d/1oJ-tyQJoBtJh0kFcsV9wSUpgpopjGtoyhJdPUdjFIJQ/edit?usp=sharing), un resumen de las principales funciones que vienen con Haskell.
- [Hoogle](https://www.haskell.org/hoogle/), un motor de búsqueda específico para Haskell.

Aparte, siempre pueden preguntar a sus ayudantes en [discord](https://discord.gg/4KY8PWp)!

Para trabajar con Git recomendamos que vean [este apunte inicial de Git](https://docs.google.com/document/d/1ozqfYCwt-37stynmgAd5wJlNOFKWYQeIZoeqXpAEs0I/edit) o estos videos donde se explica como usar Git:
- [Parte 1: Qué es GIT y cómo clonar el repo basado en GitHub classroom](https://www.youtube.com/watch?v=rRKe7l-ZNvM)
- [Parte 2: Uso básico de GIT con status, add, reset, commit, push](https://www.youtube.com/watch?v=OgasfM5qJJE)
- [Parte 3: Resolución de conflictos](https://www.youtube.com/watch?v=sKcN7cWFniw)

### Probando cosas por consola

La forma que recomendamos de resolver la kata es no programar todo de una y después ver si anda, si no ir probando en cada paso a medida que van programando cada función.

Para esto, les recomiendo que usen mucho `stack ghci` para probar cosas por consola, y vuelvo a linkear [esta página](https://github.com/pdep-utn/enunciados-miercoles-noche/blob/master/pages/haskell/trabajo.md#comandos-%C3%BAtiles) donde se explican un par de cositas de como usar `ghci`.

### Testeo automatizado

Nuestra solución tiene que estar escrita en el archivo `Library.hs` del directorio `src`, entonces podemos correr pruebas **automatizadas** para nuestro tp en la terminal:

```bash
stack test
```

También pueden ejecutar una sesión interactiva en la terminal lo cual hace que los tests se vuelvan a correr solos cada vez que guardas!: `stack test --file-watch`, como muestra [esta página](https://github.com/pdep-utn/enunciados-miercoles-noche/blob/master/pages/haskell/trabajo.md#pruebas-automatizadas).

Para conocer un poco más del testeo unitario automatizado recomendamos leer [este apunte](https://docs.google.com/document/d/17EPSZSw7oY_Rv2VjEX2kMZDFklMOcDVVxyve9HSG0mE/edit#)

## El enunciado

Resolver este TP  **usando composición y aplicación parcial**.

### Parte 1: Hamburguesas

Nos pusimos una hamburguesería y queremos implementar un sistema para calcular los precios de las hamburguesas que vamos a vender. Cada hamburugesa tiene un precio base y una lista de ingredientes.
- Carne = 20
- Pan = 2
- Panceta = 10
- Cheddar = 10
- Pollo = 10
- Curry = 5
 
 cuartoDeLibra = es una hamburguesa de pan, carne, cheddar, pan y el valor inicial  es de 20.

 Partiendo de esto modelamos:
 
- **Agrandar**: cada vez que se agranda una hamburguesa se agrega otro ingrediente base (Carne | Pollo), se elige el ingrediente base a agregar según lo que ya haya en la hamburguesa (si había carne se agrega carne, si había pollo se agrega pollo, si había ambos da igual cual se agregue).
- **AgregarIngrediente**: recibe un ingrediente y una hambrugesa lo agrega a la hamburguesa.
- **descuento**: recibe un % de descuento, y devuelve la hamburguesa con ese descuento aplicado al valor inicial.

 la pdepBurguer que es un cuarto de libra agrandado 2 veces con panceta, cheddar y 20% de descuento. Su precio final deberia ser 110

### PARTE 2: Algunas hamburguesas más
El negocio se agrando y queremos agregar las siguientes hamburguesas:
- **dobleCuarto** = es un cuarto de libra con carne y cheddar. El precio final deberia ser 84.
- **bigPdep** =  es un doble cuarto con curry. El precio final deberia ser 89.
- **delDia** = es una promo que dada una hamburguesa, le agrega Papas y un descuento del 30%. Por ej, podría pedir una big pdep del dia y debería ser como una big pdep (doble cuarto con curry) pero con papas y el descuento del 30%. Por ejemplo una doble cuarto del dia deberia valer 88.

Las papas son un ingrediente que cuesta $10.

### PARTE 3: algunos cambios más 

Queremos modelar los siguientes modificadores:
- **hacerVeggie** : cambia todos los ingredientes base que hayan en la hamburguesa por PatiVegano (ingrediente base tambien de precio 10).
- **cambiarPanDePati** : cambia el Pan que haya en la hamburguesa por PanIntegral (ingrediente de precio 3).

- hacer el **dobleCuartoVegano** que es un dobleCuarto veggie con pan integral.


## Que hacer cuando terminan el TP

Cuando terminen, creen un issue etiquetando a sus tutores así les llega una notificación y se corrigen y les dejan feedback ahí.
![](https://i.imgur.com/ypeXpBw.gif)

A medida que vayamos viendo que crearon el issue, vamos a ir marcando como Entregado su TP en la planilla para que sepan que lo recibimos.
