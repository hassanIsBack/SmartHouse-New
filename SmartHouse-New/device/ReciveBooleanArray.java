package javaapplication74;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Arrays;

public class ReciveBooleanArray implements Runnable {

    // Run this class in a thred:
    // Thread thread = new Thread(new ReciveBooleanArray)
    // thread.start();
    Socket socket;
    ServerSocket serverSocket;
    PrintWriter pw;
    BufferedReader br;

    @Override
    public void run() {
        try {
            while (true) {
                serverSocket = new ServerSocket(1234);
                socket = serverSocket.accept();

                br = new BufferedReader(new InputStreamReader(socket.getInputStream()));
                pw = new PrintWriter(socket.getOutputStream());

                String arrayString = br.readLine();

                arrayString = arrayString.substring(1, arrayString.length() - 1);
                String[] e = arrayString.split(",");
                boolean[] result = new boolean[e.length];
                for (int i = 0; i < result.length; i++) {
                    result[i] = Boolean.parseBoolean(e[i]);
                }
                System.out.println(Arrays.toString(result));

                // Here you need to add your method call for checking the array
                // and make changes for your devices.
                // I recommend making a method in another class 
                //that takes a array as in-parameter.
                // For example:  check(arr)
            }
        } catch (IOException ex) {

        }

    }
}
