module Header exposing (Model, getNavbarClass, init, update, view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Msg exposing (..)


type alias Model =
    { navbarOpened : Bool
    }


init : Model
init =
    { navbarOpened = False
    }


update : HeaderMsg -> Model -> Model
update msg model =
    case msg of
        ToggleNavbar ->
            { model | navbarOpened = not model.navbarOpened }


view : Model -> Html Msg
view model =
    header []
        [ div [ class <| getNavbarClass model.navbarOpened, id "navbarHeader" ]
            [ div [ class "container" ]
                [ div [ class "row" ]
                    [ div [ class "col-sm-8 col-md-7 py-4" ]
                        [ h4 [ class "text-white" ]
                            [ text "About" ]
                        , p [ class "text-muted" ]
                            [ text "Add some information about the album below, the author, or any other background context. Make it a few sentences long so folks can pick up some informative tidbits. Then, link them off to some social networking sites or contact information."
                            ]
                        ]
                    , div [ class "col-sm-4 offset-md-1 py-4" ]
                        [ h4 [ class "text-white" ]
                            [ text "Contact" ]
                        , ul [ class "list-unstyled" ]
                            [ li []
                                [ a [ href "#", class "text-white" ]
                                    [ text "Follow on Twitter" ]
                                ]
                            , li []
                                [ a [ href "#", class "text-white" ]
                                    [ text "Like on Facebook" ]
                                ]
                            , li []
                                [ a [ href "#", class "text-white" ]
                                    [ text "Email me" ]
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        , div [ class "navbar navbar-dark bg-dark shadow-sm" ]
            [ div [ class "container d-flex justify-content-between" ]
                [ a [ href "#", class "navbar-brand d-flex align-items-center" ]
                    [ strong []
                        [ text "Portal dos Classificados" ]
                    ]
                , button
                    [ class "btn btn-success"
                    , type_ "button"
                    , onClick (HeaderMsg ToggleNavbar)
                    ]
                    -- [ span [ class "navbar-toggler-icon" ] []
                    [ span [] [ text "Anuncie" ]
                    ]
                ]
            ]
        ]


getNavbarClass : Bool -> String
getNavbarClass navbarOpened =
    if navbarOpened then
        "bg-dark"

    else
        "collapse bg-dark"
