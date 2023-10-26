import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

class Tarefa {
    public int id;
    public long tempoNecessarioResolucao;
    public List<Integer> dependenciasTarefas;

    public Tarefa(String dadosTarefa) {
        String[] entrada = dadosTarefa.split("\\s+");

        this.id = Integer.parseInt(entrada[0]);
        this.tempoNecessarioResolucao = Long.parseLong(entrada[1]);
        this.dependenciasTarefas = new ArrayList<>();

        for (int i = 2; i < entrada.length; i++) {
            this.dependenciasTarefas.add(Integer.parseInt(entrada[i]));
        }
    }
}

class Trabalhador implements Runnable {
    private List<Tarefa> tarefas;
    private List<Tarefa> tarefasConcluidas;

    public Trabalhador(List<Tarefa> tarefas, List<Tarefa> tarefasConcluidas) {
        this.tarefas = tarefas;
        this.tarefasConcluidas = tarefasConcluidas;
    }

    @Override
    public void run() {
        while (true) {
            Tarefa tarefaAtual = null;

            synchronized (tarefas) {
                for (Tarefa t : tarefas) {
                    if (todasDependenciasConcluidas(t)) {
                        tarefaAtual = t;
                        tarefas.remove(t);
                        break;
                    }
                }
            }

            if (tarefaAtual != null) {
                try {
                    Thread.sleep(tarefaAtual.tempoNecessarioResolucao);
                    System.out.println("tarefa " + tarefaAtual.id + " feita");
                    synchronized (tarefasConcluidas) {
                        tarefasConcluidas.add(tarefaAtual);
                    }
                    // Atualize as dependências de todas as tarefas restantes
                    synchronized (tarefas) {
                        for (Tarefa t : tarefas) {
                            t.dependenciasTarefas.remove((Integer) tarefaAtual.id);
                        }
                    }
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                }
            } else {
                break;
            }
        }
    }

    private boolean todasDependenciasConcluidas(Tarefa tarefa) {
        synchronized (tarefasConcluidas) {
            for (int dependencia : tarefa.dependenciasTarefas) {
                boolean encontrada = false;
                for (Tarefa t : tarefasConcluidas) {
                    if (t.id == dependencia) {
                        encontrada = true;
                        break;
                    }
                }
                if (!encontrada) {
                    return false;
                }
            }
        }
        return true;
    }
}

public class Questao2 {

    public static void main(String[] args) {
        int numeroOperarios = 0;
        int numeroTarefas = 0;
        try (Scanner scanner = new Scanner(System.in)) {
            System.out.print("Digite a quantidade de abelhas operárias disponíveis: ");
            numeroOperarios = scanner.nextInt();

            System.out.print("Digite a quantidade de tarefas para realizar: ");
            numeroTarefas = scanner.nextInt();

            List<Tarefa> tarefas = new ArrayList<>();
            List<Tarefa> tarefasConcluidas = new ArrayList<>();
            String dadosTarefa;

            System.out.println("Digite as propriedades das tarefas no formato: id | tempo de resolucao | ids das tarefas que essa tarefa tem dependencias");
            scanner.nextLine();

            for (int i = 0; i < numeroTarefas; i++) {
                dadosTarefa = scanner.nextLine();
                tarefas.add(new Tarefa(dadosTarefa));
            }

            ExecutorService executorService = Executors.newFixedThreadPool(numeroOperarios);

            for (int i = 0; i < numeroOperarios; i++) {
                executorService.submit(new Trabalhador(tarefas, tarefasConcluidas));
            }

            executorService.shutdown();

            try {
                executorService.awaitTermination(Long.MAX_VALUE, java.util.concurrent.TimeUnit.NANOSECONDS);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        }
    }
}
