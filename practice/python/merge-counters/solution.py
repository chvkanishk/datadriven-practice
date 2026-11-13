def merge_dicts(d1, d2):
  result =dict(d1)
  for i in d2:
    if i in result:
      result[i]= d1[i]+ d2[i]
    else:
      result[i]=d2[i] 
  
  
  return result
