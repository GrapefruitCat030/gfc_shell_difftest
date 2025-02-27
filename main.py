from src.prompt.engine import prompt_engine

# 使用示例
engine = prompt_engine.PromptEngine()

# 生成mutator的prompt
mutator_prompt = engine.generate_mutator_prompt(
    syntax_feature="for_loop",
    target_shell="fish",
)

print(mutator_prompt)


# # 生成测试用例的prompt
# test_prompt = engine.generate_test_prompt(
#     mutator_code="class QuotingMutator(BaseMutator): ...",
#     feature_name="Quoting",
#     test_cases=[
#         {"input": "echo \"hello world\"",
#          "expected": "echo 'hello world'"}
#     ]
# )