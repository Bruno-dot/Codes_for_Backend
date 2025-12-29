import matplotlib.pyplot as plt


def generate_country_chart(data: dict):
    countries = list(data.keys())
    clicks = list(data.values())

    plt.figure()
    plt.bar(countries, clicks)
    plt.title("Cliques por País")
    plt.xlabel("País")
    plt.ylabel("Quantidade de cliques")
    plt.tight_layout()

    plt.savefig("country_chart.png")
    plt.close()
