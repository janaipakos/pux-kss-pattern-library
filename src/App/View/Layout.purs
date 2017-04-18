module App.View.Layout where

import App.View.Homepage as Homepage
import App.View.NotFound as NotFound
import App.View.Button as Button
import App.Routes (Route(NotFound, Home, Button))
import App.State (State(..))
import App.Events (Event)
import CSS ((?))
import CSS.Background (backgroundColor, backgroundRepeat, backgroundSize, by, noRepeat)
import CSS.Box (boxSizing, borderBox, boxShadow)
import CSS.Display (fixed, position)
import CSS.Font (color, fontFamily, sansSerif)
import CSS.Overflow (hidden, overflow)
import CSS.String (fromString)
import CSS.Text (noneTextDecoration, textDecoration, underline)
import CSS.TextAlign (center, textAlign)
import CSS.Border (borderColor)
import CSS.Geometry (paddingTop, paddingBottom, paddingLeft, paddingRight, width, height, marginLeft)
import CSS.Size (em, pct, px)
import Color (rgb)
import Control.Bind (bind)
import Data.Function (($), (#))
import Data.NonEmpty (singleton)
import Pux.DOM.HTML (HTML, style)
import Text.Smolder.HTML (div)
import Text.Smolder.HTML.Attributes (className)
import Text.Smolder.Markup ((!))

view :: State -> HTML Event
view (State st) =
  div ! className "app" $ do
    style do
      fromString "body" ? do
        fontFamily ["Source Sans Pro", "Open Sans Pro"] (singleton sansSerif)

      fromString "a" ? do
        color (rgb 134 133 220)
        textDecoration noneTextDecoration

      fromString "a:hover" ? do
        textDecoration underline

      fromString "h1" ? do
        backgroundSize (by (100.0 #px) (100.0 #px))
        backgroundRepeat noRepeat
        overflow hidden
        paddingTop (0.5 #em)
        paddingLeft (0.5 #em)

      fromString ".button" ? do
        backgroundColor (rgb 134 134 134)
        paddingTop (1.0 #em)
        paddingRight (1.25 #em)
        paddingBottom (1.0 #em)
        paddingLeft (1.25 #em)

      fromString ".button--success" ? do
        backgroundColor (rgb 47 89 38)
        borderColor (rgb 207 232 201)

      fromString ".button--error" ? do
        backgroundColor (rgb 169 35 35)
        borderColor (rgb 232 201 201)

      fromString ".kss-sidebar" ? do
        boxSizing (borderBox)
        position (fixed)
        width (20.0 #pct)
        height (100.0 #pct)
        backgroundColor (rgb 238 238 238)
        boxShadow (5.0 #px) (5.0 #px) (5.0 #px) (rgb 0 0 0)

      fromString ".kss-main" ? do
        width (80.0 #pct)
        height (100.0 #pct)
        marginLeft (20.0 #pct)
        paddingTop (1.25 #em)
        paddingLeft (1.25 #em)

    case st.route of
      (Home) -> Homepage.view (State st)
      (Button string) -> Button.view (State st)
      (NotFound url) -> NotFound.view (State st)
