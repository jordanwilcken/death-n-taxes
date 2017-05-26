import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (..)

main =
  beginnerProgram { model = 0, view = view, update = update }


view model =
  table []
    [ tr [] [ th [] [ text "year"], th [] [text "federal income tax paid" ] ]
    , tr [] [ td [] [ input [] [] ], td [] [ input [] [] ] ]
    ]
  button [] [ text "+" ]
  p [] [ text "these are the stats: 21%" ]

type Msg = Increment | Decrement


update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1
