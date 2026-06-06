#!/bin/bash
set -e

# 1. Check if the existing project name argument was provided
if [ -z "$1" ]; then
    echo "❌ Error: Please provide your existing project directory name."
    echo "Usage: ./upgrade_to_textbook.sh <existing_project_name>"
    exit 1
fi

TARGET_DIR=$1

# 2. Check if the target directory actually exists
if [ ! -d "$TARGET_DIR" ] || [ ! -d "$TARGET_DIR/src" ]; then
    echo "❌ Error: '$TARGET_DIR' or '$TARGET_DIR/src' does not exist."
    echo "Please make sure you type the name of your existing project folder exactly."
    exit 1
fi

echo "🔄 Upgrading '$TARGET_DIR' to an interactive Python Textbook framework..."

# 3. Define the learning chapters
CHAPTERS=(
    "c01_basics"
    "c02_control_flow"
    "c03_data_structures"
    "c04_functions"
    "c05_oop"
    "c06_advanced"
)

# 4. Generate the subfolders and __init__.py files under the existing src/
for chapter in "${CHAPTERS[@]}"; do
    mkdir -p "$TARGET_DIR/src/$chapter"
    touch "$TARGET_DIR/src/$chapter/__init__.py"
done

# 5. Create all the specific construct files
touch "$TARGET_DIR/src/c01_basics/variables_scoping.py"
touch "$TARGET_DIR/src/c01_basics/data_types.py"
touch "$TARGET_DIR/src/c01_basics/operators.py"

touch "$TARGET_DIR/src/c02_control_flow/conditionals.py"
touch "$TARGET_DIR/src/c02_control_flow/loops.py"

touch "$TARGET_DIR/src/c03_data_structures/lists_tuples.py"
touch "$TARGET_DIR/src/c03_data_structures/dicts_sets.py"
touch "$TARGET_DIR/src/c03_data_structures/comprehensions.py"

touch "$TARGET_DIR/src/c04_functions/core_syntax.py"
touch "$TARGET_DIR/src/c04_functions/lambda_expressions.py"
touch "$TARGET_DIR/src/c04_functions/generators_iterators.py"

touch "$TARGET_DIR/src/c05_oop/classes_objects.py"
touch "$TARGET_DIR/src/c05_oop/inheritance.py"
touch "$TARGET_DIR/src/c05_oop/polymorphism.py"
touch "$TARGET_DIR/src/c05_oop/encapsulation.py"

touch "$TARGET_DIR/src/c06_advanced/exception_handling.py"
touch "$TARGET_DIR/src/c06_advanced/context_managers.py"
touch "$TARGET_DIR/src/c06_advanced/decorators.py"

# 6. Safely overwrite src/main.py with the classroom dashboard layout
cat << 'EOF' > "$TARGET_DIR/src/main.py"
# The Dashboard Entrypoint for Python Mastery

def run():
    print("====================================")
    print("📚 WELCOME TO YOUR LIVING TEXTBOOK 📚")
    print("====================================\n")
    print("Uncomment modules below to test your scripts:")
    
    # Ready for Chapter 1:
    # from src.c01_basics import variables_scoping
    # variables_scoping.demonstrate_scoping()

if __name__ == "__main__":
    run()
EOF

echo "✅ Upgrade complete! Your standard project now contains the full blueprint."
echo "🔍 Check your IDE or run 'git status' to see the added structure."