module Msg exposing (Categoria(..), HeaderMsg(..), HomeMsg(..), Msg(..))


type Categoria
    = Beleza
    | Comida
    | Doces
    | Marcenaria


type HomeMsg
    = SelectCategory Categoria
    | ChangeFiltro String


type HeaderMsg
    = ToggleNavbar


type Msg
    = HeaderMsg HeaderMsg
    | HomeMsg HomeMsg
