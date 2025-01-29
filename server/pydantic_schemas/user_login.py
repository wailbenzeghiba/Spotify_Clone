from pydantic import BaseModel  
from models.user import User
from models.base import Base

class UserLogin(BaseModel):
 email: str
 password: str