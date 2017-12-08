# Haskell-Bitcoin-Price-Guesser
A Haskell-written guesser of the price of the bitcoin, based on Lagrange Polynomial. 
The results that it gives are a little crazy.
I'm not responsible of any decision you make based on it. 

## Usage

0. Install all libraries required to make the program work. Cabal is an easy way to install them.

1. Choose inside the API URL in the code the starting and finishing dates of the period you want to get data from.
2. Run!
3. Get the parsed data, and in the ghci console, write:
  - ``` let values = {all the data parsed and put on an array, shown on (2)} ```
  - ``` evalPoly (iterativePolyFit values) N ``` where ``` N ``` is the day (1, 2,..., 453, 454, ...) you want to get the price guess.

## Support

You can write me at adriamunuera@me.com if you want to share some thoughts about this program or you have any kind of question :smile:

## License

Do whatever you want with this. I don't really care. Just, if you use it, leave me a star on the project.
