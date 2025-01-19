from pydantic import BaseModel  
from models.user import User
from database import db 
from models.base import Base
class UserCreate(BaseModel):
 name: str 
 email: str
 password: str