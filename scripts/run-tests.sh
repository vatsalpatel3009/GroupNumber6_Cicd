#!/usr/bin/env bash

# CI/CD Validation Script
# This script runs basic checks on the project structure and required content.

set -euo pipefail

echo "Starting CI validation checks..."

# Check required folder
if [[ ! -d "myapp" ]]; then
  echo "ERROR: myapp directory is missing." >&2
  exit 1
fi

# Check required files
if [[ ! -f "myapp/index.html" ]]; then
  echo "ERROR: index.html not found." >&2
  exit 1
fi

if [[ ! -f "myapp/styles.css" ]]; then
  echo "ERROR: styles.css not found." >&2
  exit 1
fi

if [[ ! -f "myapp/script.js" ]]; then
  echo "ERROR: script.js not found." >&2
  exit 1
fi

echo "Required files check passed."

# Check date requirement
if ! grep -q "March 15, 2026" myapp/index.html; then
  echo "ERROR: Today's date (March 15, 2026) not found in index.html." >&2
  exit 1
fi

echo "Date check passed."

# Check student name
if ! grep -q "Rutvik Patel" myapp/index.html; then
  echo "ERROR: Student name (Rutvik Patel) not found in index.html." >&2
  exit 1
fi

echo "Student name check passed."

# Check project title
if ! grep -q "Capstone Project Dashboard" myapp/index.html; then
  echo "ERROR: Project title not found in index.html." >&2
  exit 1
fi

echo "Project title check passed."

echo "All CI validation tests passed successfully."