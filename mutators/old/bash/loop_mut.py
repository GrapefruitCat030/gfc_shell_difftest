import re
from mutators.abstract_mut import Mutator

class BashLoopMutator(Mutator):
    def transform(self, script: str) -> str:
        def convert_for_loop(match):
            name = match.group(1)
            words = match.group(2) or '"$@"'
            commands = match.group(3)
            return f"for {name} in {words}; do\n{commands}done"

        def convert_while_loop(match):
            condition = match.group(1)
            commands = match.group(2)
            return f"while {condition}; do\n{commands}done"

        def convert_until_loop(match):
            condition = match.group(1)
            commands = match.group(2)
            return f"until {condition}; do\n{commands}done"

        script = re.sub(
            r'for (\w+) in(.*?)do\n(.*?)done',
            convert_for_loop,
            script,
            flags=re.DOTALL
        )

        script = re.sub(
            r'while (.*?)do\n(.*?)done',
            convert_while_loop,
            script,
            flags=re.DOTALL
        )

        script = re.sub(
            r'until (.*?)do\n(.*?)done',
            convert_until_loop,
            script,
            flags=re.DOTALL
        )

        return self._pass_to_next(script)