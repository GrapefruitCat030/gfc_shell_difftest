import pytest
from mutators import {feature_name}Mutator

class Test{feature_name}Mutator:
    @pytest.fixture
    def mutator(self):
        return {feature_name}Mutator()
        
    def test_basic_conversion(self, mutator):
        # 基本转换测试
        pass
        
    def test_edge_cases(self, mutator):
        # 边界情况测试
        pass
        
    def test_error_handling(self, mutator):
        # 错误处理测试
        pass