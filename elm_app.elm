{- Patrón Básico de Elm
   La lógica de cualquier programa en Elm puede separarse en 3 partes
   claramente definidas:
     - MODEL  -- El estado de tu app
     - UPDATE -- Maneras de actualizar el estado de tu app
     - VIEW   -- Manera de visualizar el estado de tu app con Html

   Siempre inicia con el esqueleto siguiente y ve llenando los detalles
   para tu caso particular.
-}

import Html exposing (..)


-- MODEL
type alias Model = { ... }


-- UPDATE
type Msg = Reset | ...

update : Msg -> Model -> Model

update msg model =
    case msg of
        reset -> ...
        ...

-- VIEW
view : Model -> Html Msg
view model =
    ...
