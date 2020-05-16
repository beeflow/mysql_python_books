"""copyright (c) 2020 Beeflow Ltd.

Author Rafal Przetakowski <rafal.p@beeflow.co.uk>"""
from peewee import *

from models.basemodel import BaseModel
from models.firstname import FirstName
from models.lastname import LastName


class Author(BaseModel):
    id = AutoField(column_name='author_id')
    first_name = ForeignKeyField(FirstName, column_name='author_first_name_id')
    last_name = ForeignKeyField(LastName, column_name='author_last_name_id')

    def __str__(self):
        return f"{self.first_name} {self.last_name}"
