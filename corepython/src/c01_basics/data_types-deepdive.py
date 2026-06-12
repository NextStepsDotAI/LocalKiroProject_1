import sys

def infinite_precision():
    product = 1
    prev_mem_size = sys.getsizeof(product) # Initialize with starting size (28 bytes)
    
    print(f"Baseline     | Size: {prev_mem_size:3d} Bytes | Address: {hex(id(product))}")
    print("-" * 80)
    
    for i in range(1, 100):
        product = product * i
        mem_address = hex(id(product))
        mem_size_bytes = sys.getsizeof(product)
        digit_length = len(str(product))
        
        # Trigger ONLY when Python actually grows the byte allocation allocation
        if mem_size_bytes != prev_mem_size:
            print(f"Iteration {i:2d} | Size: {mem_size_bytes:3d} Bytes | Address: {mem_address} | Value Length: {digit_length:2d} digits")
            prev_mem_size = mem_size_bytes

infinite_precision()

import sys

def track_power_of_two_memory():
    print(f"Exponent | Numerical Value (Truncated) | Byte Size | Data Blocks Alloc")
    print("-" * 75)
    
    # We loop through exponents up to 120 to cross multiple 30-bit thresholds
    for exponent in range(0, 121, 5):
        value = 2 ** exponent
        mem_size = sys.getsizeof(value)
        
        # Calculate how many 4-byte data blocks are active
        # (Total Bytes - 24 Bytes Overhead) / 4 Bytes per block
        data_blocks = (mem_size - 24) // 4
        
        # Format long numbers to keep the output clean
        val_str = str(value)
        display_val = val_str if len(val_str) <= 20 else f"{val_str[:15]}...({len(val_str)} digs)"
        
        print(f"2^{exponent:<3}  | {display_val:<28} | {mem_size:3d} Bytes | {data_blocks} block(s)")

track_power_of_two_memory()

import sys

def explain_memory_growth():
    print(f"{'Power':<6} | {'Bit Length':<10} | {'Byte Size':<10} | {'Blocks Alloc':<12} | {'Why it changed / Status'}")
    print("-" * 90)
    
    # Looping loop through powers of 2 right across the 30-bit and 60-bit boundaries
    for exponent in [28, 29, 30, 31, 58, 59, 60, 61]:
        value = 2 ** exponent
        mem_size = sys.getsizeof(value)
        
        # Calculate bits needed to represent this number
        bit_length = value.bit_length()
        
        # Total Bytes = 24 (Base Overhead) + (Blocks * 4)
        blocks = (mem_size - 24) // 4
        
        # Determine the structural status
        if bit_length in [31, 61]:
            status = f"--> BOUNDARY CROSSED! Needs block {blocks} ({bit_length} bits > {blocks-1}*30 bits)"
        else:
            status = f"Fits comfortably inside {blocks} block(s) (Max capacity: {blocks * 30} bits)"
            
        print(f"2^{exponent:<3}  | {bit_length:<10} | {mem_size:<3} Bytes | {blocks:<12} | {status}")

explain_memory_growth()