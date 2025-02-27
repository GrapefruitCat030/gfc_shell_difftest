from typing import Optional, Any
from tree_sitter import Node, Tree

class BaseMutator:
    """基础Mutator类，所有特定语法mutator都继承自此类"""
    
    def __init__(self):
        self.next_mutator: Optional[BaseMutator] = None
    
    def set_next(self, mutator: 'BaseMutator') -> 'BaseMutator':
        """设置责任链中的下一个mutator"""
        self.next_mutator = mutator
        return mutator
    
    def transform(self, node: Node, context: dict = None) -> str:
        """
        转换入口方法
        Args:
            node: tree-sitter语法树节点
            context: 转换上下文信息
        Returns:
            转换后的代码字符串
        """
        if self.can_handle(node):
            return self.handle_transform(node, context or {})
        elif self.next_mutator:
            return self.next_mutator.transform(node, context)
        return self.default_transform(node)
    
    def can_handle(self, node: Node) -> bool:
        """判断是否可以处理该节点"""
        raise NotImplementedError
    
    def handle_transform(self, node: Node, context: dict) -> str:
        """具体的转换实现"""
        raise NotImplementedError
    
    def default_transform(self, node: Node) -> str:
        """默认的转换行为：保持原样"""
        return node.text.decode('utf-8')
    
    def visit_children(self, node: Node, context: dict) -> list:
        """访问并转换所有子节点"""
        results = []
        for child in node.children:
            results.append(self.transform(child, context))
        return results

class Mutator(BaseMutator):
    """特定语法特性的Mutator模板"""
    
    def can_handle(self, node: Node) -> bool:
        """
        判断是否为目标语法节点
        示例: return node.type in ['for_statement', 'while_statement']
        """
        return False
    
    def handle_transform(self, node: Node, context: dict) -> str:
        """
        转换实现
        1. 分析节点结构
        2. 提取必要信息
        3. 按目标shell语法重组
        """
        # 转换逻辑实现
        pass
    
    def _helper_method(self):
        """辅助方法"""
        pass