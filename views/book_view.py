"""copyright (c) 2020 Beeflow Ltd.

Author Rafal Przetakowski <rafal.p@beeflow.co.uk>"""
from typing import List

from models.author import Author
from models.book import Book
from models.firstname import FirstName
from models.lastname import LastName


class BookView:
    def add(self):
        print('Dodawanie książki')
        print('-----------------')

        title: str = input("Tytuł: ")
        isbn: str = input("ISBN: ")

        try:
            pages = int(input("Stron: "))
        except ValueError:
            pages = None

        try:
            published = int(input("Rok wydania [yyyy]: "))
        except ValueError:
            published = None

        authors: List[Author] = self._add_authors()

        book = Book(title=title, isbn=isbn, pages=pages, published=published)
        book.save()

        book.authors = authors
        book.update()

    @staticmethod
    def find():
        print('Wyszukiwanie książek')
        print('--------------------')

        search_param = input("Podaj  tytuł: ")
        books = Book().select().where(Book.title.contains(search_param))

        for book in books:
            print(book)
            for author in book.authors:
                print(author)

            print('-----')

    @staticmethod
    def _add_authors() -> List[Author]:
        """Dodawanie autorów książki."""
        next_author: str = 't'
        authors: List[str] = []

        while next_author == 't':
            authors.append(input("Imię i nazwisko autora: "))
            next_author = input("Następny autor [t/n]?")

        result: List[Author] = []

        for author_name in authors:
            try:
                first_name, last_name = author_name.split(' ')
            except ValueError:
                first_name, last_name = author_name, None

            author = Author().get_or_create(
                first_name=FirstName().get_or_create(name=first_name)[0],
                last_name=LastName().get_or_create(name=last_name)[0] if last_name else None,
            )[0]

            result.append(author)

        return result
