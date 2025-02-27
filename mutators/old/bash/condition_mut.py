from mutators.abstract_mut import Mutator

class BashConditionMutator(Mutator):
    def transform(self, script: str) -> str:
        script = script.replace("if [", "if [[") \
                       .replace("]; then", " ]]; then")
        return self._pass_to_next(script)