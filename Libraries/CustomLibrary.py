import random
import string
import time

from common.CommonGlobal import *


@library
class CustomLibrary(object):
    # ROBOT_LIBRARY_SCOPE = 'GLOBAL'
    # ROBOT_LIBRARY_VERSION = get_version()

    @keyword(types=None)
    def get_random_name(self, email_length):
        letters = string.ascii_lowercase + string.ascii_uppercase + string.digits
        return ''.join(random.choice(letters) for i in range(email_length))

    @keyword(types=None)
    def generate_random_emails(self, append_email):
        domains = ["mailinator.com"]  # ["hotmail.com", "gmail.com", "aol.com","mail.com", "mail.kz", "yahoo.com"]
        email_length = round(len(append_email) / (len(append_email) / 2))
        return str(f'{self.get_random_name(email_length)}_{append_email}@{random.choice(domains)}')

    @keyword
    def split_string_return_by_index(self, string_to_split, separator=None, return_index=0):
        separator = None if separator == '' else separator
        ret_val = string_to_split.split(str(separator))[return_index]
        my_logger(f'split_string_return_by_index :  {ret_val}')
        return str(ret_val)

    @keyword(types=None)
    def generate_screenshot_filename(self):
        time_object = time.localtime()
        local_time = time.strftime("%m_%d_%Y_%H%M%S", time_object)
        my_logger(f'generate_screenshot_filename {local_time}')
        return local_time
