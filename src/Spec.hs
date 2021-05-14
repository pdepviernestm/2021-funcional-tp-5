module Spec where
import PdePreludat
import Library
import Test.Hspec
import Control.Exception (evaluate)

correrTests :: IO ()
correrTests = hspec $ do
   describe "hamburguesas" $ do
     it "el precio del cuarto de libra es 54" $ do
       precioHamburguesa cuartoDeLibra  `shouldBe` 54
     it "al agregar un ingrediente nuevo a una hamburguesa con algunos ingredientes el resulto es una nueva hamburguesa con ese ingrediente agregado" $ do
       agregarIngrediente Panceta  cuartoDeLibra    `shouldBe` UnaHamburguesa 20 [Panceta ,Pan,Carne,Cheddar,Pan]
     it "al agregar un ingrediente que ya esta en  una hamburguesa con algunos ingredientes el resulto es una nueva hamburguesa con ese ingrediente agregado otra vez " $ do
       agregarIngrediente Cheddar  cuartoDeLibra    `shouldBe` UnaHamburguesa 20 [Cheddar ,Pan,Carne,Cheddar,Pan]
     it "al agregar un ingrediente  una hamburguesa sin ingredientes el resulto es una nueva hamburguesa con ese ingrediente unicamente " $ do
       agregarIngrediente Cheddar  (UnaHamburguesa 20 [])   `shouldBe` UnaHamburguesa 20 [Cheddar]
     it "al agrandar una hamburguesa cuyo ingrediente base es Carne va a agregarle otra Carne   " $ do
       agrandar (UnaHamburguesa 20 [Pan,Carne])   `shouldBe` UnaHamburguesa 20 [Carne,Pan,Carne]
     it "al agrandar una hamburguesa cuyo ingrediente base es Pollo va a agregarle otro Pollo   " $ do
       agrandar (UnaHamburguesa 20 [Pan,Pollo])   `shouldBe` UnaHamburguesa 20 [Pollo,Pan,Pollo]
     it "al aplicar un porcentaje de descuento a una hamburguesa se devuelve esa hamburguesa con su valorInicial reducido en el % de decuento" $ do
       descuento 10 (UnaHamburguesa 20 [Pan,Pollo])   `shouldBe` UnaHamburguesa 18 [Pan,Pollo]
     it "la pdep burguer vale 110" $ do
       precioHamburguesa  pdepBurguer   `shouldBe` 110

escribime :: Expectation
escribime = implementame

