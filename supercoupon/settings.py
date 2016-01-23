import os

from supercoupon.git import get_local_git_hash


def includeme(config):
    settings = config.get_settings()

    eget = os.environ.get

    default_git_hash = ''
    if settings['supercoupon.mode'] == 'development':
        default_git_hash = get_local_git_hash()

    # database.url
    config_database_url = settings.get('database.url', '')
    config_database_url = settings.get('sqlalchemy.url', config_database_url)
    eff_database_url = eget('DATABASE_URL', config_database_url)

    # database.url
    config_database_create_all = settings.get('database.create_all', '')
    eff_database_create_all = eget('DATABASE_CREATE_ALL', config_database_create_all) == 'true'  # must be boolean

    # supercoupon.commit_hash
    config_piapp_commit_hash = settings.get('supercoupon.commit_hash', default_git_hash)
    eff_piapp_commit_hash = eget('COMMIT_HASH', config_piapp_commit_hash)

    # supercoupon.allow_emails
    update = {
        # Database
        'database.url': eff_database_url,
        'sqlalchemy.url': eff_database_url,

        # Database.create_all
        'database.create_all': eff_database_create_all,

        # Commit hash
        'supercoupon.commit_hash': eff_piapp_commit_hash,
    }

    # set the final settings
    config.add_settings(update)
