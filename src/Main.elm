module Main exposing (Model, Pagina(..), init, main, update, view)

import Browser
import Header
import Home
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import ListaAnuncio
import Msg exposing (..)


type Pagina
    = Home
    | ListaAnuncio



-- | Login


main =
    Browser.sandbox
        { view = view
        , init = init
        , update = update
        }


type alias Model =
    { title : String
    , pagina : Pagina
    , headerModel : Header.Model
    , homeModel : Home.Model
    , listaAnuncioModel : ListaAnuncio.Model
    }


init : Model
init =
    { title = "Hello World"
    , pagina = Home
    , headerModel = Header.init
    , homeModel = Home.init
    , listaAnuncioModel = ListaAnuncio.init
    }


update : Msg -> Model -> Model
update msg model =
    case msg of
        HeaderMsg headerMsg ->
            { model | headerModel = Header.update headerMsg model.headerModel }

        HomeMsg homeMsg ->
            case homeMsg of
                SelectCategory categoria ->
                    { model | pagina = ListaAnuncio }

                _ ->
                    { model | homeModel = Home.update homeMsg model.homeModel }


view : Model -> Html Msg
view model =
    div []
        [ Header.view model.headerModel
        , main_ [ attribute "role" "main" ]
            [ case model.pagina of
                Home ->
                    Home.view model.homeModel

                ListaAnuncio ->
                    ListaAnuncio.view model.listaAnuncioModel
            ]
        , footer [ class "text-muted" ]
            [ div [ class "container" ]
                [ p [ class "float-right" ]
                    [ a [ href "#" ]
                        [ text "Back to top" ]
                    ]
                , p []
                    [ text "Album example is © Bootstrap, but please download and customize it for yourself!" ]
                , p []
                    [ text "New to Bootstrap? "
                    , a [ href "../../" ]
                        [ text "Visit the homepage" ]
                    , text "or read our "
                    , a [ href "../../getting-started/" ]
                        [ text "getting started guide" ]
                    , text "."
                    ]
                ]
            ]
        ]
