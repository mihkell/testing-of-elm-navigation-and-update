module Main exposing (..)

import Html exposing (..)
import Element exposing (..)
import Element.Attributes exposing (..)
import Style exposing (..)
import Style.Color as SColor
import Child exposing (..)


-- Model


type alias Model =
    Int



-- Msg


type Msg
    = ParentMessage Child.Msg



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
        el None [] (Element.map (\childMsg -> ParentMessage childMsg) (html (Child.view (Tuple.first Child.initModel))))



-- Update


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        ParentMessage childMsg ->
            let
                childUpdate =
                    Child.update childMsg 0
            in
                ( model, Tuple.second childUpdate )



-- Program


initModel =
    ( 0, Cmd.none )


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
