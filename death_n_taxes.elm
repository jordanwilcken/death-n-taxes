import Html exposing (..)
import Html.Events
import Html.Attributes exposing (..)
import List exposing(..)

main =
  beginnerProgram { model = model, view = view, update = update }

type alias Model =
  { dataPoints : DataPoints
  , entries : List Entry
  , stats : String
  }

type alias DataPoints = List TaxDataPoint

type alias TaxDataPoint = { year : Int, taxPaid : Float }

type alias Entry = { year : String, taxPaid : String }

model =
  Model [] [] "we don't have no stats yet"

view model =
  div []
    [ table [] (makeRows model.dataPoints)
    --, button [] [ text "+" ]
    , p [] [ text model.stats ]
    ]

makeRows : DataPoints -> List (Html Msg)
makeRows dataPoints =
  makeTableRows makeHeaderRow makeBlankRow (makeTaxRows dataPoints)

makeTableRows : Html msg -> Html msg -> List (Html msg) ->  List (Html msg)
makeTableRows headerRow blankRow taxRows =
  List.append (headerRow :: taxRows) (List.singleton blankRow)
  
makeTaxRows : DataPoints -> List (Html Msg)
makeTaxRows dataPoints =
  List.map (\dataPoint -> makeOneRow (Just dataPoint)) dataPoints

makeHeaderRow : Html msg
makeHeaderRow =
  tr [] [ th [] [ text "year"], th [] [text "federal income tax paid" ] ]
   
makeBlankRow : Html Msg
makeBlankRow = makeOneRow Nothing

makeOneRow : (Maybe TaxDataPoint) -> Html Msg
makeOneRow maybeData =
  case maybeData of
    Just dataPoint ->
      tr []
        [ td [] [ input [value (toString dataPoint.year)] [] ]
        , td []
            [ input
                [ type_ "number"
                , value (toString dataPoint.taxPaid)
                , Html.Events.onInput AmountChanged
                ] []
            ]
        ]
    Nothing ->
      tr []
        [ td [] [ input [ Html.Events.onInput YearEntered] [] ]
        , td [] [ input [ Html.Events.onInput TaxesEntered] [] ]
        ]

type Msg =
  AmountChanged String
  | YearEntered String
  | TaxesEntered String

update msg model =
  case msg of
    AmountChanged newAmount ->
       { model | stats = "boring stats" }
    YearEntered year ->
      model
    TaxesEntered amount ->
      model
