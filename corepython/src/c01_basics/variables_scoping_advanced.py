# src/c01_basics/variables_scoping_advanced.py

def outer_function():
    # Enclosing variable
    shared_value = "Original Outer Value"
    
    def inner_function():
        # 🔑 FIX: Declaring nonlocal at the absolute top solves the syntax rule.
        # This tells Python IMMEDIATELY how to handle this variable name.
        nonlocal shared_value
        
        # 1. Reading the upward layer is now completely fine
        print(f"Inner function reading outer shared_value: {shared_value}")
        
        # 2. Modifying the upward layer
        shared_value = "Modified Outer Value"
        
    # Execute the nested function
    inner_function()
    
    # Print again to prove the inner function successfully modified it
    print(f"Outer function shared_value after modification: {shared_value}")


def show_downward_error():
    """Proves that a parent scope cannot look DOWN into a child scope."""
    def child_function():
        child_variable = "Hidden inside child"
        
    child_function()
    
    # This line will crash because data cannot flow downward out of a function
    print(child_variable)