# src/main.py
from src.c01_basics import variables_scoping
from src.c01_basics import variables_scoping_advanced

def run():
    print("=== TEST 1: GLOBAL SCOPE BASICS ===")
    variables_scoping.read_global()  # Prints 100
    variables_scoping.modify_global_with_keyword()
    variables_scoping.read_global()  # Prints 200
    
    print("\n=== TEST 2: NESTED ENCLOSING SCOPE (NONLOCAL) ===")
    variables_scoping_advanced.outer_function()
    
    print("\n=== TEST 3: DOWNWARD ACCESS ERROR ===")
    try:
        variables_scoping_advanced.show_downward_error()
    except NameError as e:
        print(f"Caught expected error: {e}")

if __name__ == "__main__":
    run()