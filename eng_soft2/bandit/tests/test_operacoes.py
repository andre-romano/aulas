import pytest

# importando as funções da calculadora (somar, subtrair, multiplicar, dividir, executar_comando)
from calculadora import *


def test_somar():
    assert somar(2, 3) == 5


def test_subtrair():
    assert subtrair(5, 2) == 3


def test_multiplicar():
    assert multiplicar(3, 4) == 12


def test_dividir():
    assert dividir(10, 2) == 5


def test_dividir_por_zero():
    with pytest.raises(ValueError):
        dividir(1, 0)
