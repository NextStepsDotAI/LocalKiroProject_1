 #!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# 1. Check if the project name argument was provided
if [ -z "$1" ]; then
    echo "❌ Error: Please provide a project name."
    echo "Usage: ./make_python_project.sh <project_name>"
    exit 1
fi

PROJECT_NAME=$1

# 2. Check if a directory with that name already exists
if [ -d "$PROJECT_NAME" ]; then
    echo "❌ Error: A directory named '$PROJECT_NAME' already exists here."
    exit 1
fi

echo "🚀 Creating standard Python project: $PROJECT_NAME..."

# 3. Create the directories
mkdir -p "$PROJECT_NAME/src"
mkdir -p "$PROJECT_NAME/tests"

# 4. Create the core project files
touch "$PROJECT_NAME/src/__init__.py"
touch "$PROJECT_NAME/src/main.py"
touch "$PROJECT_NAME/tests/__init__.py"
touch "$PROJECT_NAME/README.md"
touch "$PROJECT_NAME/requirements.txt"
touch "$PROJECT_NAME/.gitignore"

# 5. Populate src/main.py with a standard entry point
cat << 'EOF' > "$PROJECT_NAME/src/main.py"
def run():
    print("Python project initialized successfully.")

if __name__ == "__main__":
    run()
EOF

# 6. Populate README.md
cat << EOF > "$PROJECT_NAME/README.md"
# $PROJECT_NAME

Standard Python project structure.

## Setup
\`\`\`bash
python3 -m venv .venv
source .venv/bin/activate  # On Windows use: .venv\\Scripts\\activate
pip install -r requirements.txt
\`\`\`
EOF

# 7. Populate a clean, standard .gitignore
cat << 'EOF' > "$PROJECT_NAME/.gitignore"
# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*$py.class

# Virtual environments
.venv/
venv/
ENV/

# IDE specific settings
.vscode/
.idea/
.project
.pydevproject

# OS specific
.DS_Store
Thumbs.db
EOF

# 8. Initialize Git inside the new project directory
echo "🌱 Initializing Git repository..."
cd "$PROJECT_NAME"
git init -q
git branch -M main

# 9. Make an initial local commit
git add .
git commit -m "Initial commit: Standard Python project structure"

echo "✅ Successfully created '$PROJECT_NAME'!"
echo "👉 Run 'cd $PROJECT_NAME' to start working."