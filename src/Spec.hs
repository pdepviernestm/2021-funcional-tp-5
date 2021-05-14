module Spec where
import PdePreludat
import Library
import Test.Hspec
import Control.Exception (evaluate)

correrTests :: IO ()
correrTests = hspec $ do
   describe "xxx" $ do
     it "xxxx" $ do
       1 `shouldBe` 2

escribime :: Expectation
escribime = implementame

