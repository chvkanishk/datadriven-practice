def hourly_event_counts(logs: list[tuple[str, str]]) -> dict[str, dict[str, int]]:
  if logs is None: 
    return {}
  result = {}
  for time, lable in logs:
    s=time[:13]
    result.setdefault(s,{})
    inner= result[s]
    inner[lable] = inner.get(lable,0)+1
    
  return result
    
    
    
  
  
