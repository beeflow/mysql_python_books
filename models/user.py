"""copyright (c) 2020 Beeflow Ltd.

Author Rafal Przetakowski <rafal.p@beeflow.co.uk>"""
from peewee import *

from models.basemodel import BaseModel
from models.firstname import FirstName
from models.lastname import LastName


class User(BaseModel):
    id = AutoField(column_name='user_id')
    email = CharField(max_length=100, column_name='user_email')
    phone = CharField(max_length=12, column_name='user_phone')
    card_number = CharField(max_length=9, column_name='user_card_number')
    first_name = ForeignKeyField(FirstName, column_name='user_first_name_id')
    last_name = ForeignKeyField(LastName, column_name='user_last_name_id')

    def __str__(self):
        return f"{self.first_name} {self.last_name}"
