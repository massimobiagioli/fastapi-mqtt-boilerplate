from fastapi import FastAPI

from app.routers.api import api_router

app = FastAPI()


app.include_router(router=api_router, prefix="/api/v1", tags=["api"])
