from datetime import time


def epoch_secs(dt):
    if dt:
        secs = time.mktime(dt.timetuple())
        return int(secs)
    return None
