from fastapi import APIRouter

from app.routers.api.health import router as health_router

api_router = APIRouter()

api_router.include_router(
    router=health_router,
    prefix="/health",
)
