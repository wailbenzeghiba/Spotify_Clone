from sqlalchemy import LargeBinary, create_engine, Column,UUID, String,VARCHAR
from sqlalchemy.orm import sessionmaker
from models.base import Base 
import uuid



class User(Base):
    __tablename__ = "users"
    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)   
    name = Column(VARCHAR(100))
    email = Column(VARCHAR(100))
    password = Column(LargeBinary)
