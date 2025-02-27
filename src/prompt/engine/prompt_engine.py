from pathlib import Path
from typing import List, Dict, Optional

class PromptEngine:
    """Shell转换器的Prompt生成引擎"""
    
    def __init__(self):
        self.project_root = Path("/root/project/gfc_shell_difftest")
        
        # 语料库路径
        self.corpus_root = self.project_root / "corpus"
        self.shell_docs = self.corpus_root / "shell_docs"
        self.examples = self.corpus_root / "examples"
        
        # prompt模板路径
        self.template_dir = self.project_root / "src/prompt/prompt_tpl"
        self.code_tpl_dir = self.project_root / "src/prompt/code_tpl"
        
        # 加载模板
        self._load_templates()
        self._load_code_templates()

    def _load_templates(self):
        """加载prompt模板文件"""
        self.mutator_prompt_template = (self.template_dir / "mutator_prompt.tpl").read_text()
        self.test_prompt_template = (self.template_dir / "mutatortest_prompt.tpl").read_text()

    def _load_code_templates(self):
        """加载代码模板文件"""
        self.mutator_code_template = (self.code_tpl_dir / "mutator.py.tpl").read_text()
        self.test_code_template = (self.code_tpl_dir / "mutatortest.py.tpl").read_text()

    def _load_shell_doc(self, shell: str, feature: str) -> str:
        """加载shell语法文档"""
        doc_path = self.shell_docs / "grammar" / shell / f"{feature}.md"
        return doc_path.read_text()

    def _load_examples(self, shell: str, feature: str) -> str:
        """加载示例代码"""
        example_path = self.examples / "grammar" / shell / f"{feature}_examples.sh"
        return example_path.read_text()

    def generate_mutator_prompt(self,
                              syntax_feature: str,
                              target_shell: str) -> str:
        """
        生成用于创建mutator的prompt
        Args:
            syntax_feature: 语法特性名称 (如 'quoting', 'parameters' 等)
            target_shell: 目标shell名称 (如 'fish', 'bash' 等)
        """
        # 加载相关文档和示例
        posix_doc = self._load_shell_doc("posix", syntax_feature)
        target_doc = self._load_shell_doc(target_shell, syntax_feature)
        posix_examples = self._load_examples("posix", syntax_feature)
        target_examples = self._load_examples(target_shell, syntax_feature)

        # 生成prompt
        return self.mutator_prompt_template.format(
            syntax_feature=syntax_feature,
            posix_doc=posix_doc,
            target_shell_doc=target_doc,
            posix_examples=posix_examples,
            target_examples=target_examples,
            target_shell=target_shell,
            mutator_code_template=self.mutator_code_template
        )

    def generate_test_prompt(self,
                           mutator_code: str,
                           feature_name: str,
                           test_cases: List[Dict]) -> str:
        """生成用于创建测试用例的prompt"""
        test_cases_str = "\n".join(
            f"用例 {i+1}:\n输入: {case['input']}\n预期输出: {case['expected']}"
            for i, case in enumerate(test_cases)
        )
        
        return self.test_prompt_template.format(
            mutator_code=mutator_code,
            test_class_template=self.test_code_template,
            test_cases=test_cases_str,
            feature_name=feature_name
        )