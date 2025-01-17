from fastapi import FastAPI
from pydantic import BaseModel
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker


app = FastAPI()

DBURL = "postgresql://postgres:wail@localhost/5432/MusicAppDB"
engine = create_engine(DBURL)
sessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
db = sessionLocal()


class UserCreate(BaseModel):
 name: str 
 email: str
 password: str

@app.post('/signup')
def signup_user(user: UserCreate):
    print(user.name)
    print(user.email)
    print(user.password)

