from sqlalchemy import create_engine
from fastapi import FastAPI
from sqlalchemy.orm import sessionmaker






DBURL = "postgresql://postgres:wail@localhost:5432/MusicAppDB"
engine = create_engine(DBURL)
sessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

async def get_db():
    db = sessionLocal()
    try:
        yield db
    finally:
        db.close()