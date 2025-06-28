import subprocess


def somar(a, b):
    return a + b


def subtrair(a, b):
    return a - b


def multiplicar(a, b):
    return a * b


def dividir(a, b):
    if b == 0:
        raise ValueError("Divisão por zero não é permitida")
    return a / b


def executar_comando(comando):
    # Esta função é insegura e propositalmente vulnerável para ser detectada pelo Bandit
    return subprocess.call(comando, shell=True)
