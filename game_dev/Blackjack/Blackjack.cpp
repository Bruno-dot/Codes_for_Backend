#include <iostream>
#include <array>
#include <cstdlib>
#include <ctime>
#include <string>

using namespace std;

class Cartas
{
public:
    enum Naipe
    {
        COPAS,
        OUROS,
        PAUS,
        ESPADAS
    };
    enum Valor
    {
        AS = 1,
        DOIS = 2,
        TRES = 3,
        QUATRO = 4,
        CINCO = 5,
        SEIS = 6,
        SETE = 7,
        OITO = 8,
        NOVE = 9,
        DEZ = 10,
        VALETE = 11,
        RAINHA = 12,
        REI = 13
    };

    Cartas() : naipe(COPAS), valor(AS) {}
    Cartas(Naipe s, Valor r) : naipe(s), valor(r) {}

    Naipe naipe;
    Valor valor;
};

class Mao
{
public:
    array<Cartas, 11> cartas;
    int total = 0;
};

class Jogador
{
public:
    Mao mao;
};
class Dealer
{
public:
    Mao mao;
};

class Comandos
{
public:
    Cartas puxarcarta()
    {
        return Cartas(Cartas::Naipe(rand() % 4), Cartas::Valor(rand() % 13 + 1));
    }

    void Mensagem(string msg) { cout << msg << endl; }

    void mostrarMao(Mao mao)
    {
        const char *nomesNaipes[] = {"COPAS", "OUROS", "PAUS", "ESPADAS"};
        const char *nomesValores[] = {"", "AS", "DOIS", "TRES", "QUATRO", "CINCO", "SEIS",
                                      "SETE", "OITO", "NOVE", "DEZ", "VALETE", "RAINHA", "REI"};

        for (int i = 0; i < mao.total; i++)
        {
            int v = static_cast<int>(mao.cartas[i].valor);
            int n = static_cast<int>(mao.cartas[i].naipe);
            cout << "  [ " << nomesValores[v] << " de " << nomesNaipes[n] << " ]" << endl;
        }
    }

    int calcularSoma(Mao &mao)
    {
        int soma = 0;
        int contadorAs = 0;
        for (int i = 0; i < mao.total; i++)
        {
            int valorReal = static_cast<int>(mao.cartas[i].valor);
            if (valorReal >= 11 && valorReal <= 13)
                soma += 10;
            else if (valorReal == 1)
            {
                soma += 11;
                contadorAs++;
            }
            else
                soma += valorReal;
        }
        while (soma > 21 && contadorAs > 0)
        {
            soma -= 10;
            contadorAs--;
        }
        return soma;
    }

    int turnoJogador(Jogador &jogador, int pulosRestantes)
    {
        int escolha;
        cout << "\n----------------------------\n";
        Mensagem("SUA MAO ATUAL:");
        mostrarMao(jogador.mao);
        Mensagem("Soma total: " + to_string(calcularSoma(jogador.mao)));
        cout << "----------------------------\n";

        cout << "Escolha sua acao:\n1 - Pedir carta\n";
        if (pulosRestantes > 0)
            cout << "2 - Passar a vez (1 disponivel)\n";
        else
            cout << "X - (Passe de vez ja utilizado)\n";
        cout << "3 - Parar (Encerrar sua mao)\n4 - Desistir\n-> ";

        cin >> escolha;

        switch (escolha)
        {
        case 1:
            if (jogador.mao.total < 11)
            {
                jogador.mao.cartas[jogador.mao.total++] = puxarcarta();
                if (calcularSoma(jogador.mao) > 21)
                    return 0;
            }
            return 5;
        case 2:
            if (pulosRestantes > 0)
                return 3;
            else
            {
                Mensagem("Voce nao pode mais pular a vez!");
                return turnoJogador(jogador, 0);
            }
        case 3:
            return 1;
        case 4:
            return 2;
        default:
            return 5;
        }
    }

