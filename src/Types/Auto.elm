module Types.Auto exposing (..)


{- this file is generated by <https://github.com/choonkeat/elm-auto-encoder-decoder> do not modify manually -}


import Types exposing (..)
import Dict
import Json.Decode
import Json.Encode
import Platform
import Set


-- HARDCODE


encodeString : String -> Json.Encode.Value
encodeString =
    Json.Encode.string


encodeInt : Int -> Json.Encode.Value
encodeInt =
    Json.Encode.int


encodeFloat : Float -> Json.Encode.Value
encodeFloat =
    Json.Encode.float


encodeBool : Bool -> Json.Encode.Value
encodeBool =
    Json.Encode.bool


encodeList : (a -> Json.Encode.Value) -> List a -> Json.Encode.Value
encodeList =
    Json.Encode.list


encodeSetSet : (comparable -> Json.Encode.Value) -> Set.Set comparable -> Json.Encode.Value
encodeSetSet encoder =
    Set.toList >> encodeList encoder


encodeDictDict : (a -> Json.Encode.Value) -> (b -> Json.Encode.Value) -> Dict.Dict a b -> Json.Encode.Value
encodeDictDict keyEncoder =
    Json.Encode.dict (\k -> Json.Encode.encode 0 (keyEncoder k))


encode_Unit : () -> Json.Encode.Value
encode_Unit value =
    Json.Encode.list identity [ encodeString "" ]


--


decodeString : Json.Decode.Decoder String
decodeString =
    Json.Decode.string


decodeInt : Json.Decode.Decoder Int
decodeInt =
    Json.Decode.int


decodeFloat : Json.Decode.Decoder Float
decodeFloat =
    Json.Decode.float


decodeBool : Json.Decode.Decoder Bool
decodeBool =
    Json.Decode.bool


decodeList : (Json.Decode.Decoder a) -> Json.Decode.Decoder (List a)
decodeList =
    Json.Decode.list


decodeSetSet : (Json.Decode.Decoder comparable) -> Json.Decode.Decoder (Set.Set comparable)
decodeSetSet =
    Json.Decode.list >> Json.Decode.map Set.fromList


decodeDictDict : (Json.Decode.Decoder comparable) -> (Json.Decode.Decoder b) -> Json.Decode.Decoder (Dict.Dict comparable b)
decodeDictDict keyDecoder valueDecoder =
    Json.Decode.dict valueDecoder
        |> Json.Decode.map (\dict ->
            Dict.foldl (\string v acc ->
                case Json.Decode.decodeString keyDecoder string of
                    Ok k ->
                        Dict.insert k v acc
                    Err _ ->
                        acc
            ) Dict.empty dict
        )


decode_Unit : Json.Decode.Decoder ()
decode_Unit  =
    Json.Decode.index 0 Json.Decode.string
        |> Json.Decode.andThen
            (\word ->
                case word of
                    "" -> (Json.Decode.succeed ())
                    _ -> Json.Decode.fail ("Unexpected Unit: " ++ word)
            )


-- PRELUDE


{-| CustomTypeDef { constructors = [CustomTypeConstructor (TitleCaseDotPhrase "Nothing") [],CustomTypeConstructor (TitleCaseDotPhrase "Just") [ConstructorTypeParam "a"]], name = TypeName "Maybe" ["a"] } -}
encodeMaybe : (a -> Json.Encode.Value) -> Maybe a -> Json.Encode.Value
encodeMaybe arga value =
    case value of
        (Nothing) -> (Json.Encode.list identity [ encodeString "Nothing" ])
        (Just m0) -> (Json.Encode.list identity [ encodeString "Just", (arga m0) ])



{-| CustomTypeDef { constructors = [CustomTypeConstructor (TitleCaseDotPhrase "Err") [ConstructorTypeParam "x"],CustomTypeConstructor (TitleCaseDotPhrase "Ok") [ConstructorTypeParam "a"]], name = TypeName "Result" ["x","a"] } -}
encodeResult : (x -> Json.Encode.Value) -> (a -> Json.Encode.Value) -> Result x a -> Json.Encode.Value
encodeResult argx arga value =
    case value of
        (Err m0) -> (Json.Encode.list identity [ encodeString "Err", (argx m0) ])
        (Ok m0) -> (Json.Encode.list identity [ encodeString "Ok", (arga m0) ])

{-| CustomTypeDef { constructors = [CustomTypeConstructor (TitleCaseDotPhrase "Nothing") [],CustomTypeConstructor (TitleCaseDotPhrase "Just") [ConstructorTypeParam "a"]], name = TypeName "Maybe" ["a"] } -}
decodeMaybe : (Json.Decode.Decoder (a)) -> Json.Decode.Decoder (Maybe a)
decodeMaybe arga =
    Json.Decode.index 0 Json.Decode.string
        |> Json.Decode.andThen
            (\word ->
                case word of
                    "Nothing" -> (Json.Decode.succeed Nothing)
                    "Just" -> (Json.Decode.succeed Just |> (Json.Decode.map2 (|>) (Json.Decode.index 1 (arga))))
                    _ -> Json.Decode.fail ("Unexpected Maybe: " ++ word)
            )
                 



{-| CustomTypeDef { constructors = [CustomTypeConstructor (TitleCaseDotPhrase "Err") [ConstructorTypeParam "x"],CustomTypeConstructor (TitleCaseDotPhrase "Ok") [ConstructorTypeParam "a"]], name = TypeName "Result" ["x","a"] } -}
decodeResult : (Json.Decode.Decoder (x)) -> (Json.Decode.Decoder (a)) -> Json.Decode.Decoder (Result x a)
decodeResult argx arga =
    Json.Decode.index 0 Json.Decode.string
        |> Json.Decode.andThen
            (\word ->
                case word of
                    "Err" -> (Json.Decode.succeed Err |> (Json.Decode.map2 (|>) (Json.Decode.index 1 (argx))))
                    "Ok" -> (Json.Decode.succeed Ok |> (Json.Decode.map2 (|>) (Json.Decode.index 1 (arga))))
                    _ -> Json.Decode.fail ("Unexpected Result: " ++ word)
            )
                 




{-| CustomTypeDef { constructors = [CustomTypeConstructor (TitleCaseDotPhrase "Types.SetGreeting") [CustomTypeConstructor (TitleCaseDotPhrase "String") []]], name = TypeName "Types.MsgFromClient" [] } -}
encodeTypesMsgFromClient : Types.MsgFromClient -> Json.Encode.Value
encodeTypesMsgFromClient value =
    case value of
        (Types.SetGreeting m0) -> (Json.Encode.list identity [ encodeString "Types.SetGreeting", (encodeString m0) ])



{-| CustomTypeDef { constructors = [CustomTypeConstructor (TitleCaseDotPhrase "Types.CurrentGreeting") [CustomTypeConstructor (TitleCaseDotPhrase "String") []]], name = TypeName "Types.MsgFromServer" [] } -}
encodeTypesMsgFromServer : Types.MsgFromServer -> Json.Encode.Value
encodeTypesMsgFromServer value =
    case value of
        (Types.CurrentGreeting m0) -> (Json.Encode.list identity [ encodeString "Types.CurrentGreeting", (encodeString m0) ])



{-| CustomTypeDef { constructors = [CustomTypeConstructor (TitleCaseDotPhrase "Types.Cookied") [CustomTypeConstructor (TitleCaseDotPhrase "String") []],CustomTypeConstructor (TitleCaseDotPhrase "Types.Anonymous") []], name = TypeName "Types.RequestContext" [] } -}
encodeTypesRequestContext : Types.RequestContext -> Json.Encode.Value
encodeTypesRequestContext value =
    case value of
        (Types.Cookied m0) -> (Json.Encode.list identity [ encodeString "Types.Cookied", (encodeString m0) ])
        (Types.Anonymous) -> (Json.Encode.list identity [ encodeString "Types.Anonymous" ])

{-| CustomTypeDef { constructors = [CustomTypeConstructor (TitleCaseDotPhrase "Types.SetGreeting") [CustomTypeConstructor (TitleCaseDotPhrase "String") []]], name = TypeName "Types.MsgFromClient" [] } -}
decodeTypesMsgFromClient : Json.Decode.Decoder (Types.MsgFromClient)
decodeTypesMsgFromClient  =
    Json.Decode.index 0 Json.Decode.string
        |> Json.Decode.andThen
            (\word ->
                case word of
                    "Types.SetGreeting" -> (Json.Decode.succeed Types.SetGreeting |> (Json.Decode.map2 (|>) (Json.Decode.index 1 (decodeString))))
                    _ -> Json.Decode.fail ("Unexpected Types.MsgFromClient: " ++ word)
            )
                 



{-| CustomTypeDef { constructors = [CustomTypeConstructor (TitleCaseDotPhrase "Types.CurrentGreeting") [CustomTypeConstructor (TitleCaseDotPhrase "String") []]], name = TypeName "Types.MsgFromServer" [] } -}
decodeTypesMsgFromServer : Json.Decode.Decoder (Types.MsgFromServer)
decodeTypesMsgFromServer  =
    Json.Decode.index 0 Json.Decode.string
        |> Json.Decode.andThen
            (\word ->
                case word of
                    "Types.CurrentGreeting" -> (Json.Decode.succeed Types.CurrentGreeting |> (Json.Decode.map2 (|>) (Json.Decode.index 1 (decodeString))))
                    _ -> Json.Decode.fail ("Unexpected Types.MsgFromServer: " ++ word)
            )
                 



{-| CustomTypeDef { constructors = [CustomTypeConstructor (TitleCaseDotPhrase "Types.Cookied") [CustomTypeConstructor (TitleCaseDotPhrase "String") []],CustomTypeConstructor (TitleCaseDotPhrase "Types.Anonymous") []], name = TypeName "Types.RequestContext" [] } -}
decodeTypesRequestContext : Json.Decode.Decoder (Types.RequestContext)
decodeTypesRequestContext  =
    Json.Decode.index 0 Json.Decode.string
        |> Json.Decode.andThen
            (\word ->
                case word of
                    "Types.Cookied" -> (Json.Decode.succeed Types.Cookied |> (Json.Decode.map2 (|>) (Json.Decode.index 1 (decodeString))))
                    "Types.Anonymous" -> (Json.Decode.succeed Types.Anonymous)
                    _ -> Json.Decode.fail ("Unexpected Types.RequestContext: " ++ word)
            )
                 