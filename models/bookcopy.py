"""copyright (c) 2020 Beeflow Ltd.

Author Rafal Przetakowski <rafal.p@beeflow.co.uk>"""
from peewee import *

from models.basemodel import BaseModel
from models.book import Book
from models.bookstatus import BookStatus


class BookCopy(BaseModel):
    id = AutoField(column_name='bc_id')
    status = ForeignKeyField(BookStatus, column_name='bc_status_id')
    book = ForeignKeyField(Book, column_name='bc_book_id')

    def __str__(self):
        return str(self.book)
