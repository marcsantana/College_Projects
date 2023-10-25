import java.util.Comparator;
import java.util.PriorityQueue;
import java.util.Random;
import java.util.Scanner;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

class AviaoComparator implements Comparator<Aviao> {
    @Override
    public int compare(Aviao aviao1, Aviao aviao2) {
        return Long.compare(aviao1.horaPrevista, aviao2.horaPrevista);
    }
}

class Aeroporto {
    private int pistas;
    private PriorityQueue<Aviao> filaAvioes;
    private long tempoPistaOcupada = 500;
    private Lock lock = new ReentrantLock();
    private Condition isPistaLivre = lock.newCondition();

    public Aeroporto(int pistas, int quantidadeAvioesTotal) {
        this.pistas = pistas;
        this.filaAvioes = new PriorityQueue<>(quantidadeAvioesTotal, new AviaoComparator());
    }

    public void programaVoo(Aviao aviao) {
        lock.lock();
        filaAvioes.add(aviao);
        lock.unlock();
    }

    public void acessoPista() {
        try {
            lock.lock();

            while (pistas == 0) {
                try {
                    isPistaLivre.await();
                } catch (InterruptedException e) {}
            }

            pistas--;
            Aviao proximoAviao = filaAvioes.remove();
            if (proximoAviao != null) {
                proximoAviao.executaVooAviao(System.currentTimeMillis());

                Thread.sleep(tempoPistaOcupada);

                pistas++;
                isPistaLivre.signalAll();
            }
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        } finally {
            lock.unlock();
        }
    }
}

class Aviao implements Runnable {
    private Aeroporto aeroporto;
    public int id;
    public long horaPrevista;
    public long horaExecutada;
    public Boolean isDecolou;
    public String tipoVoo;
    public String horaPrevistaFormatada;
    public String horaExecutadaFormatada;

    public Aviao(Aeroporto aeroporto, int id, long horaPrevista, boolean isDecolou) {
        this.aeroporto = aeroporto;
        this.id = id;
        this.horaPrevista = horaPrevista;
        this.isDecolou = isDecolou;
        this.tipoVoo = isDecolou ? "Decolagem" : "Aterrissagem";
        this.horaPrevistaFormatada = String.format("%1$tH:%1$tM:%1$tS", this.horaPrevista);
    }

    public void executaVooAviao(long horaExecutada) {
        this.horaExecutada = horaExecutada;
        this.horaExecutadaFormatada = String.format("%1$tH:%1$tM:%1$tS", this.horaExecutada);

        long atrasoEmMilissegundos = this.horaExecutada - this.horaPrevista;
        String atrasoFormatado = String.format("%d:%02d:%02d",
                (atrasoEmMilissegundos / 3600000),
                (atrasoEmMilissegundos / 60000) % 60,
                (atrasoEmMilissegundos / 1000) % 60);

        System.out.printf("%s do Avião id %d registrada!%n", this.tipoVoo, this.id);
        System.out.printf("Horário esperado de saída: %s%n", this.horaPrevistaFormatada);
        System.out.printf("Horário real de saída: %s%n", this.horaExecutadaFormatada);
        System.out.println("Atraso: " + atrasoFormatado);
    }

    @Override
    public void run() {
        try {
            aeroporto.programaVoo(this);

            long horaAtual = System.currentTimeMillis();
            if (this.horaPrevista > horaAtual) {
                Thread.sleep(this.horaPrevista - horaAtual);
            }

            aeroporto.acessoPista();
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }
}

public class Questao1 {
    public static void main(String[] args) {
        try (Scanner scanner = new Scanner(System.in)) {
            long inicioSistemaVoo = System.currentTimeMillis();

            System.out.print("Digite a quantidade de aviões esperando para sair: ");
            int quantidadeAvioesEsperandoSair = scanner.nextInt();

            System.out.print("Digite a quantidade de aviões que irão chegar: ");
            int quantidadeAvioesVaoChegar = scanner.nextInt();

            System.out.print("Digite o número de pistas disponíveis no aeroporto: ");
            int numeroPistasDisponiveis = scanner.nextInt();

            int quantidadeAvioesTotal = quantidadeAvioesEsperandoSair + quantidadeAvioesVaoChegar;

            Aeroporto aeroporto = new Aeroporto(numeroPistasDisponiveis, quantidadeAvioesTotal);
            Thread[] threadsAvioes = new Thread[quantidadeAvioesTotal];

            Random random = new Random();

            // Criando os objetos avião que já estão esperando para sair
            for (int i = 0; i < quantidadeAvioesEsperandoSair; i++) {
                long horaPrevistaSaidaAviao = System.currentTimeMillis() + 1000 + (Math.abs(random.nextLong() % 10000));
                threadsAvioes[i] = new Thread(new Aviao(aeroporto, i, horaPrevistaSaidaAviao, true));
            }

            // Criando os objetos avião que vão chegar
            for (int i = 0; i < quantidadeAvioesVaoChegar; i++) {
                long horaPrevistaSaidaAviao = System.currentTimeMillis() + 1000 + (Math.abs(random.nextLong() % 10000));
                threadsAvioes[quantidadeAvioesEsperandoSair + i] = new Thread(new Aviao(aeroporto, quantidadeAvioesEsperandoSair + i + 1, horaPrevistaSaidaAviao, false));
            }

            // Iniciando todas as threads
            for (int i = 0; i < quantidadeAvioesTotal; i++) {
                threadsAvioes[i].start();
            }

            // Aguardando todas as threads terminarem
            for (int i = 0; i < quantidadeAvioesTotal; i++) {
                try {
                    threadsAvioes[i].join();
                } catch (InterruptedException e) {
                    throw new RuntimeException(e);
                }
            }

            long fimSistemaVoo = System.currentTimeMillis();
            long tempoExecucao = fimSistemaVoo - inicioSistemaVoo;
            String tempoFormatado = String.format("%d:%02d:%02d",
                    (tempoExecucao / 3600000),
                    (tempoExecucao / 60000) % 60,
                    (tempoExecucao / 1000) % 60);
            System.out.println("Tempo de execução: " + tempoFormatado);
        }
    }
}