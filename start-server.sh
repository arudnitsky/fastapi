#!/bin/sh
uvicorn main:app --workers 3 --port 5000 --log-level critical
