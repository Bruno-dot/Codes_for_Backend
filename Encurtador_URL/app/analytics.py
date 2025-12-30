import matplotlib.pyplot as plt
from io import BytesIO


def generate_country_chart(data: dict) -> BytesIO:
    """
    Gera um gráfico de cliques por país em memória e retorna como BytesIO.
    """
    countries = list(data.keys())
    clicks = list(data.values())

    plt.figure(figsize=(8, 5))
    plt.bar(countries, clicks, color="skyblue")
    plt.title("Cliques por País")
    plt.xlabel("País")
    plt.ylabel("Quantidade de cliques")
    plt.tight_layout()

    buf = BytesIO()
    plt.savefig(buf, format="png")
    plt.close()
    buf.seek(0)
    return buf
