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

type alias Entry = { id: Int, year : String, taxPaid : String }

model =
  Model
    [ Entry 1 "" ""
    , Entry 2 "" ""
    , Entry 3 "" ""
    , Entry 4 "" ""
    , Entry 5 "" ""
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
            , step "any"
            , Html.Events.onInput (YearChanged entry.id)
            ] [] ]
    , td []
        [ input
            [ type_ "number"
            , value entry.taxPaid
            , step "any"
            , Html.Events.onInput (AmountChanged entry.id)
            ] []
        ]
    ]

type Msg =
  YearChanged Int String
  | AmountChanged Int String

update msg model =
  case msg of
    YearChanged id inputValue ->
      let
        updatedEntries = changeYear id inputValue model.entries
        newStats = makeStats updatedEntries

      in
        { model | entries = updatedEntries, stats = newStats }

    AmountChanged id inputValue ->
      let
        updatedEntries = changeAmount id inputValue model.entries
        newStats = makeStats updatedEntries

      in
        { model | entries = updatedEntries, stats = newStats }

changeYear : Int -> String -> List Entry -> List Entry
changeYear id newYear entries =
  List.map (\entry -> if entry.id == id then { entry | year = newYear } else entry) entries

changeAmount : Int -> String -> List Entry -> List Entry
changeAmount id newAmount entries =
  List.map (\entry -> if entry.id == id then { entry | taxPaid = newAmount } else entry) entries

makeStats : List Entry -> String
makeStats entries =
  "cool stats, bro"  
