def remove_bytes_from_file(input_file, output_file, target_bytes, replacement_bytes):
    with open(input_file, 'rb') as f_in, open(output_file, 'wb') as f_out:
        f_out.write(bytes(bytearray(f_in.read()).replace(target_bytes, replacement_bytes)))

# Usage example:
remove_bytes_from_file("donutreal", "donut", b'\x1b[H', b'\x01')
