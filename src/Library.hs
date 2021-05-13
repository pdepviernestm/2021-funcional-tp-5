module Library where
import PdePreludat

data Animal = Animal {
    energia :: Number,
    tipo :: Tipo,
    peso :: Number
} deriving(Show, Eq)

data Tipo = Volador | Terrestre | Acuatico deriving(Show, Eq)

-- Parte 1: Animales

losDeTipo = implementame

animalesHambrientos = implementame

-- Parte 2: Alimentos y entrenamientos

-- implementar estos alimentos:
-- bayas aumenta la energia en 5 y el peso en 0.1
-- carne aumenta la energia en 20 y el peso en 2

entrenar = implementame

alimentarATodos = implementame

aplicarItinerario = implementame

-- Parte 3: Nuestras propias funciones de orden superior

mapTupla = implementame

menorSegun = implementame

minimoSegun = implementame

aplicarVeces = implementame

replicar = implementame

-- Parte 4. Bonus: combinando funciones

valor |> funcion = implementame

esVocal = implementame

saltoDeLinea :: Char
saltoDeLinea = '\n'

primeraLinea = implementame

lasVocales = implementame

-- definir usando |> para combinar las funciones
contarVocalesDeLaPrimeraLinea = implementame