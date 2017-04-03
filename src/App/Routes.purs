module App.Routes where

import Control.Alt ((<|>))
import Control.Apply ((<*))
import Data.Function (($))
import Data.Functor ((<$), (<$>))
import Data.Generic (class Generic, gShow)
import Data.Maybe (fromMaybe)
import Data.Show (class Show)
import Pux.Router (end, router, lit)

data Route = Home | Button String | NotFound String

derive instance genericRoute :: Generic Route

instance showRoute :: Show Route where
  show = gShow

match :: String -> Route
match url = fromMaybe (NotFound url) $ router url $
  Home <$ end
  <|>
  Button "name" <$ (lit "button") <* end

toURL :: Route -> String
toURL (NotFound url) = url
toURL (Home) = "/"
toURL (Button string) = "button"
