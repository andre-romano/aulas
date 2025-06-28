import pytest
from calculadora import *


def test_somar():
    assert somar(2, 3) == 5


def test_subtrair():
    assert subtrair(5, 2) == 3


def test_multiplicar():
    assert multiplicar(3, 4) == 12


def test_dividir():
    assert dividir(10, 2) == 5

# TODO: DESCOMENTE O CÓDIGO ABAIXO PARA TESTAR A DIVISÃO POR ZERO (e veja a diferença
# no relatório de cobertura do coverage.py)

# def test_dividir_por_zero():
#     with pytest.raises(ValueError, match="Divisão por zero não é permitida"):
#         dividir(10, 0)

# TODO: preencha com os testes que faltam para obter cobertura de 100% do código
