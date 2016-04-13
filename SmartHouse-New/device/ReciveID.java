package javaapplication74;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;

public class ReciveID implements Runnable {
    // Run this class in a thred:
    // Thread thread = new Thread(new ReciveID())
    // thread.start();

    Socket socket;
    ServerSocket serverSocket;
    PrintWriter pw;
    BufferedReader br;
    String numberString;

    @Override
    public void run() {
        try {
            while (true) {
                serverSocket = new ServerSocket(1234);
                socket = serverSocket.accept();

                br = new BufferedReader(new InputStreamReader(socket.getInputStream()));
                pw = new PrintWriter(socket.getOutputStream());

                numberString = br.readLine();

                int IdOfDevice = Integer.valueOf(numberString);

            // Here you need to add your method call for changing the device
                // with the matching ID.
                // I recommend making a method in another class 
                // that takes a integer as in-parameter.
                // For example:  check(IdOfDevice)
            }
        } catch (IOException ex) {

        }
    }
}
