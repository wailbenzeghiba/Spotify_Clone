from fastapi import FastAPI, HTTPException  
from sqlalchemy.orm import sessionmaker
from sqlalchemy.ext.declarative import declarative_base
from models.user import User 
from models import base
from routes import Auth
from database import engine
from routes import Auth

app = FastAPI()

app.include_router(Auth.router , prefix="/auth")

base.Base.metadata.create_all(engine)



    




