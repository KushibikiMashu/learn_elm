document :
    { init : flags -> ( model, Cmd msg )
    , view : model -> document msg
    , update : msg -> model -> ( model, Cmd msg )
    , subscriptions : model -> Sub msg
    }
    -> Program flags model msg
