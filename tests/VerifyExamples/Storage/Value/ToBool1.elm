module VerifyExamples.Storage.Value.ToBool1 exposing (..)

-- This file got generated by [elm-verify-examples](https://github.com/stoeffel/elm-verify-examples).
-- Please don't modify this file by hand!

import Expect
import Storage.Value exposing (..)
import Test


spec1 : Test.Test
spec1 =
    Test.test "#toBool: \n\n    toBool (bool True)\n    --> Just True" <|
        \() ->
            Expect.equal
                (toBool (bool True))
                (Just True)
