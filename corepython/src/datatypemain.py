# src/main.py
from src.c01_basics import variables_scoping
from src.c01_basics import variables_scoping_advanced
from src.c01_basics import data_types  # 👈 New Import

def run():
    print(f"🚀 Trigger File active! My internal __name__ is: '{__name__}'")
    
    # --- Previous Scoping Tests omitted for brevity ---
    
    print("\n=== STARTING DATA TYPES CHAPTER ===")
    data_types.demonstrate_integers_and_floats()
    data_types.demonstrate_strings_and_ids()

if __name__ == "__main__":
    run()