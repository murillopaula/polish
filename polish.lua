--/__________\
--  10 20 -     -> 10 - 20
--   5 2 *      ->  5 * 2
--  15 10 + 2 - ->  23
--   1 1 + 2 /  ->
--  ...
--_____________


-- lluis.esquerda@konghq.com

--"10 20 -" --> -10

--pop()
--push()
local operators = {
  ["+"] = function(x, y) return x + y end
}

local function parse(s)
  -- "10 20 - "
  result = s.split(' ')
  stack = {}

  for last in result do
    if last == '+'
      -- {10, 20}
      first = stack.pop()
      -- {10}
      second = stack.pop()
      local f = stack.insert(operators[last])
      print(f(first, second))
      -- {25}
    elseif last == '-'
      -- {10, 20}
      first = stack.pop()
      -- {10}
      second = stack.pop()
      stack.insert(first - second)
      -- {25}
    else
      stack.insert(elem)
    end
  end

