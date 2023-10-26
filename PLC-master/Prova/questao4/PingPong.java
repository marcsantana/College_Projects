import java.util.Scanner;

public class PingPong {
    private static Object lock = new Object();
    private static int totalMessages;
    private static boolean pingTurn = true;

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Digite a quantidade de mensagens que deseja enviar: ");
        totalMessages = scanner.nextInt();
        scanner.close();

        Thread pingThread = new Thread(new Ping());
        Thread pongThread = new Thread(new Pong());

        pingThread.start();
        pongThread.start();
    }

    static class Ping implements Runnable {
        @Override
        public void run() {
            synchronized (lock) {
                try {
                    for (int i = 1; i <= totalMessages; i++) {
                        while (!pingTurn) {
                            lock.wait();
                        }
                        System.out.println("Ping: enviei a mensagem " + i);
                        pingTurn = false;
                        lock.notify();
                    }
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                }
            }
        }
    }

    static class Pong implements Runnable {
        @Override
        public void run() {
            synchronized (lock) {
                try {
                    for (int i = 1; i <= totalMessages; i++) {
                        while (pingTurn) {
                            lock.wait();
                        }
                        System.out.println("Pong: recebi a mensagem " + i);
                        pingTurn = true;
                        lock.notify();
                    }
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                }
            }
        }
    }
}
