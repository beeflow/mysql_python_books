"""copyright (c) 2020 Beeflow Ltd.

Author Rafal Przetakowski <rafal.p@beeflow.co.uk>"""
from datetime import datetime

from peewee import *

from models.basemodel import BaseModel
from models.bookcopy import BookCopy
from models.user import User


class UserBookRent(BaseModel):
    id = AutoField(column_name='ub_id')
    user = ForeignKeyField(User, column_name='ub_user_id')
    book = ForeignKeyField(BookCopy, column_name='ub_bc_id')
    rent_date = DateTimeField(column_name='ub_rent_date', default=datetime.now())
    return_data = DateTimeField(column_name='ub_rent_date', null=True)
