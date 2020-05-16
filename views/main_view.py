"""copyright (c) 2020 Beeflow Ltd.

Author Rafal Przetakowski <rafal.p@beeflow.co.uk>"""
from views.book_view import BookView


def get_menu_option():
    options = ("Dodaj książkę", "Znajdź książkę", "Dodaj użytkownika", "Znajdź użytkownika")

    print("Wybierz opcję:")

    for index, option in enumerate(options):
        print(f"  {index + 1} - {option}")

    print("  q - Zakończ porogram")

    return input("> ")


def main():
    option = get_menu_option()

    if option == 'q':
        exit()

    try:
        option = int(option)
    except ValueError:
        print("Dokonano złego wyboru!")
        main()

    if option == 1:
        BookView().add()

    if option == 2:
        BookView().find()
