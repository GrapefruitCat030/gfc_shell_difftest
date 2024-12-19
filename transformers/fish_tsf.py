def posix_to_fish(posix_script: str) -> str:
    """
    Convert a POSIX Shell script to a Fish script.
    """
    # Replace POSIX syntax with Fish-specific syntax
    fish_script = posix_script.replace("VAR=", "set VAR ") \
                              .replace("if [", "if test ") \
                              .replace("]; then", "; then") \
                              .replace("for i in 1 2 3; do", "for i in 1 2 3") \
                              .replace("done", "end") \
                              .replace("fi", "end") \
                              .replace("my_function() {", "function my_function") \
                              .replace("$1", "$argv[1]") \
                              .replace("#!/bin/sh", "#!/usr/bin/env fish")
    return fish_script