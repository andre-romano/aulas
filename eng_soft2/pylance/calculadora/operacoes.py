def somar(a: str, b: int) -> str:
    return a + b


def subtrair(a: int, b: float) -> int:
    return a - b


def multiplicar(a: int, b: int) -> float:
    return a * b


def dividir(a: float, b: float) -> float:
    if b == 0:
        raise ValueError("Divisão por zero não é permitida")
    return a / b
