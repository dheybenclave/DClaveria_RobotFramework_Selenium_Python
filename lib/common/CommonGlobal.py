from __future__ import absolute_import

import os

from robot.api import logger
from robot.api.deco import keyword, library
from robot.version import get_version


def my_logger(message):
    message = f'Logs : {message}'
    logger.console(message, stream='STDOUT')


@library
class CommonGlobal:
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'
    ROBOT_LIBRARY_VERSION = get_version()

    @keyword
    def my_logger(self, message):
        message = f'Logs : {message}'
        logger.console(message, stream='STDOUT')

    @keyword
    def check_file_exist(self, filepath):
        return True if os.path.exists(str(filepath)) else False

    def read_in_files(self,file_name_path):
        self = file_name_path
        self.my_logger(f'**FILE NAME : {file_name_path}**')

        try:
            if self.check_file_exist(file_name_path):
                file_name = open(file_name_path, "r")
                list_get_row_file = []
                if file_name.readable():
                    for rows in file_name.readlines():
                        list_get_row_file.append(rows.strip())

                file_name.close()
                self.my_logger(f'READ FILE : {list_get_row_file}')
                return list_get_row_file
            else:
                self.my_logger(f'{file_name_path} is not exist or can''t find')

        except ValueError:
            self.my_logger(ValueError)
