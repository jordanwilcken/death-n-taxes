import Html exposing (beginnerProgram, div, button, text)
import Html.Events exposing (onClick)
import Html.Attributes exposing (..)

main =
  beginnerProgram { model = 0, view = view, update = update }


view model =
  div [ class "navbar navbar-inverse"]
    [ div [ class "container-fluid" ]
      [ div [ class "navbar-header" ]
          [ button [ class "collapsed navbar-toggle", attribute "type" "button", attribute "data-toggle" "collapse", attribute "data-target" ".bs-example-js-navbar-collapse" ]
              [
              ]
          ]
      ]
    ]


type Msg = Increment | Decrement


update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1
