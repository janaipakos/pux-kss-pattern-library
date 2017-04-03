module App.View.Button where

import App.View.Homepage as Homepage
import App.View.Sidebar as Sidebar
import Prelude
import App.Events (Event)
import App.State (State(..))
import Data.Function (($), (#))
import Pux.DOM.HTML (HTML)
import Text.Smolder.HTML (article, button, div, h1, h2, h3, h4, p, pre, ul, li, code)
import Text.Smolder.HTML.Attributes (className)
import Text.Smolder.Markup ((!), text)

view :: State -> HTML Event
view (State st) =
  div do
    Sidebar.view (State st)
    article ! className "kss-main" $ do
      h3 $ text "Section 1"
      h2 $ text "Buttons"
      div do
        div do
          p $ text "Default Styling"
          button ! className "button" $ text "click here"
        div do
          p $ text "button--success - A green success button"
          button ! className "button button--success" $ text "success button" 
        div do
          p $ text "button--error - A red error button"
          button ! className "button button--error" $ text "error button"
      div do
        div do
          h2 $ text "Markup"
          pre do
            ul do
              li do
                code $ text "button ! className 'button' {{modifier}} $ text 'click here'"