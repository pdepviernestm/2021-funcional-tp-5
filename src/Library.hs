module Library where
import PdePreludat

data Hamburguesa = UnaHamburguesa{
    valorInicial :: Number,
    ingredientes :: [Ingrediente]
} deriving(Show,Eq)

-- Carne = 20
-- Pan = 2
-- Panceta = 10
-- Cheddar = 10
-- Pollo = 10
-- Curry = 5

data Ingrediente = Pan | Carne | Panceta | Cheddar | Pollo | Curry deriving(Show,Eq)

type  Dinero = Number

precio :: Ingrediente -> Dinero
precio Carne = 20
precio Pan = 2
precio Panceta = 10
precio Cheddar = 10
precio Pollo = 10
precio Curry = 10

-- cuartoDeLibra = es una hamburguesa de pan, carne, cheddar, pan y el valor inicial es de 20.

cuartoDeLibra = UnaHamburguesa 20 [Pan,Carne,Cheddar,Pan]

-- el precio de una hamburguesa es el valor inicial mas la sumatoria de los precios de sus ingredientes
precioHamburguesa:: Hamburguesa -> Dinero
precioHamburguesa hamburguesa = valorInicial hamburguesa + sum (map precio (ingredientes hamburguesa))

--AgregarIngrediente: recibe un ingrediente y una hambrugesa lo agrega a la hamburguesa.

agregarIngrediente :: Ingrediente -> Hamburguesa -> Hamburguesa
agregarIngrediente ingrediente (UnaHamburguesa valorInicial ingredientes) = UnaHamburguesa valorInicial (ingrediente : ingredientes)

--Agrandar: cada vez que se agranda una hamburguesa se agrega otro ingrediente base (Carne | Pollo), 
--se elige el ingrediente base a agregar según lo que ya haya en la hamburguesa 
--(si había carne se agrega carne, si había pollo se agrega pollo, si había ambos da igual cual se agregue).

agrandar :: Hamburguesa -> Hamburguesa
-- agrandar (UnaHamburguesa valorInicial ingredientes) 
--     | elem Carne ingredientes = agregarIngrediente Carne  (UnaHamburguesa valorInicial ingredientes) 
--     | elem Pollo ingredientes = agregarIngrediente Pollo  (UnaHamburguesa valorInicial ingredientes) 

agrandar hamburguesa = agregarIngrediente (ingredienteBase hamburguesa) hamburguesa

ingredienteBase :: Hamburguesa -> Ingrediente
-- ingredienteBase (UnaHamburguesa _ ingredientes)
--     | elem Carne ingredientes =  Carne
--     | elem Pollo ingredientes = Pollo

ingredientesBases = [Pollo, Carne]

-- ingredienteBase hamburguesa = head (filter (\ ingrediente -> elem ingrediente ingredientesBases) (ingredientes hamburguesa))

esBase ingrediente = elem ingrediente ingredientesBases
ingredienteBase hamburguesa = head (filter esBase (ingredientes hamburguesa))

--descuento: recibe un % de descuento, y devuelve la hamburguesa con ese descuento aplicado al valor inicial.

descuento :: Number -> Hamburguesa -> Hamburguesa
descuento porcentaje (UnaHamburguesa valorInicial ingredientes) = UnaHamburguesa (valorInicial - (porcentaje * valorInicial/100)) ingredientes

-- la pdepBurguer que es un cuarto de libra agrandado 2 veces con panceta, cheddar y 20% de descuento. 
--Su precio final deberia ser 110

pdepBurguer :: Hamburguesa

pdepBurguer =
  (descuento 20 . agrandar . agrandar . agregarIngrediente Cheddar .  agregarIngrediente Panceta) cuartoDeLibra

-- pdepBurguer =
--  descuento 20 . agrandar . agrandar . agregarIngrediente Cheddar .  agregarIngrediente Panceta $ cuartoDeLibra

-- pdepBurguer = 
--     descuento 20 (agrandar (agrandar (agregarIngrediente Cheddar (agregarIngrediente Panceta  cuartoDeLibra))))

-- pdepBurguer = 
--  foldr ($) cuartoDeLibra [descuento 20, agrandar, agrandar, agregarIngrediente Cheddar, agregarIngrediente Panceta]
