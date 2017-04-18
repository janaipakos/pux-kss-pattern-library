module App.View.Sidebar where

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
  div ! className "kss-sidebar kss-style" $ do
    header ! className "kss-header" $ do
      h1 ! className "kss-doc-title" $ text "My pattern library"
    nav ! className "kss-nav" $ do
      ul ! className "kss-nav__menu" $ do
        li ! className "kss-nav__menu-item" $ do
          a ! className "kss-nav__menu-link" ! href "./" $ do
            span ! className "kss-nav__name" $ text "Home"
        li ! className "kss-nav__menu-item" $ do
          a ! className "kss-nav__menu-link" ! href "./button" $ do
            span ! className "kss-nav__name" $ text "Buttons"
        li ! className "kss-nav__menu-item" $ do
          a ! className "kss-nav__menu-link" ! href "./navigation" $ do
            span ! className "kss-nav__name" $ text "Navigation"
        li ! className "kss-nav__menu-item" $ do
          a ! className "kss-nav__menu-link" ! href "./footer" $ do
            span ! className "kss-nav__name" $ text "Footer"
