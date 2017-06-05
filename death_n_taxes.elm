import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (..)
import List

main =
  beginnerProgram { model = model, view = view, update = update }

type alias Model = { years: (List Int) }

model =
  Model [2007]

view model =
  div []
    [ table []
      [ tr [] [ th [] [ text "year"], th [] [text "federal income tax paid" ] ]
      , tr [] [ td [] [ input [] [] ], td [] [ input [] [] ] ]
      ]
    , button [] [ text "+" ]
    , p [] [ text "these are the stats: 21%" ]
    ]

row : Int -> Html msg
row year =
  tr [] [ td[] [ input [value (toString year)] [] ], td [] [ input [] [ ] ] ]

type Msg = Increment | Decrement

update msg model =
  case msg of
    Increment ->
      { model | years = 1 :: model.years }

    Decrement ->
      { model | years = 1 :: model.years }
