UNITS = {m: 1, ft: 3.28, in: 39.37}

def convert_length(length, from: :m, to: :m)
  (length / UNITS[from] * UNITS[to]).round(2)
end