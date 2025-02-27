你是一个专业的Shell语法转换专家。请基于以下信息生成一个Tree-sitter-bash的Python Mutator：

【语法特性】
{syntax_feature}

【源Shell(POSIX)语法】
{posix_doc}

【目标Shell语法】
{target_shell_doc}

【转换示例】
源代码(POSIX)：
```
{posix_examples}
```

目标代码（{target_shell}）：
```
{target_examples}
```

【代码模板】:
```
{mutator_code_template}
```
你需要继承BaseMutator类实现一个具体的{syntax_feature}2{target_shell}Mutator：
1. 实现can_handle方法来识别{syntax_feature}相关的语法节点
2. 实现handle_transform方法来执行具体的转换逻辑
3. 必要时添加辅助方法
4. 需要处理不属于目标节点类型的情况，特别是root节点和child节点

【转换要求】
1. 使用tree-sitter-bash的Python API
2. 实现从POSIX Shell到{target_shell}的语法转换
3. 专注于{syntax_feature}特性的转换
4. 确保与其他Mutator可以通过责任链模式串联

请基于模板生成对应的{syntax_feature}2{target_shell}Mutator类实现代码。