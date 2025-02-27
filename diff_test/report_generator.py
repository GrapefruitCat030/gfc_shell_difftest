class ReportGenerator:
    @staticmethod
    def compare_outputs(output1: str, output2: str) -> bool:
        return output1.strip() == output2.strip()

    @staticmethod
    def generate_report(results: dict) -> str:
        report = "Test Report:\n"
        for test_name, output in results.items():
            report += f"{test_name}:\n{output}\n\n"
        return report