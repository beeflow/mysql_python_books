"""copyright (c) 2020 Beeflow Ltd.

Author Rafal Przetakowski <rafal.p@beeflow.co.uk>"""
from peewee import *

from models.author import Author
from models.basemodel import BaseModel


class Book(BaseModel):
    id = AutoField(column_name='book_id')
    title = CharField(max_length=250, null=False)
    isbn = CharField(max_length=13, null=False, column_name='book_isbn')
    pages = IntegerField(column_name='book_pages', null=False)
    published = IntegerField(column_name='book_publish_year', null=True)
    authors = ManyToManyField(Author)

    def __str__(self):
        return f"{self.title} - {self.isbn}"
