from diff_test.test_runner import TestRunner

class TestCase:
    def __init__(self, script_path: str, shell: str):
        self.script_path = script_path
        self.shell = shell
        self.runner = TestRunner(shell)

    def run(self) -> str:
        return self.runner.run_script(self.script_path)