#!/bin/bash
javac mod1/module-info.java p1/api/Greeter1.java p1/internal/Utils.java
javac mod2/module-info.java p2/api/Greeter2.java p2/internal/Utils.java

jar --create --file greeter2.jar -C mod2 .
jar --create --file greeter1.jar -C mod1 .

javac -cp greeter1.jar:greeter2.jar client/ccc/Client.java

jar --create --file client.jar --main-class ccc.Client -C client .

java -p greeter1.jar:greeter2.jar --add-modules mod1 --add-modules mod2  -jar client.jar