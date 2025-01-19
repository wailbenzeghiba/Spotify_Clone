from fastapi import FastAPI 
from models import base
from routes import Auth
from database import engine
from routes import Auth

app = FastAPI()

app.include_router(Auth.router , prefix="/auth")

base.Base.metadata.create_all(engine)



    




