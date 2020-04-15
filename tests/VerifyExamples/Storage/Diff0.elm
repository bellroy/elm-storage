module VerifyExamples.Storage.Diff0 exposing (..)

-- This file got generated by [elm-verify-examples](https://github.com/stoeffel/elm-verify-examples).
-- Please don't modify this file by hand!

import Expect
import Storage exposing (..)
import Storage.Value as Value exposing (..)
import Test


spec0 : Test.Test
spec0 =
    Test.test "#diff: \n\n    diff\n        ( fromList [(\"a\", Value.string \"a1\"), (\"c\", Value.string \"c1\")] )\n        ( fromList [(\"a\", Value.string \"a2\"), (\"b2\", Value.string \"b2\")] )\n    --> fromList [ (\"c\", Value.string \"c1\") ]" <|
        \() ->
            Expect.equal
                (diff
                    (fromList [ ( "a", Value.string "a1" ), ( "c", Value.string "c1" ) ])
                    (fromList [ ( "a", Value.string "a2" ), ( "b2", Value.string "b2" ) ])
                )
                (fromList [ ( "c", Value.string "c1" ) ])