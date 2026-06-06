#!/bin/bash
set -e

if [ -z "$1" ]; then
    echo "❌ Error: Please provide a project name."
    echo "Usage: ./make_subproject.sh <project_name>"
    exit 1
fi

PROJECT_NAME=$1

if [ -d "$PROJECT_NAME" ]; then
    echo "❌ Error: A directory named '$PROJECT_NAME' already exists."
    exit 1
fi

echo "🚀 Creating standard Python subfolder: $PROJECT_NAME..."

# Create structure without initializing a new Git repo
mkdir -p "$PROJECT_NAME/src"
mkdir -p "$PROJECT_NAME/tests"

touch "$PROJECT_NAME/src/__init__.py"
touch "$PROJECT_NAME/src/main.py"
touch "$PROJECT_NAME/tests/__init__.py"
touch "$PROJECT_NAME/README.md"
touch "$PROJECT_NAME/requirements.txt"

# Standard entry point
cat << 'EOF' > "$PROJECT_NAME/src/main.py"
def run():
    print("Python project initialized successfully.")

if __name__ == "__main__":
    run()
EOF

# Standard README
cat << EOF > "$PROJECT_NAME/README.md"
# $PROJECT_NAME
Standard Python project structure.
EOF

echo "✅ Successfully created '$PROJECT_NAME' layout!"
echo "🔍 Run 'git status' to see it tracked under your main repository."