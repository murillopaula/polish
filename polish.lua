local s = [[
  /__________\
    10 20 -
    5 2 *
    15 10 + 2 -
    1 1 + 2 /
  _____________
]]

local operators = {
  ["+"] = function(x, y) return x + y end,
  ["-"] = function(x, y) return x - y end,
  ["*"] = function(x, y) return x * y end,
  ["/"] = function(x, y) return x / y end,
}

local function parse(s)
  local stack = {}

  for w in s:gmatch("%S+") do
    local operator = operators[w]
    if operator then
      first = table.remove(stack)
      second = table.remove(stack)
      table.insert(stack, operator(second, first))
    elseif tonumber(w) then
      table.insert(stack, w)
    end
  end

  for _, v in ipairs(stack) do
    print(v)
  end
end

parse(s)