    int turnoDealer(Dealer &dealer)
    {
        int soma = calcularSoma(dealer.mao);
        if (soma > 21)
            return 2;
        int ousadia = rand() % 100;

        if ((soma >= 12 && soma <= 14 && ousadia > 93) || (soma >= 15 && soma <= 16 && ousadia > 85))
        {
            cout << "\n[DEALER]: O Dealer sorri e encosta no baralho. Ele parece muito confiante!\n";
            return 1;
        }

        if (soma >= 14 && soma <= 16 && ousadia < 20)
        {
            cout << "\n[DEALER]: O Dealer hesita e decide esperar para ver o que voce fara.\n";
            return 0;
        }

        if (soma >= 17)
        {
            if (soma == 17 && ousadia > 98)
            {
                cout << "\n[DEALER]: O Dealer arrisca tudo e pede mais uma carta!\n";
            }
            else
            {
                cout << "\n[DEALER]: O Dealer atingiu uma soma segura e decidiu parar (Stand).\n";
                return 1;
            }
        }

        if (dealer.mao.total < 11)
        {
            dealer.mao.cartas[dealer.mao.total++] = puxarcarta();
            cout << "\n[DEALER]: O Dealer puxa uma carta da pilha...\n";
            int novaSoma = calcularSoma(dealer.mao);
            if (novaSoma > 21)
            {
                cout << "\n!!! O DEALER ESTOUROU O LIMITE COM " << novaSoma << " PONTOS !!!\n";
                return 2;
            }
            if (novaSoma >= 17)
            {
                cout << "\n[DEALER]: O Dealer encerra suas jogadas por agora.\n";
                return 1;
            }
        }
        return 0;
    }

    void compararMaos(Jogador &jogador, Dealer &dealer)
    {
        int sj = calcularSoma(jogador.mao);
        int sd = calcularSoma(dealer.mao);
        cout << "\n========== REVELACAO ==========\n";
        cout << "JOGADOR (" << sj << " pts):\n";
        mostrarMao(jogador.mao);
        cout << "\nDEALER (" << sd << " pts):\n";
        mostrarMao(dealer.mao);
        cout << "------------------------------\n";
        if (sj > 21)
            Mensagem("DEALER VENCE! (Voce estourou)");
        else if (sd > 21)
            Mensagem("JOGADOR VENCE! (Dealer estourou)");
        else if (sj > sd)
            Mensagem("JOGADOR VENCE!");
        else if (sd > sj)
            Mensagem("DEALER VENCE!");
        else
            Mensagem("EMPATE!");
        cout << "==============================\n";
    }
};

class Partida
{
public:
    Jogador jogador;
    Dealer dealer;
    Comandos comandos;

    Partida()
    {
        jogador.mao.cartas[0] = comandos.puxarcarta();
        jogador.mao.cartas[1] = comandos.puxarcarta();
        jogador.mao.total = 2;
        dealer.mao.cartas[0] = comandos.puxarcarta();
        dealer.mao.cartas[1] = comandos.puxarcarta();
        dealer.mao.total = 2;
    }

    void jogar()
    {
        bool jogadorParouDefinitivo = false;
        bool dealerParouDefinitivo = false;
        int pulosRestantes = 1;

        while (comandos.calcularSoma(jogador.mao) <= 21 && comandos.calcularSoma(dealer.mao) <= 21)
        {
            if (!jogadorParouDefinitivo)
            {
                int acao = comandos.turnoJogador(jogador, pulosRestantes);

                if (acao == 1)
                    jogadorParouDefinitivo = true;
                else if (acao == 0)
                {
                    jogadorParouDefinitivo = true;
                    break;
                }
                else if (acao == 2)
                    return;
                else if (acao == 3)
                {
                    pulosRestantes--;
                    comandos.Mensagem("\n* Voce usou seu unico pulo de vez! *");
                }
            }

            if (!dealerParouDefinitivo)
            {
                int statusD = comandos.turnoDealer(dealer);
                if (statusD == 1 || statusD == 2)
                    dealerParouDefinitivo = true;
            }

            if (jogadorParouDefinitivo && dealerParouDefinitivo)
                break;
        }
        comandos.compararMaos(jogador, dealer);
    }
};

class Game
{
    Comandos comandos;

public:
    void iniciarJogo()
    {
        cout << "=== BEM-VINDO AO 21 ===\n1 - Jogar\n2 - Sair\n-> ";
        int e;
        cin >> e;
        if (e == 1)
        {
            Partida p;
            p.jogar();
            cout << "\n1 - Jogar Novamente\n2 - Sair\n-> ";
            cin >> e;
            if (e == 1)
                iniciarJogo();
        }
    }
};

int main()
{
    srand(time(0));
    Game g;
    g.iniciarJogo();
    return 0;
}