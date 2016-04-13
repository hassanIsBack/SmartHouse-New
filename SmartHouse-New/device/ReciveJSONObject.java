package javaapplication74;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class ReciveJSONObject implements Runnable {
    // Run this class in a thred:
    // Thread thread = new Thread(new ReciveJSONObject())
    // thread.start();
    Socket socket;
    ServerSocket serverSocket;
    PrintWriter pw;
    BufferedReader br;
    String jsonString;

    @Override
    public void run() {
        try {
            while (true) {
                serverSocket = new ServerSocket(1234);
                socket = serverSocket.accept();

                br = new BufferedReader(new InputStreamReader(socket.getInputStream()));
                pw = new PrintWriter(socket.getOutputStream());

                jsonString = br.readLine();
                JSONParser parser = new JSONParser();
                JSONArray arr = (JSONArray) parser.parse(jsonString);

                JSONObject obj = (JSONObject) arr.get(0);

            // Here you need to add your method call for checking the JSONObject
            // and make changes for your devices.
            // I recommend making a method in another class 
            //that takes a JSONObject as in-parameter.
            // For example:  check(obj)
            }
        } catch (IOException ex) {

        } catch (ParseException ex) {

        }
    }

}
