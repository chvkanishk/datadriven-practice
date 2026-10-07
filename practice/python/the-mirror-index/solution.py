def invert_dict(d: dict) -> dict:
  keys = list(d.keys())
  result ={}
  for i in range(len(keys)):
    result.setdefault(d.get(keys[i]),[]).append(keys[i])
    
  return result 
    
