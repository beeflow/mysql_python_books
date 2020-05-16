"""copyright (c) 2020 Beeflow Ltd.

Author Rafal Przetakowski <rafal.p@beeflow.co.uk>"""
from models.author import Author
from models.book import Book
from models.firstname import FirstName

if __name__ == '__main__':
    pass
    # authors = Author().select().join(FirstName).where(FirstName.name=='Stephen')
    #
    # for author in authors:
    #     print(author)
    #     for book in author.books:
    #         print(book)
    #
    #     print('--------')


    # book = Book().get(2)
    # print(book)
    #
    # for author in book.authors:
    #     print(author, author.id)
    #
    # print('---------------')
    # author = Author().get(1)
    # print(author)
    #
    # for book in author.books:
    #     print(book)
