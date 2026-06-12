# src/c01_basics/data_types.py
import sys

print(f"🎬 Loading Data Types Module! [__name__ = '{__name__}']")

def demonstrate_integers_and_floats():
    print("\n=== SYSTEM DATA TYPES: NUMERICS ===")
    
    # 1. Arbitrary Precision Integers
    large_int = 10**50  # Python automatically handles massive numbers without overflow
    print(f"Large Integer Value: {large_int}")
    print(f"Type: {type(large_int)}")
    
    # 2. Object Overhead Memory Cost
    # A raw 64-bit integer only needs 8 bytes, but notice what Python objects require:
    print(f"Memory size of integer object: {sys.getsizeof(large_int)} bytes")

def demonstrate_strings_and_ids():
    print("\n=== SYSTEM DATA TYPES: STRINGS & MEMORY IDENTITIES ===")
    
    # 1. Identity vs Value
    str_a = "CloudArchitecture"
    str_b = "CloudArchitecture"
    
    print(f"str_a value equals str_b: {str_a == str_b}")
    print(f"str_a shares memory address with str_b (Is identical): {str_a is str_b}")
    print(f"Memory Address of str_a: {id(str_a)}")
    print(f"Memory Address of str_b: {id(str_b)}")

if __name__ == "__main__":
    demonstrate_integers_and_floats()
    demonstrate_strings_and_ids()