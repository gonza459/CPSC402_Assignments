{-
    BNF Converter: OCaml Abstract Syntax Generator
    Copyright (C) 2005  Author:  Kristofer Johannisson

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, 51 Franklin Street, Fifth Floor, Boston, MA 02110-1335, USA
-}

-- based on BNFC Haskell backend

module BNFC.Backend.OCaml.CFtoOCamlAbs (cf2Abstract) where

import Text.PrettyPrint

import BNFC.CF
import BNFC.Utils((+++))
import Data.List(intersperse)
import BNFC.Backend.OCaml.OCamlUtil

-- to produce an OCaml module
cf2Abstract :: String -> CF -> String
cf2Abstract _ cf = unlines $
  "(* OCaml module generated by the BNF converter *)\n\n" :
  mutualRecDefs (map (prSpecialData cf) (specialCats cf) ++ map prData (cf2data cf))

-- allow mutual recursion so that we do not have to sort the type definitions in
-- dependency order
mutualRecDefs :: [String] -> [String]
mutualRecDefs ss = case ss of
    [] -> []
    [x] -> ["type" +++ x]
    x:xs -> ("type" +++ x)  :  map ("and" +++) xs



prData :: Data -> String
prData (cat,rules) =
  fixType cat +++ "=\n   " ++
  concat (intersperse "\n | " (map prRule rules)) ++
  "\n"

prRule (fun,[])   = fun
prRule (fun,cats) = fun +++ "of" +++ render (mkTupleType cats)

-- | Creates an OCaml type tuple by intercalating * between type names
-- >>> mkTupleType [Cat "A"]
-- a
--
-- >>> mkTupleType [Cat "A", Cat "Abc", Cat "S"]
-- a * abc * s
mkTupleType :: [Cat] -> Doc
mkTupleType = hsep . intersperse (char '*') . map (text . fixType)

prSpecialData :: CF -> Cat -> String
prSpecialData cf cat = fixType cat +++ "=" +++ show cat +++ "of" +++ contentSpec cf cat

--  unwords ["newtype",cat,"=",cat,contentSpec cf cat,"deriving (Eq,Ord,Show)"]

contentSpec :: CF -> Cat -> String
contentSpec cf cat = -- if isPositionCat cf cat then "((Int,Int),String)" else "String"
    if isPositionCat cf cat then "((int * int) * string)" else "string"
