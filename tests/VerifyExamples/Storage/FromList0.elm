module VerifyExamples.Storage.FromList0 exposing (..)

-- This file got generated by [elm-verify-examples](https://github.com/stoeffel/elm-verify-examples).
-- Please don't modify this file by hand!

import Expect
import Storage exposing (..)
import Storage.Value as Value exposing (..)
import Test


spec0 : Test.Test
spec0 =
    Test.test "#fromList: \n\n    fromList [\n        ( \"fruit\", Value.string \"apple\" )\n    ]\n    --> insert \"fruit\" (Value.string \"apple\") empty" <|
        \() ->
            Expect.equal
                (fromList
                    [ ( "fruit", Value.string "apple" )
                    ]
                )
                (insert "fruit" (Value.string "apple") Storage.empty)