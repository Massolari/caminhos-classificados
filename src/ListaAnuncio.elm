module ListaAnuncio exposing (CapaAnuncio, Model, getImage, init, renderAnuncio, view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Msg exposing (..)


type alias CapaAnuncio =
    { id : Int
    , titulo : String
    , descricao : String
    , imagem : Maybe String
    , autor : String
    , whatsapp : String
    , categoria : String
    }


type alias Model =
    { anuncios : List CapaAnuncio
    }


init : Model
init =
    { anuncios =
        [ { id = 0
          , titulo = "Salgadinhos"
          , descricao = "Vendo salgadinhos de festa com sabores misto"
          , imagem = Nothing
          , autor = "Jorge"
          , whatsapp = "21983315205"
          , categoria = "Comida"
          }
        , { id = 1
          , titulo = "Maquiagem"
          , descricao = "Faço maquiagem em noivas, madrinhas e qualquer outro tipo de evento. Inclui maquiagem a prova d'agua e cílios postiços."
          , imagem = Nothing
          , autor = "Bia Gomes"
          , whatsapp = "21980261189"
          , categoria = "Beleza"
          }
        ]
    }


view : Model -> Html Msg
view model =
    div [ class "album py-5 bg-light" ]
        [ div [ class "container" ]
            [ div [ class "row" ]
                [ div [ class "col-md-4" ]
                    [ div [ class "card mb-4 shadow-sm" ] <| List.map renderAnuncio model.anuncios
                    ]
                ]
            ]
        ]


renderAnuncio : CapaAnuncio -> Html Msg
renderAnuncio anuncio =
    div []
        [ img [ alt "Card image cap", class "card-img-top", attribute "data-src" <| getImage anuncio.imagem ]
            []
        , div [ class "card-body" ]
            [ small [ class "text-muted" ] [ text anuncio.categoria ]
            , h5 [ class "card-title" ] [ text anuncio.titulo ]
            , p [ class "card-text" ]
                [ text anuncio.descricao ]
            , div []
                [ div [ class "btn-group" ]
                    [ button [ class "btn btn-primary", type_ "button" ]
                        [ text "Ver anúncio" ]
                    , button [ class "btn btn-success", type_ "button" ]
                        [ text "Enviar mensagem" ]
                    ]
                , div []
                    [ small [ class "text-muted" ] [ text ("por " ++ anuncio.autor) ]
                    ]
                ]
            ]
        ]


getImage : Maybe String -> String
getImage image =
    case image of
        Just srcImage ->
            srcImage

        Nothing ->
            "holder.js/100x225?theme=thumb&bg=55595c&fg=eceeef&text=Sem imagem"
