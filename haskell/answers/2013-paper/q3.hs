--Part B
data Expr = K Int
            | V String
            | Add Expr Expr
            | Dvd Expr Expr
            | Let String Expr Expr

type Dict = [(String, Int)]
ins :: String -> Int -> Dict -> Dict
ins s i d = ((s, i):d)
lkp :: String -> Dict -> Maybe Int
lkp _ [] = Nothing
lkp key ((tkey,tval):rest) =
    if key == tkey
        then Just tval
        else lkp key rest
divBy :: Int -> Int -> Maybe Int
divBy a b 
    | b == 0 = Nothing
    | otherwise = Just (a `div` b)

eval :: Dict -> Expr -> Maybe Int
eval _ (K i) = Just i
eval d (V s) = lkp s d
eval d (Add e1 e2) = do
    a <- eval d e1
    b <- eval d e2
    return (a + b)
eval d (Dvd e1 e2) = do
    a <- eval d e1
    b <- eval d e2
    c <- divBy a b
    return c
eval d (Let v e1 e2) = case i of 
       (Just a) -> eval (ins v a d) e2
       Nothing -> Nothing
    where i = eval d e1