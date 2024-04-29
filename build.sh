#!/bin/bash

echo "Building the application..."

# Install Python dependencies using pip
pip install -r requirements.txt

# Run Flask migrations (if applicable)
# flask db upgrade

# Compile static assets (if applicable)
npm install
npm run build

# Start Flask development server

python app.py
