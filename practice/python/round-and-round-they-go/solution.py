from collections import Counter

def distribute(values: list[int], containers: list[str]) -> list[dict]:
  count = Counter(values)
  unique = sorted(count.keys())
  result =[]
  l_con = len(containers)
  for i,val in enumerate(unique):
    con_type = containers[i % l_con]
    if con_type =="set":
      group = [val]
    else: 
      group = [val]*count[val]
    result.append({
      "values": group,
      "container": con_type
      })
  return result 
