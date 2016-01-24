import time


def epoch_secs(dt):
    if dt:
        secs = time.mktime(dt.timetuple())
        return int(secs)
    return None


def epoch_ms(dt):
    if dt:
        return epoch_secs(dt) * 1000
    return None
