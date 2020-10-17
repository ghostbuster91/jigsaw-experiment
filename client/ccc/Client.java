package ccc;

import p2.api.Greeter2;
import p1.api.Greeter1;

public class Client {
    public static void main(String[] args) {
        Greeter1.greet();
        Greeter2.greet();
    }
}