
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Regex
import Char

main = Html.beginnerProgram { model = model, view = view, update = update }


-- MODEL
type alias Model =
    { name : String
    , password : String
    , passwordAgain : String
    , age : String
    }

model : Model
model =
   Model "" "" "" " "


-- UPDATE
type Msg
    = Name String
    | Password String
    | PasswordAgain String
    | Age String

update : Msg -> Model -> Model

update msg model =
    case msg of
        Name name ->
            { model | name = name }
        Password password ->
            { model | password = password }
        PasswordAgain password ->
            { model | passwordAgain = password }
        Age age ->
            { model | age = age }


-- VIEW
view : Model -> Html Msg
view model =
    div []
        [ input [ type_ "text", placeholder "Name", onInput Name][]
        , input [ type_ "password", placeholder "Password", onInput Password][]
        , input [ type_ "password", placeholder "Re-enter password", onInput PasswordAgain][]
        , input [type_ "age", placeholder "Age", onInput Age][]
        , viewValidation model
        , passwordValidation model
        , formatValidation model
        , ageValidation model
        ]

viewValidation : Model -> Html msg
viewValidation model =
    let
        ( color, message ) =
            if model.password == model.passwordAgain then
                ( "green", "Ok passwords match" )
            else
                ( "red", "Passwords do not match!" )
    in
        div[ style [( "color", color )]][ text message ]

passwordValidation : Model -> Html msg
passwordValidation model =
    let
        ( color, message ) =
            if String.length model.password > 8 then
                ( "green", "Ok password is more than 8 chars" )
            else
                ( "red", "Passwords needs to be more than 8 chars!" )
    in
        div[ style [( "color", color )]][ text message ]

formatValidation : Model -> Html msg
formatValidation model =
    let
        ( color, message ) =
            if Regex.contains(Regex.regex("(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)"))  model.password == True then
                ( "green", "Ok, password has one lowercase, uppercase and number" )
            else
                ( "red", "Passwords needs to be lowercase, uppercase and number" )
    in
        div[ style [( "color", color )]][ text message ]

ageValidation : Model -> Html msg
ageValidation model =
    let
        ( color, message ) =
            if String.all Char.isDigit model.age == True then
                ( "green", "Ok, age is numeric" )
            else
                ( "red", "Age needs to be numeric" )
    in
        div[ style [( "color", color )]][ text message ]
