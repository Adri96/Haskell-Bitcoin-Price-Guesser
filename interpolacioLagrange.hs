import Math.Polynomial
import Math.Polynomial.Interpolation
import Network.HTTP.Types.Status (Status(..))
import Network.HTTP.Client (responseStatus)
import Network.Curl.Download
import Data.Aeson
import Data.List.Split
import Data.List
import Data.Either

--https://hackage.haskell.org/package/bitx-bitcoin
--https://hackage.haskell.org/package/polynomial-0.7.3/docs/Math-Polynomial-Interpolation.html
--lagrangePolyFit [(Num, Num)]
--iterativePolyFit [(Num, Num)] aquest va millor que el lagrangePolyFit
--https://www.coindesk.com/api/

--let t = [(0,1),(1,2),(2,3),(3,4),(4,5),(5,6)] --f(x) = x + 1
--let x = [(0,1),(1,3),(2,5),(3,7),(4,9)] --f(x) = 2x + 1
--let y = [(0,0),(1,1),(2,4),(3,9),(4,16)] --f(x) = x*x
--let z = [(0,1),(1,4),(2,11),(3,22),(4,37)] --f(x) =2x*x + x + 1

main :: IO ()
main = do
  doc  <- openURI "https://api.coindesk.com/v1/bpi/historical/close.json?start=2017-11-15&end=2017-12-06"
  let string = show $ rights [doc]
  let s2 = splitOn "," $ getNth 2 $ splitOn "{" string
  let s3 = map (splitOn ":") s2
  let s4 = take ((length s3) - 2) s3
  let s5 = map (last) s4
  let s6 = take ((length s5) - 1) s5
  let s7 = map (\x -> (read x)::Float) s6
  let s8 = zipWith (\x -> \y -> (x, y)) (makeListOfDoubles (length s7) 0.0) s7
  print s8

  -- let values = {put here what s8 has shown}
  -- evalPoly (iterativePolyFit values) N
  -- next day: evalPoly (iterativePolyFit values) (flength values)


  --this next block code automatizes everything, but strangely enough it is way less precise
  --let polinomi = iterativePolyFit s8
  --print polinomi
  --let guess = evalPoly polinomi $ flength s8
  --print $ flength s8
  --print guess
  --print "input a float as a string to eval the function at that point"
  --x <- readLn
  --let guess2 = evalPoly (iterativePolyFit s8) (read x :: Float)
  --print guess2


getNth :: Int -> [a]  -> a

getNth 0 (cap:cua) = cap
getNth n (cap:cua) = getNth (n-1) cua


makeListOfDoubles :: Int -> Float -> [Float]

makeListOfDoubles 0 _ = []
makeListOfDoubles n m = [m] ++ (makeListOfDoubles (n-1) (m+1))


flength :: [a] -> Float

flength [] = 0.0
flength (cap:cua) = 1.0 + (flength cua)

