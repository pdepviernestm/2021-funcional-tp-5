module Spec where
import PdePreludat
import Library
import Test.Hspec
import Control.Exception (evaluate)

correrTests :: IO ()
correrTests = hspec $ do
  suiteDeTestsDePartes1y2
  suiteDeTestsDeParte3
  --suiteDeTestsDeParte4 -- descomenta esto solo si vas a hacer el punto bonus

suiteDeTestsDePartes1y2 = describe "Animales, alimentos y entrenamientos" $ do
  -- les dejamos estos valores definidos que probablemente les vengan bien
  let tigre = Animal 5 Terrestre 120
  let lechuza = Animal 40 Volador 10
  let tiburon = Animal 100 Acuatico 100
  let ningunAnimal :: [Animal]
      ningunAnimal = []
  describe "los de un tipo" $ do
    -- y este test :)
    it "dada una lista vacia retorna la misma lista vacia" $ do
      losDeTipo Volador [] `shouldBe` ningunAnimal
    it "retorna los animales de un mismo tipo" $ do
      losDeTipo Volador [tigre, lechuza, tiburon] `shouldBe` [lechuza]
   
  describe "animalesHambrientos" $ do
    it "" $ do
      escribime

  describe "alimentos" $ do
    it "" $ do
      escribime
   
  describe "alimentarATodos" $ do
    it "" $ do
      escribime

  describe "entrenar" $ do
    it "" $ do
      escribime

  describe "aplicar itinerario" $ do
    it "" $ do
      escribime

suiteDeTestsDeParte3 = describe "Orden Superior" $ do
  describe "mapTupla" $ do
    it "" $ do
      escribime

  describe "menorSegun" $ do
    -- Traten de probar que pasa si el primer elemento es mayor segun el criterio,
    -- si el segundo es mayor y si son iguales
    it "" $ do
      escribime
    
  describe "minimoSegun" $ do
    it "" $ do
      escribime

  describe "aplicarVeces" $ do
    it "" $ do
      escribime

  describe "replicar" $ do
    it "" $ do
      escribime

suiteDeTestsDeParte4 = describe "combinando funciones" $ do
  -- Los tests de acá se los dejamos servidos :)
  describe "|>" $ do
    it "dado un valor y una funcion, pasa el valor como parametro de la funcion" $ do
      "hola" |> length `shouldBe` 4
      3 |> (\n -> n + 2) `shouldBe` 5

  describe "esVocal" $ do
    it "dada una letra vocal da True" $ do
      esVocal 'a' `shouldBe` True
      esVocal 'E' `shouldBe` True
    it "dada una letra consontante da False" $ do
      esVocal 'c' `shouldBe` False
      esVocal 'B' `shouldBe` False
    it "dado un caracter que no es una letra da False" $ do
      esVocal ' ' `shouldBe` False
      esVocal '@' `shouldBe` False

  describe "primeraLinea" $ do
    it "dado un texto sin saltos de linea, devuelve el mismo texto" $ do
      primeraLinea "hola mundo!" `shouldBe` "hola mundo!"
    it "dado un texto con saltos de linea, devuelve el mismo hasta antes del primer salto de linea" $ do
      primeraLinea "hola\nmundo!" `shouldBe` "hola"

  describe "lasVocales" $ do
    it "dado un texto vacio, devuelve un string vacio" $ do
      lasVocales "" `shouldBe` ""
    it "dado un texto sin vocales, devuelve un string vacio" $ do
      lasVocales "why" `shouldBe` ""
    it "dado un texto con vocales, devuelve un string con solo las vocales" $ do
      lasVocales "chau" `shouldBe` "au"
      lasVocales "azarath metrion zinthos" `shouldBe` "aaaeioio"

  describe "contarVocalesDeLaPrimerLinea" $ do
    it "dado un texto vacio, da 0" $ do
      contarVocalesDeLaPrimeraLinea "" `shouldBe` 0
    it "dado un texto sin saltos de linea, da la cantidad de vocales en ese texto" $ do
      contarVocalesDeLaPrimeraLinea "hello world" `shouldBe` 3
    it "dado un texto sin saltos de linea, da la cantiad de vocales hasta el primer salto de linea" $ do
      contarVocalesDeLaPrimeraLinea "Aeea,\n yo soy sabalero" `shouldBe` 4

escribime :: Expectation
escribime = implementame

deberiaFallar :: a -> Expectation
deberiaFallar expresion = evaluate expresion `shouldThrow` anyException
