module Child exposing (..)

import Html
import Element exposing (..)
import Element.Events exposing (..)
import Element.Attributes exposing (..)
import Style exposing (..)
import Style.Color as SColor
import Navigation exposing (..)
-- Model

type alias Model =
        Int
-- Msg
type Msg = ChildMessage

-- View
type MyStyles
    = Box
    | Content
    | None


stylesheet : StyleSheet MyStyles variation
stylesheet =
    Style.styleSheet
        [ Style.style None []
        ]

view : Model -> Html.Html Msg
view model =
    viewport stylesheet <|
        el None [ onClick ChildMessage ] (text "child")


-- Update

update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        ChildMessage ->
            Debug.log "Child Update"
            (model, Navigation.newUrl "#example")

-- Program
initModel = (0, Cmd.none)



subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program Never Model Msg
main =
    Html.program
        { init = initModel
        , view = view
        , update = update
        , subscriptions = subscriptions
        }