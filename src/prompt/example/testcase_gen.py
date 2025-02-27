from pathlib import Path
from jinja2 import Template
from typing import List, Dict

class TestCasePromptGenerator:
    def __init__(self):
        self.test_class_template = Path("/root/project/gfc_shell_difftest/prompt/code_tpl/test_class.py.tpl").read_text()
        self.template_dir = Path("/root/project/gfc_shell_difftest/prompt/templates")
        self.template = self._load_template("testcase_prompt.tpl")

    def _load_template(self, template_name: str) -> Template:
        """加载测试用例模板"""
        template_path = self.template_dir / template_name
        return Template(template_path.read_text())
    
    def generate_test_prompt(self, 
                           mutator_code: str,
                           feature_name: str,
                           test_cases: List[Dict]) -> str:
        """生成测试用例prompt"""
        return self.template.render(
            mutator_code=mutator_code,
            test_class_template=self.test_class_template,
            test_cases=test_cases
        )