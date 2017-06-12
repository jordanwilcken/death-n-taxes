import Html exposing (..)
import Html.Events
import Html.Attributes exposing (..)
import List exposing(..)

main =
  beginnerProgram { model = model, view = view, update = update }

type alias Model =
  { entries : List Entry
  , stats : String
  }

type alias DataPoints = List TaxDataPoint

type alias TaxDataPoint = { year : Int, taxPaid : Float }

type alias Entry = { year : String, taxPaid : String }

model =
  Model
    [ Entry "" ""
    , Entry "" ""
    , Entry "" ""
    , Entry "" ""
    , Entry "" ""
    ]
    "we don't have no stats yet"

view model =
  div []
    [ table [] (makeRows model.entries)
    , p [] [ text model.stats ]
    ]

makeRows : List Entry -> List (Html Msg)
makeRows entries =
  makeTableRows makeHeaderRow (makeTaxRows entries)

makeTableRows : Html msg -> List (Html msg) -> List (Html msg)
makeTableRows headerRow taxRows =
  headerRow :: taxRows
  
makeTaxRows : List Entry -> List (Html Msg)
makeTaxRows entries =
  List.map makeOneRow entries

makeHeaderRow : Html msg
makeHeaderRow =
  tr [] [ th [] [ text "year"], th [] [text "federal income tax paid" ] ]
   
makeOneRow : Entry -> Html Msg
makeOneRow entry =
  tr []
    [ td []
        [ input
            [ type_ "number"
            , value entry.year
            , Html.Events.onInput YearChanged
            ] [] ]
    , td []
        [ input
            [ type_ "number"
            , value entry.taxPaid
            , Html.Events.onInput AmountChanged
            ] []
        ]
    ]

type Msg =
  YearChanged String
  | AmountChanged String

update msg model =
  case msg of
    YearChanged inputValue ->
      model
    AmountChanged inputValue ->
      model
