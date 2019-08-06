module Home exposing (Model, init, update, view)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Msg exposing (..)


type alias Model =
    { filtro : String }


init : Model
init =
    { filtro = "" }


update : HomeMsg -> Model -> Model
update msg model =
    case msg of
        ChangeFiltro filtro ->
            { model | filtro = filtro }

        _ ->
            model


view : Model -> Html Msg
view model =
    section [ class "jumbotron text-center" ]
        [ div [ class "container" ]
            [ h1 [ class "jumbotron-heading" ]
                [ text "Procure pelo que deseja ou selecione uma categoria" ]
            , Html.form [ class "form-inline" ]
                [ div [ class "form-group" ]
                    [ input
                        [ class "form-control"
                        , placeholder "Digite o que deseja procurar"
                        , type_ "text"
                        , value model.filtro
                        , onInput (\input -> HomeMsg <| ChangeFiltro input)
                        ]
                        []
                    ]
                , button [ class "btn btn-success" ] [ text "Pesquisar" ]
                ]

            -- , p [ class "lead text-muted" ]
            --     [ text "Something short and leading about the collection below—its contents, the creator, etc. Make it short and sweet, but not too short so folks don't simply skip over it entirely." ]
            , p []
                [ button [ class "btn btn-primary my-2", onClick (HomeMsg <| SelectCategory Beleza) ]
                    [ text "Beleza" ]
                , button [ class "btn btn-primary my-2", onClick (HomeMsg <| SelectCategory Comida) ]
                    [ text "Comida" ]
                , button [ class "btn btn-primary my-2", onClick (HomeMsg <| SelectCategory Doces) ]
                    [ text "Doces" ]
                , button [ class "btn btn-primary my-2", onClick (HomeMsg <| SelectCategory Marcenaria) ]
                    [ text "Marcenaria" ]

                -- , a [ class "btn btn-secondary my-2", href "#" ]
                --     [ text "Secondary action" ]
                ]
            ]
        ]
