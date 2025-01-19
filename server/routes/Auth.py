from fastapi import FastAPI, HTTPException  
import uuid
import bcrypt
from models.user import User    
from models.base import Base    
from database import db
from pydantic_schemas.user_create import UserCreate
from fastapi import APIRouter
from database import engine
router = APIRouter()


@router.post('/signup')
def signup_user(user: UserCreate):
    user_db = db.query(User).filter(User.email == user.email).first()

    if  user_db:
       raise HTTPException(status_code=400, detail="User already exists")
       return 
    hashed_password = bcrypt.hashpw(user.password.encode('utf-8'), bcrypt.gensalt())
    newUser = User(id = str(uuid.uuid4()) , name=user.name, email=user.email, password=hashed_password)
    db.add(newUser)
    db.commit()
    db.refresh(newUser)
    
    return user_db

