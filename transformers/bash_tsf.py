def posix_to_bash(posix_script: str) -> str:
    """
    Convert a POSIX Shell script to a Bash script.
    """
    # Replace POSIX syntax with Bash-specific syntax
    bash_script = posix_script.replace("if [", "if [[") \
                              .replace("]; then", " ]]; then") \
                              .replace("for i in 1 2 3; do", "for i in {1..3}; do") \
                              .replace("#!/bin/sh", "#!/bin/bash")
    return bash_script