#!/bin/bash
gunicorn nombre_del_archivo:app --bind 0.0.0.0:$PORT
