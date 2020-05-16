"""copyright (c) 2020 Beeflow Ltd.

Author Rafal Przetakowski <rafal.p@beeflow.co.uk>"""
import mysql.connector


class UseDatabase:
    def __init__(self, config: dict) -> None:
        self.__config = config

    def __enter__(self) -> 'cursor':
        self.__conn = mysql.connector.connect(**self.__config)
        self.__cursor = self.__conn.cursor()
        return self.__cursor

    def __exit__(self, exc_type, exc_val, exc_tb) -> None:
        self.__conn.commit()
        self.__cursor.close()
        self.__conn.close()
