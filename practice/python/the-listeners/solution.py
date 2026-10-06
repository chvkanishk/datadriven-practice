class EventEmitter:
  def __init__(self):
    self.listeners= {}
    
  def on(self, event, listener):
    if event not in self.listeners:
      self.listeners[event] =[]
    self.listeners[event].append(listener)
    
  def off(self, event, listener):
    if event in self.listeners and listener in self.listeners[event]:
      self.listeners[event].remove(listener)
  
  def emit(self, event, payload):
    count = len(self.listeners.get(event, []))
    return [payload] * count
       
  
def event_broadcaster(op_names: list[str], op_args: list[list]) -> list:
  results = []
  emitter = None 
  
  for name, args in zip(op_names, op_args):
    if name == "EventEmitter":
      emitter = EventEmitter()
      results.append(None)
    elif name == "on":
      emitter.on(args[0], args[1])
      results.append(None)
    elif name == "off":
      emitter.off(args[0], args[1])
      results.append(None)
    elif name == "emit":
      results.append(emitter.emit(args[0], args[1]))

  return results
