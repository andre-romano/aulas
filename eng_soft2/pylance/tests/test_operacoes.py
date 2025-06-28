
import pytest

from calculadora import *


def test_somar():
    assert somar(2, 3) == 5


def test_subtrair():
    assert subtrair(5, 2) == 3


def test_multiplicar():
    assert multiplicar(3, 4) == 12


def test_dividir():
    assert dividir(10.0, 2.0) == 5.0


def test_dividir_por_zero():
    with pytest.raises(ValueError):
        dividir(10.0, 0.0)
