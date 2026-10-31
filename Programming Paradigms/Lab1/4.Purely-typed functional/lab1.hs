import Control.Monad (forM)
import Data.Char (toUpper)
import System.IO (hFlush, stdout)

-- The 10 questions
questions :: [String]
questions =
    [ "I enjoy going to parties with lots of people."
    , "I find it easy to start conversations with strangers."
    , "I feel comfortable being the center of attention."
    , "I prefer working in a group rather than alone."
    , "I feel more energized after spending time with other people."
    , "I feel more energized after spending time alone."
    , "I prefer listening over talking in group discussions."
    , "I need quiet time to recharge after socializing."
    , "I prefer a quiet night in over a big social event."
    , "I think carefully before speaking in a group."
    ]


-- ============================================================
-- PURE PART
-- ============================================================

countTrue :: [Bool] -> Int
countTrue answers =
    length (filter id answers)


extrovertScore :: [Bool] -> Int
extrovertScore answers =
    countTrue (take 5 answers)


introvertScore :: [Bool] -> Int
introvertScore answers =
    countTrue (drop 5 answers)


decideResult :: [Bool] -> String
decideResult answers
    | extrovert > introvert = "Extrovert"
    | introvert > extrovert = "Introvert"
    | otherwise              = "Balanced (Ambivert)"
    where
        extrovert = extrovertScore answers
        introvert = introvertScore answers


-- ============================================================
-- IO PART
-- ============================================================

readAnswer :: Int -> String -> IO Bool
readAnswer number question = do
    putStr (show number ++ ". " ++ question ++ " (T/F): ")
    hFlush stdout

    input <- getLine

    return (map toUpper input == "T")


askQuestions :: IO [Bool]
askQuestions =
    forM (zip [1..] questions) $ \(number, question) ->
        readAnswer number question


-- ============================================================
-- MAIN
-- ============================================================

main :: IO ()
main = do
    putStrLn "=== Extrovert / Introvert Quiz ==="
    putStrLn ""

    answers <- askQuestions

    let extrovert = extrovertScore answers
        introvert = introvertScore answers
        result = decideResult answers

    putStrLn ""
    putStrLn ("Extrovert score: " ++ show extrovert)
    putStrLn ("Introvert score: " ++ show introvert)
    putStrLn ("Result: " ++ result)
