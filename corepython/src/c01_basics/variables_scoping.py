# src/c01_basics/variables_scoping.py

# A variable defined at the top level of the file is a GLOBAL variable
my_global = 100


def read_global():
    # Reading a global variable is freely allowed from anywhere
    print(f"Reading global variable: {my_global}")


def modify_global_with_keyword():
    # To modify the global variable, we MUST declare it explicitly
    global my_global
    my_global = 200