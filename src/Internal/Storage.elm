module Internal.Storage exposing
    ( Storage
    , diff
    , empty
    , fromList
    , get
    , insert
    , intersect
    , isEmpty
    , keys
    , member
    , merge
    , remove
    , singleton
    , size
    , toList
    , union
    , update
    , values
    )

import Dict exposing (Dict)
import Internal.Storage.Value exposing (Value)


type Storage
    = Storage StorageDict


type alias StorageDict =
    Dict String Value


empty : Storage
empty =
    Storage Dict.empty


singleton : String -> Value -> Storage
singleton key =
    Tuple.pair key
        >> List.singleton
        >> fromList


fold : (Dict String Value -> a) -> Storage -> a
fold f =
    toDict >> f


foldDict : (Dict String Value -> Dict String Value) -> Storage -> Storage
foldDict f =
    fold f >> fromDict


fold2 :
    (Dict String Value -> Dict String Value -> a)
    -> Storage
    -> Storage
    -> a
fold2 f a b =
    f (toDict a) (toDict b)


foldDict2 :
    (Dict String Value -> Dict String Value -> Dict String Value)
    -> Storage
    -> Storage
    -> Storage
foldDict2 f a b =
    fromDict <| fold2 f a b


insert : String -> Value -> Storage -> Storage
insert key =
    foldDict << Dict.insert key


update : String -> (Maybe Value -> Maybe Value) -> Storage -> Storage
update key =
    foldDict << Dict.update key


remove : String -> Storage -> Storage
remove =
    foldDict << Dict.remove


isEmpty : Storage -> Bool
isEmpty =
    fold Dict.isEmpty


member : String -> Storage -> Bool
member =
    fold << Dict.member


get : String -> Storage -> Maybe Value
get =
    fold << Dict.get


size : Storage -> Int
size =
    fold Dict.size


fromList : List ( String, Value ) -> Storage
fromList =
    fromDict << Dict.fromList


fromDict : StorageDict -> Storage
fromDict =
    Storage


toDict : Storage -> StorageDict
toDict (Storage dict) =
    dict


keys : Storage -> List String
keys =
    fold Dict.keys


values : Storage -> List Value
values =
    fold Dict.values


toList : Storage -> List ( String, Value )
toList =
    fold Dict.toList


union : Storage -> Storage -> Storage
union =
    foldDict2 Dict.union


intersect : Storage -> Storage -> Storage
intersect =
    foldDict2 Dict.intersect


diff : Storage -> Storage -> Storage
diff =
    foldDict2 Dict.diff


merge :
    (String -> Value -> result -> result)
    -> (String -> Value -> Value -> result -> result)
    -> (String -> Value -> result -> result)
    -> Storage
    -> Storage
    -> result
    -> result
merge f1 f2 f3 a b c =
    fold2 (\a2 b2 -> Dict.merge f1 f2 f3 a2 b2 c) a b
