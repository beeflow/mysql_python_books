"""copyright (c) 2020 Beeflow Ltd.

Author Rafal Przetakowski <rafal.p@beeflow.co.uk>"""
from typing import List

from models.lastname import LastName
from models.user import User


class UserView:
    @staticmethod
    def search(last_name: str) -> List[User] or None:
        return User().select().join(LastName).where(LastName.name == last_name)
