from llm_util import read_file
from llm_client import call_deepseek_api

def generate_transformer(posix_doc: str, target_shell: str, target_doc: str) -> str:
    template = read_file("template.txt")
    prompt = template.replace("{{posix_doc}}", posix_doc) \
                     .replace("{{target_shell}}", target_shell) \
                     .replace("{{target_doc}}", target_doc)
    return call_deepseek_api(prompt)


if __name__ == "__main__":
    # Read POSIX documentation
    posix_doc = read_file("transformer_doc/posix/ifstmt.txt")

    # Generate Bash transformer
    bash_doc = read_file("transformer_doc/bash/ifstmt.txt")
    bash_transformer = generate_transformer(posix_doc, "Bash", bash_doc)
    print("Bash Transformer:")
    print(bash_transformer)

    # Generate Fish transformer
    fish_doc = read_file("transformer_doc/fish/ifstmt.txt")
    fish_transformer = generate_transformer(posix_doc, "Fish", fish_doc)
    print("\nFish Transformer:")
    print(fish_transformer)

    # Generate Zsh transformer
    zsh_doc = read_file("transformer_doc/zsh/ifstmt.txt")
    zsh_transformer = generate_transformer(posix_doc, "Zsh", zsh_doc)
    print("\nZsh Transformer:")
    print(zsh_transformer)