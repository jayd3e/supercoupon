from subprocess import check_output


def get_local_git_hash():
    return check_output('git rev-parse HEAD', shell=True).strip()


def get_git_hash(request):
    return request.registry.settings['redd.commit_hash']


def includeme(config):
    config.set_request_property(get_git_hash, 'git_hash', reify=True)
