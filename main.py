from fastapi import FastAPI
from starlette.middleware import Middleware
from starlette.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from ukrainian_word_stress import Stressifier, StressSymbol
import sys


origins = ['*']
middleware = [
    Middleware(
        CORSMiddleware,
        allow_origins=origins,
        allow_credentials=True,
        allow_methods=["*"],
        allow_headers=["*"],
    )
]
app = FastAPI(middleware=middleware)

stressify = Stressifier(stress_symbol=StressSymbol.CombiningAcuteAccent)
print("Loaded stress dictionary", file=sys.stderr)


class StringToStress(BaseModel):
    text: str


@app.post("/api/stress")
async def stressify_text(item: StringToStress):
    # print("<", item.text, file=sys.stderr)
    stressedText = {"stressedtext": stressify(item.text)}
    # print(">", stressedText, file=sys.stderr)
    return stressedText

