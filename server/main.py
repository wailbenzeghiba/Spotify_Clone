from fastapi import FastAPI 
from models import base
from routes import Auth
from database import engine
from routes import Auth
from fastapi.middleware.cors import CORSMiddleware


app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Adjust this to allow specific origins
    allow_credentials=True,
    allow_methods=["POST", "GET"],
    allow_headers=["*"],
)

app.include_router(Auth.router , prefix="/auth")

base.Base.metadata.create_all(engine)



    




