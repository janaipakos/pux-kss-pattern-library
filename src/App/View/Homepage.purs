module App.View.Homepage where

import App.View.Sidebar as Sidebar
import Prelude
import App.Events (Event)
import App.State (State(..))
import Data.Function (($), (#))
import Pux.DOM.HTML (HTML, style)
import Pux.DOM.Events (DOMEvent, onClick)
import Text.Smolder.HTML (a, div, h1, h2, button, article, header, nav, ul, li, span)
import Text.Smolder.HTML.Attributes (href, className)
import Text.Smolder.Markup ((!), (#!), text)

view :: State -> HTML Event
view (State st) =
  div do
    Sidebar.view (State st)
    article ! className "kss-main" $ do
      div do
        h1 $ a ! href "https://www.purescript-pux.org" $ text "purescript-pux.org"