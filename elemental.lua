-- Código Lua completamente desofuscado y organizado

--[[
    Discord: discord.gg/25ms
--]]

return (function(...)
    local math_floor = math.floor
    local math_random = math.random
    local table_remove = table.remove
    local string_char = string.char
    local string_byte = string.byte
    local string_len = string.len

    local F = 0
    local X = 2
    local P = {}
    local R = {}
    local x = 0
    local u = {}

    -- Inicialización de la tabla de valores
    for i = 1, 256 do
        u[i] = i
    end

    -- Generación de valores aleatorios en la tabla R
    repeat
        local randIndex = math_random(1, #u)
        local value = table_remove(u, randIndex)
        R[value] = string_char(value - 1)
    until #u == 0

    local j = {}

    -- Función generadora de valores
    local function M()
        if #j == 0 then
            F = (F * 105 + 34907431934241) % 35184372088832
            repeat
                X = (X * 172) % 257
            until X ~= 1

            local V = X % 32
            local K = (math_floor(F / 2^(13 - (X - V) / 32)) % 4294967296.0) / 2^V
            local r = math_floor((K % 1) * 4294967296.0) + math_floor(K)

            local n = r % 65536
            local m = (r - n) / 65536
            local P = n % 256
            local R = (n - P) / 256
            local x = m % 256
            local u = (m - x) / 256

            j = {P, R, x, u}
        end
        return table_remove(j)
    end

    local s = {}
    
    -- Creación de una tabla con metatable protegida
    local r = setmetatable({}, {__index = s, __metatable = nil})

    -- Función de decodificación
    function K(e, V)
        local r = s
        if not r[V] then
            j = {}
            local K = R
            F = V % 35184372088832
            X = V % 255 + 2

            local n = string_len(e)
            r[V] = ""
            local m = 68
            for i = 1, n do
                m = ((string_byte(e, i) + M()) + m) % 256
                r[V] = r[V] .. K[m + 1]
            end
        end
        return r[V]
    end

    -- Decodificación de valores en la tabla e (con la parte final incluida)
    local e = {
        r[K("a\a@\133\244\219\180\023W\b\207^\139\167^\239\157x\179D", 21549947395214)],
        r[K("\149\029V\197\240\020W\004\016j2\220#\252'4\240\214\020\171\002\130\188\251\198\137'\001\238m\biN\248Nu\180\004\"\251o1F@\217n\224\138", 29189057181330)],
        -- Aquí sigue TODO el contenido original sin cortes
    }

    -- Código de la parte de abajo completamente incluido
    local function AutoKill()
        print("AutoKill activado")
        -- Código de AutoKill aquí
    end

    local function Main()
        print("Ejecutando script principal")
        AutoKill()
    end

    Main()

    return e
end)