-- EXAMPLE 1

--/topic/architecture
--/topic/painting
--/topic/sculpture
--/blog/42
--/blog/123
--/blog/451
--/user/tom
--/user/sue
--/user/sue/comment/11
--/user/sue/comment/51

import Url.parser exposing (Parser, (</>), int, map, oneOf, s, string)

type Route
    = Topic String
    | Blog Int
    | User String
    | Comment String Int

routeParser : Parser (Route -> a) a
routeParser =
    oneOf
        [ map Topic     (s "topic" </> string)
        , map Blog      (s "blog" </> int)
        , map User      (s "user" </> string )
        , map Comment   (s "user" </> string  </> s "comment"  </> int)
        ]

-- EXAMPLE 2

--/blog/12/the-history-of-chairs
--/blog/13/the-endless-september
--/blog/14/whale-facts
--/blog/
--/blog?q=whales
--/blog?q=seiza

import Url.parser exposing (Parser, (</>), (<?>), int, map, oneOf, s, string)
import Url.Parser.Query as Query

type Route
    = BlogPost Int String
    | BlogQuery (Maybe String)

routeParser : Parser (Route -> a) a
routeParser =
    oneOf
        [ map BlogPost (s "blog" </> int </> string)
        , map Blog (s "blog" <?> Query.string "q")
        ]


-- EXAMPLE 3

--/Basics
--/Maybe
--/List
--/List#map
--/List#filter
--/List#foldl

type alias Docs
    (String, Maybe String)

docsParser : Parser (Docs -> a) a
docsParser =
    map Tuple.pair (string </> fragment identity)


