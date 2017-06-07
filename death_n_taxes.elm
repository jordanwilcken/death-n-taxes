import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (..)
import List exposing(..)

main =
  beginnerProgram { model = model, view = view, update = update }

type alias Model =
  { dataPoints : DataPoints
  , statistics : String
  }

type alias DataPoints = List TaxDataPoint

type alias TaxDataPoint = { year : Int, taxPaid : Float }

model =
  Model [] ""

view model =
  div []
    [ table [] makeRows
    , button [] [ text "+" ]
    , p [] [ text "these are the stats: 21%" ]
    ]

makeRows : List (Html msg)
makeRows =
  makeTableRows makeHeaderRow makeTaxRows model.dataPoints makeBlankRow

makeTableRows : Html msg -> (DataPoints -> (List (Html msg))) -> DataPoints -> Html msg -> List (Html msg)
makeTableRows makeHeaderFun makeTaxRowsFun dataPoints makeBlankRow =
  List.append (makeHeaderFun :: makeTaxRowsFun dataPoints) (List.singleton makeBlankRow)
  
makeHeaderRow : Html msg
makeHeaderRow =
  tr [] [ th [] [ text "year"], th [] [text "federal income tax paid" ] ]
   
makeTaxRows : DataPoints -> List (Html msg)
makeTaxRows dataPoints =
  List.map (\dataPoint -> makeOneRow (Just dataPoint)) dataPoints

makeBlankRow : Html msg
makeBlankRow = makeOneRow Nothing

makeOneRow : (Maybe TaxDataPoint) -> Html msg
makeOneRow maybeData =
  case maybeData of
    Just dataPoint ->
      tr [] [ td [] [ input [value (toString dataPoint.year)] [] ], td [] [ input [] [] ] ]
    Nothing ->
      tr [] [ td [] [ input [] [] ] , td [] [ input [] [] ] ]

type Msg = Increment | Decrement

update msg model =
  case msg of
    Increment ->
      model

    Decrement ->
      model
