from typing import List
from mutators.abstract_mut import BaseMutator

class MutatorChain:
    def __init__(self):
        self.head_mutator = None
        self.tail_mutator = None
        
    def add_mutator(self, mutator: BaseMutator):
        if not self.head_mutator:
            self.head_mutator = mutator
            self.tail_mutator = mutator
        else:
            self.tail_mutator.set_next(mutator)
            self.tail_mutator = mutator
        return self
        
    def transform_code(self, code: str, language="bash"):
        """转换完整代码"""
        import tree_sitter
        parser = tree_sitter.Parser()
        ast = parser.parse(bytes(code, "utf8"))
        result = self.head_mutator.transform(ast.root_node, {})
        return result
    
    def create_multi_stage_chain(self, mutator_groups: list):
        """创建多阶段转换链(适用于需要重新解析AST的场景)"""
        # 实现多阶段转换，每阶段都重新解析AST
        pass
