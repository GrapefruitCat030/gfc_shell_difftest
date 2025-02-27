from diff_test.test_case import TestCase
from diff_test.report_generator import ReportGenerator

def main():
    # 定义测试用例
    test_cases = [
        ("Bash Script", "scripts/bash_script.sh", "bash"),
        ("Fish Script", "scripts/fish_script.sh", "fish"),
        ("Zsh Script", "scripts/zsh_script.sh", "zsh"),
    ]

    # 运行测试用例
    results = {}
    for test_name, script_path, shell in test_cases:
        test_case = TestCase(script_path, shell)
        output = test_case.run()
        results[test_name] = output

    # 生成测试报告
    report = ReportGenerator.generate_report(results)
    print(report)

    # 比较输出结果
    base_output = results["Bash Script"]
    for test_name, output in results.items():
        if test_name != "Bash Script":
            is_match = ReportGenerator.compare_outputs(base_output, output)
            print(f"{test_name} matches Bash output: {is_match}")

if __name__ == "__main__":
    main()