#!/usr/bin/env stack
{- stack script
    --resolver lts-17.10
    --package raw-strings-qq
    --package optional-args
    --package split
    --package foldl
    --package mtl
    --package text
    --package pretty-show
    --package lens
    --package lens-regex-pcre
    --package turtle
-}

{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE BlockArguments #-}
{-# LANGUAGE LambdaCase #-}

import Prelude hiding (tail, head)
import qualified Data.List as L
import qualified Data.List.Split as L
import Data.Functor
import Data.Optional
import Control.Arrow
import Control.Monad.State.Lazy
import Control.Lens
import Control.Lens.Regex.Text
import Control.Foldl (fold)
import qualified Control.Foldl as Fl
import qualified Data.Text as T
import qualified Data.Text.IO as T
import Debug.Trace
import Turtle hiding (fold)

skHistFile = fromText "/home/dincio/code/streamkey/assets/history"

argP = argPath "HIST_N" Default

main = sh $ do
    histNum <- options "Get history at given hist. num." argP

    oneline <- input skHistFile 
                   & reduce Fl.list
                   & fmap (L.intersperse ":" >>> fold Fl.mconcat >>> lineToText)
    
    liftIO $ T.putStrLn $ 
        fromMaybe "NONUM" $
            oneline ^? [regex|:---- $histNum:(.*?):---- ${histNum + 1}:|] . index 0 . group 0
