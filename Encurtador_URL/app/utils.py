import random
import string
from user_agents import parse


def generate_short_code(length=6):
    return ''.join(
        random.choices(string.ascii_letters + string.digits, k=length)
    )


def get_device(user_agent: str):
    ua = parse(user_agent)

    if ua.is_mobile:
        return "Mobile"
    elif ua.is_tablet:
        return "Tablet"
    else:
        return "Desktop"
