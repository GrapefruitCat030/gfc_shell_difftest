from mutators.abstract_mut import BaseMutator
import re

class UntilLoop2FishMutator(BaseMutator):
    """
    Mutator that converts POSIX until loops to Fish shell equivalent.
    Example:
    POSIX:
        until [ $i -le 0 ]
        do
            echo "Countdown: $i"
            i=$((i - 1))
        done
    
    Fish:
        while not test $i -le 0
            echo "Countdown: $i"
            set i (math $i - 1)
        end
    """
    
    def can_handle(self, node):
        """Check if the node is an until loop statement."""
        # In tree-sitter-bash, until loops are parsed as while_statement nodes
        # with an until_clause as the condition
        return (node.type == "while_statement" and 
                node.children and 
                node.children[0].type == "until")

    def _transform_condition(self, condition_text):
        """Transform the condition for fish shell with negation."""
        """TODO: leave the condition node to next mutator"""
        # Replace [ ... ] with test ... for fish
        condition_text = re.sub(r'\[\s*(.*?)\s*\]', r'test \1', condition_text)
        
        # Handle other condition variations
        condition_text = re.sub(r'\(\(\s*(.*?)\s*\)\)', r'test \1', condition_text)
        
        # Return the negated condition for fish's while loop
        return f"not {condition_text}"
    
    def handle_transform(self, node, source_code):
        """Transform an until loop to fish equivalent with while not."""
        
        condition_node = node.children[1]
        body_node = None
        for _, child in enumerate(node.children):
            if child.type == "do_group":
                body_node = child

        # Get the condition from the until clause
        if not condition_node or not body_node:
            return None
        
        # Extract the condition text
        condition_text = source_code[condition_node.start_byte:condition_node.end_byte]
        transformed_condition = self.transform(condition_node, condition_text) # next mutator to handle condition
        # transformed_condition = self._transform_condition(condition_text)

        # Find the body and transform it separately

        body_start = body_node.start_byte
        body_end = body_node.end_byte
        if body_start is None or body_end is None:
            return None
        
        # Extract the body text
        body_text = source_code[body_start:body_end]
        # Transform the body: replace 'do' with nothing and 'done' with 'end'
        body_text = re.sub(r'^\s*do\s*\n', '', body_text)
        body_text = re.sub(r'\s*done\s*$', '\nend', body_text)
        
        # # Replace variable assignments: var=value -> set var value
        # body_text = re.sub(r'(\w+)=([^;]+)', r'set \1 \2', body_text)
        
        # # Replace arithmetic expressions: $((expr)) -> (math expr)
        # body_text = re.sub(r'\$\(\((.+?)\)\)', r'(math \1)', body_text)
        
        # Construct the new while loop with the negated condition
        fish_code = f"while not {transformed_condition}\n{body_text}"
        return fish_code

    def transform(self, node, source_code):
        """Main transformation method."""
        # print("=============\n ", node.text.decode('utf-8'))
        # print("node type: ", node.type)
        # print("node.child_count: ", node.child_count)

        flag = False

        if self.can_handle(node):
            result = self.handle_transform(node, source_code)
            if result:
                return result
        
        # Handle non-matching nodes or transform children
        if node.child_count > 0:
            for i, child in enumerate(node.children):
                transformed_child = self.transform(child, source_code)
                if transformed_child:
                    # Replace the child with the transformed version
                    # This is a simplified representation - actual implementation 
                    # would need to rebuild the source code with the transformation
                    flag = True
                    source_code = source_code.replace(child.text.decode('utf-8'), transformed_child)
        
        if flag:
            return source_code 
        return None