import Html exposing (Html)
import Html.App as App
import Time exposing (Time, second, millisecond)
import Html exposing (text, img, div)
import Html.Attributes exposing (src, style)



main =
  App.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }


-- MODEL

type alias Model = Time


init : (Model, Cmd Msg)
init =
  (0, Cmd.none)


-- UPDATE

type Msg
  = Tick Time


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Tick click ->
      (model + 2, Cmd.none)


-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
  Time.every (16 * millisecond) Tick


-- VIEW

view : Model -> Html Msg
view model =
  div [ style [("padding", "50px"), ("textAlign", "center")] ]
    [ img [ src "./swayze.png", style [("transform", "rotate(" ++ toString model ++ "deg)")] ] [ ]
    ]

