from fastapi import Depends, FastAPI, HTTPException  
import uuid
import bcrypt
from sqlalchemy.orm import Session
from models.user import User        
from database import get_db
from models.base import Base
from pydantic_schemas.user_create import UserCreate
from fastapi import APIRouter
from database import engine
from pydantic_schemas.user_login import UserLogin
router = APIRouter()


@router.post('/signup', status_code= 201)
def signup_user(user: UserCreate, db: Session = Depends(get_db)):
    user_db = db.query(User).filter(User.email == user.email).first()

    if  user_db:
       raise HTTPException(status_code=400, detail="User already exists")
       
    hashed_password = bcrypt.hashpw(user.password.encode('utf-8'), bcrypt.gensalt())
    newUser = User(id = str(uuid.uuid4()) , name=user.name, email=user.email, password=hashed_password)
    db.add(newUser)
    db.commit()
    db.refresh(newUser)
    


    return newUser


@router.post('/login')
def login_user(user: UserLogin, db: Session = Depends(get_db)):
    user_db = db.query(User).filter(User.email == User.email).first()

    if not user_db:
        raise HTTPException(400, "Invalid Credentials")
     
    ismatch = bcrypt.checkpw(user.password.encode('utf-8'), user_db.password)
     
    if not ismatch:
        raise HTTPException(400, "Invalid Credentials")
    
    return user_db
        
     
