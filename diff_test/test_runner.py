import subprocess

class TestRunner:
    def __init__(self, shell: str):
        self.shell = shell

    def run_script(self, script_path: str) -> str:
        try:
            result = subprocess.run(
                [self.shell, script_path],
                capture_output=True,
                text=True,
                check=True
            )
            return result.stdout
        except subprocess.CalledProcessError as e:
            return f"Error: {e.stderr}"