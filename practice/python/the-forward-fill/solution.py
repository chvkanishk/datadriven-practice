def forward_fill(values: list) -> list:  
  temp = None
    
  for i in range(len(values)):
    if values[i] is None:
      values[i] = temp 
    else:
      temp = values[i]
        
  return values 
  
