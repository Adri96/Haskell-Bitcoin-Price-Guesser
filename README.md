# Haskell-Bitcoin-Price-Guesser
A Haskell-written guesser of the price of the bitcoin, based on Lagrange Polynomial. 
The results that it gives are a little crazy.
I'm not responsible of any decision you make based on 

# USAGE

0- Install all libraries required to make the program work. Cabal is an easy way to install them.

1- Choose inside the API URL in the code the starting and finishing dates of the period you want to get data from.
2- Run!
3- Get the parsed data, and in the ghci console, write:
  let values = {all the data parsed and put on an array, shown on (2)}
  evalPoly (iterativePolyFit values) N //where N is the day (1,2, .. 453, ...) you want to get the price guess
