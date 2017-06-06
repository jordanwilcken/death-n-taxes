import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (..)
import List exposing(..)

main =
  beginnerProgram { model = model, view = view, update = update }

type alias Model = { years: (List Int) }

model =
  Model [2007]

view model =
  div []
    [ table [] (makeTableRows makeHeader makeRows model.years)
    , button [] [ text "+" ]
    , p [] [ text "these are the stats: 21%" ]
    ]

row : Int -> Html msg
row year =
  tr [] [ td[] [ input [value (toString year)] [] ], td [] [ input [] [ ] ] ]

makeTableRows : Html msg -> ((List Int) -> (List (Html msg))) -> List Int -> (List (Html msg))
makeTableRows makeHeaderFun makeRowsFun years=
  makeHeaderFun :: makeRowsFun years
  
makeHeader : Html msg
makeHeader =
  tr [] [ th [] [ text "year"], th [] [text "federal income tax paid" ] ]
   
makeRows : (List Int) -> List (Html msg)
makeRows years =
  List.map (\year -> makeOneRow year) years

makeOneRow : Int -> Html msg
makeOneRow year =
  tr [] [ td [] [ input [] [] ], td [] [ input [] [] ] ]

type Msg = Increment | Decrement

update msg model =
  case msg of
    Increment ->
      { model | years = 1 :: model.years }

    Decrement ->
      { model | years = 1 :: model.years }
