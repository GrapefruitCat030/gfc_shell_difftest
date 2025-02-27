from mutators.abstract_mut import BaseMutator
from tree_sitter import Node

class ForLoop2FishMutator(BaseMutator):
    """Converts POSIX shell for loops to fish syntax"""
    
    def can_handle(self, node: Node) -> bool:
        """Handle for_statement nodes"""
        return node.type == 'for_statement'
    
    def handle_transform(self, node: Node, context: dict) -> str:
        # Extract variable name
        variable = next(child for child in node.children if child.type == 'variable_name').text.decode()
        
        # Find in/do positions
        in_nodes = [child for child in node.children if child.type == 'in']
        do_index = next(i for i, child in enumerate(node.children) if child.type == 'do')
        
        # Process items list
        items = []
        if in_nodes:
            in_index = node.children.index(in_nodes[0])
            # Collect items between in and do
            items = [
                self.transform(child, context) 
                for child in node.children[in_index+1:do_index]
            ]
        else:  # Handle omitted 'in' case
            items = ['$argv']
        
        # Extract loop body
        body_node = next(child for child in node.children if child.type == 'compound_list')
        body_code = self.transform(body_node, context)
        
        # Construct fish syntax
        items_str = ' '.join(items)
        return f"for {variable} in {items_str}\n{body_code}\nend"

    def _process_body(self, body_node: Node, context: dict) -> str:
        """Process loop body with proper indentation"""
        original = self.transform(body_node, context)
        # Add fish-style indentation (4 spaces)
        return '\n'.join([f'    {line}' if line.strip() else line 
                        for line in original.split('\n')])

    def handle_transform(self, node: Node, context: dict) -> str:
        # Extract variable name
        variable = next(child for child in node.children if child.type == 'variable_name').text.decode()
        
        # Process items list
        items = self._get_item_list(node, context)
        
        # Process loop body
        body_node = next(child for child in node.children if child.type == 'compound_list')
        body_code = self._process_body(body_node, context)
        
        # Construct fish syntax
        return f"for {variable} in {items}\n{body_code}\nend"

    def _get_item_list(self, node: Node, context: dict) -> str:
        """Extract and process item list"""
        try:
            in_node = next(child for child in node.children if child.type == 'in')
            do_index = node.children.index(next(child for child in node.children if child.type == 'do'))
            in_index = node.children.index(in_node)
            
            return ' '.join(
                self.transform(child, context)
                for child in node.children[in_index+1:do_index]
            )
        except StopIteration:
            # No in clause found, use $argv
            return '$argv'