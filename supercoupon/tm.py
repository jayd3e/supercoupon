import transaction


def get_tm(request):
    return transaction.get()


def includeme(config):
    config.add_request_method(get_tm, 'tm', reify=True, property=True)
