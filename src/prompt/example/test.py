# 使用示例
test_generator = TestCaseGenerator()

# 准备测试数据
test_cases = [
    {
        "source": "for i in 1 2 3; do echo $i; done",
        "expected": "for i in 1 2 3; echo $i; end",
        "description": "基本for循环转换",
        "is_error": False
    },
    {
        "source": "for ((i=0; i<5; i++)); do echo $i; done",
        "expected": None,
        "description": "不支持的C风格for循环",
        "is_error": True
    }
]

# 生成测试prompt
prompt = test_generator.generate_test_prompt(
    mutator_code="class ForLoopMutator(BaseMutator): ...",
    feature_name="ForLoop",
    test_cases=test_cases
)