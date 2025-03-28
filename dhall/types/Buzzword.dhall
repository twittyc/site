{ Type = 
    { name : Text
    , rating : Natural  -- Using Natural ensures we get a non-negative integer
    }
, default = 
    { name = ""
    , rating = 50  -- Default middle rating (assuming 0-100 scale)
    }
}