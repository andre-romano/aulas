
import math


class Function:
    def __init__(self, name):
        self.name = name

    def evaluate(self, x):
        raise NotImplementedError(
            "This function must be implemented in subclass")


class LinearFunction(Function):
    def __init__(self, a, b):
        self.a = a
        self.b = b

    def evaluate(self, x):
        return a * x + b


class QuadraticFunction(Function):
    def __init__(self, a, b, c):
        super().__init__("Sine")
        self.a = a
        self.b = b
        self.c = c

    def evaluate(self):
        return self.a * x**2 + self.b * x + self.c


class SineFunction(Function):
    def __init__(self):
        super().__init__("Sine")

    def evaluate(self, x):
        return math.sin(x)


class FunctionCalculator:
    def __init__(self):
        self.functions = []

    def add_function(self, f):
        self.functions.append(f)

    def calculate_all(self, x):
        result = {}
        for f in self.functions:
            try:
                result[f.name] = f.evaluate()
            except Exception as e:
                result[f.name] = f"Error: {e}"
        return result


# Código de execução (testes manuais)
if __name__ == "__main__":
    calc = FunctionCalculator()
    calc.add_function(LinearFunction(2, 3))
    calc.add_function(QuadraticFunction(1, -2, 1))
    calc.add_function(SineFunction())

    results = calc.calculate_all(2)
    print(results)
