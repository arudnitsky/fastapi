#!/usr/bin/bash
uvicorn main:app --workers 3 --port 5000 --log-level debug $@
