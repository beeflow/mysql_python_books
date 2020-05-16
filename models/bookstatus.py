"""copyright (c) 2020 Beeflow Ltd.

Author Rafal Przetakowski <rafal.p@beeflow.co.uk>"""
from peewee import *

from models.basemodel import BaseModel


class BookStatus(BaseModel):
    id = AutoField(column_name='bs_id')
    name = CharField(max_length=15, column_name='bs_name')

    def __str__(self):
        return self.name
