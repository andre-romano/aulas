"""
Módulo de operações matemáticas básicas.
"""

def somar(a: float, b: float) -> float:
    """
    Soma dois números.

    :param a: Primeiro número.
    :param b: Segundo número.
    :return: Resultado da soma.
    """
    return a + b

def subtrair(a: float, b: float) -> float:
    """
    Subtrai o segundo número do primeiro.

    :param a: Primeiro número.
    :param b: Segundo número.
    :return: Resultado da subtração.
    """
    return a - b

def multiplicar(a: float, b: float) -> float:
    """
    Multiplica dois números.

    :param a: Primeiro número.
    :param b: Segundo número.
    :return: Resultado da multiplicação.
    """
    return a * b

def dividir(a: float, b: float) -> float:
    """
    Divide o primeiro número pelo segundo.

    :param a: Numerador.
    :param b: Denominador.
    :return: Resultado da divisão.
    :raises ValueError: Se b for igual a zero.
    """
    if b == 0:
        raise ValueError("Divisão por zero não é permitida")
    return a / b
