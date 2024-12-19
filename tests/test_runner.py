import subprocess

def run_script(script_content: str) -> str:
    """
    Run a shell script and return its output.
    """
    with open("temp_script.sh", "w") as f:
        f.write(script_content)
    result = subprocess.run(["sh", "temp_script.sh"], capture_output=True, text=True)
    return result.stdout

def compare_outputs(output1: str, output2: str) -> bool:
    """
    Compare two outputs and return True if they match.
    """
    return output1.strip() == output2.strip()

def test_transformer(posix_script: str, transformer_func) -> None:
    """
    Test a transformer function by comparing the output of the transformed script
    with the output of the POSIX script.
    """
    # Run the POSIX script
    posix_output = run_script(posix_script)

    # Transform the POSIX script
    transformed_script = transformer_func(posix_script)

    # Run the transformed script
    transformed_output = run_script(transformed_script)

    # Compare outputs
    if compare_outputs(posix_output, transformed_output):
        print("Test passed!")
    else:
        print("Test failed!")
        print("POSIX Output:")
        print(posix_output)
        print("Transformed Output:")
        print(transformed_output)

# Example usage
if __name__ == "__main__":
    posix_script = """
#!/bin/sh

VAR="Hello, World!"

if [ "$VAR" = "Hello, World!" ]; then
    echo "Condition met: $VAR"
else
    echo "Condition not met"
fi
"""

    # Define transformers (replace with LLM-generated functions)
    def posix_to_bash(posix_script: str) -> str:
        return posix_script.replace("if [", "if [[") \
                           .replace("]; then", " ]]; then") \
                           .replace("#!/bin/sh", "#!/bin/bash")

    def posix_to_fish(posix_script: str) -> str:
        return posix_script.replace("VAR=", "set VAR ") \
                           .replace("if [", "if test ") \
                           .replace("]; then", "; then") \
                           .replace("fi", "end") \
                           .replace("#!/bin/sh", "#!/usr/bin/env fish")

    # Test Bash transformer
    print("Testing Bash Transformer:")
    test_transformer(posix_script, posix_to_bash)

    # Test Fish transformer
    print("\nTesting Fish Transformer:")
    test_transformer(posix_script, posix_to_fish)