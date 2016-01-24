def to_json(model):
    return model.to_json() if getattr(model, 'to_json', None) else model
