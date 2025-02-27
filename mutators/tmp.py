from typing import Optional, List, Callable, Dict
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
        转换入口方法，采用深度优先遍历
        Args:
            node: tree-sitter语法树节点
            context: 转换上下文信息
        Returns:
            转换后的代码字符串
        """
        # 初始化上下文
        if context is None:
            context = {}
            
        # 如果当前节点可以处理，则进行转换
        if self.can_handle(node):
            # 如果是复合节点，可能需要先递归处理子节点
            if self.should_process_children_first(node):
                # 处理子节点并将结果存入上下文
                context['children_results'] = self.process_children(node, context)
            
            # 执行当前节点的转换
            result = self.handle_transform(node, context)
            return result
            
        # 如果当前mutator不能处理，则传递给下一个mutator
        elif self.next_mutator:
            return self.next_mutator.transform(node, context)
            
        # 如果没有任何mutator可以处理，采用默认处理方式
        else:
            # 对于复合节点，需要递归处理子节点
            if node.child_count > 0:
                children_results = self.process_children(node, context)
                return self.combine_children_results(node, children_results)
            # 对于叶子节点，直接返回原文本
            return self.default_transform(node)
    
    def should_process_children_first(self, node: Node) -> bool:
        """
        判断是否应该先处理子节点
        默认对于复合语句(如for、if等)应先处理子节点
        """
        # 可以根据节点类型决定是否先处理子节点
        compound_types = ['for_statement', 'if_statement', 'while_statement',
                          'case_statement', 'function_definition']
        return node.type in compound_types
    
    def process_children(self, node: Node, context: dict) -> List[str]:
        """处理所有子节点并返回结果列表"""
        results = []
        for child in node.children:
            # 每个子节点都从当前mutator链的头部开始处理
            if self.next_mutator:
                # 创建子上下文，包含父节点信息
                child_context = context.copy()
                child_context['parent_node'] = node
                results.append(self.transform(child, child_context))
            else:
                results.append(self.default_transform(child))
        return results
    
    def combine_children_results(self, node: Node, children_results: List[str]) -> str:
        """组合子节点结果"""
        # 默认实现是简单连接所有子节点结果
        return ''.join(children_results)
    
    def can_handle(self, node: Node) -> bool:
        """判断是否可以处理该节点"""
        raise NotImplementedError
    
    def handle_transform(self, node: Node, context: dict) -> str:
        """具体的转换实现"""
        raise NotImplementedError
    
    def default_transform(self, node: Node) -> str:
        """默认的转换行为：保持原样"""
        return node.text.decode('utf-8')

class ShellMutatorChain:
    """Shell转换器链管理类"""
    
    def __init__(self):
        self.first_mutator = None
        self.last_mutator = None
    
    def add_mutator(self, mutator: BaseMutator) -> 'ShellMutatorChain':
        """添加mutator到链中"""
        if not self.first_mutator:
            self.first_mutator = mutator
            self.last_mutator = mutator
        else:
            self.last_mutator.set_next(mutator)
            self.last_mutator = mutator
        return self
    
    def transform_code(self, code: str) -> str:
        """转换完整代码"""
        from tree_sitter import Parser, Language
        
        # 初始化parser
        parser = Parser()
        # 此处需要加载预先构建的语言库
        LANGUAGE = Language('/path/to/build/languages.so', 'bash')
        parser.set_language(LANGUAGE)
        
        # 解析代码为AST
        tree = parser.parse(bytes(code, 'utf8'))
        
        # 从头开始转换
        if self.first_mutator:
            return self.first_mutator.transform(tree.root_node, {})
        return code

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
        # 如果需要使用已处理的子节点结果
        if 'children_results' in context:
            children = context['children_results']
            # 使用子节点结果进行组装
            
        # 也可以选择手动处理特定子节点
        # 例如，for循环可能需要单独处理variable、values和body部分
        
        # 转换逻辑实现
        pass