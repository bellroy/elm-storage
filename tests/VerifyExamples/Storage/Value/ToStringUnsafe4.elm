module VerifyExamples.Storage.Value.ToStringUnsafe4 exposing (..)

-- This file got generated by [elm-verify-examples](https://github.com/stoeffel/elm-verify-examples).
-- Please don't modify this file by hand!

import Expect
import Storage.Value exposing (..)
import Test


spec4 : Test.Test
spec4 =
    Test.test "#toStringUnsafe: \n\n    toStringUnsafe (bool True)\n    --> \"true\"" <|
        \() ->
            Expect.equal
                (toStringUnsafe (bool True))
                "true"