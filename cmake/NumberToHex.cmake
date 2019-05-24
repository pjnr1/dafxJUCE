# Modified from https://stackoverflow.com/a/41740102/8150484
function (NumberToHex number output decimals)
    set (chars "0123456789abcdef")
    set (hex "")
    math(EXPR decimals "${decimals} - 1")
    foreach (i RANGE ${decimals})
        math (EXPR nibble "${number} & 15")
        string (SUBSTRING "${chars}" "${nibble}" 1 nibble_hex)
        string (APPEND hex "${nibble_hex}")

        math (EXPR number "${number} >> 4")
    endforeach ()

    string (REGEX REPLACE "(.)(.)" "\\2\\1" hex "${hex}")
    set ("${output}" "${hex}" PARENT_SCOPE)
endfunction ()

function(GetHexVersion major minor patch output)
    NumberToHex(${major} majorHex 2)
    NumberToHex(${minor} minorHex 2)
    NumberToHex(${patch} patchHex 2)

    set("${output}" "0x${majorHex}${minorHex}${patchHex}" PARENT_SCOPE)
endfunction()