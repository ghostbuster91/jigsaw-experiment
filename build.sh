#!/bin/bash
javac mod1/module-info.java mod1/p1/api/Greeter1.java mod1/internal/Utils.java
javac mod2/module-info.java mod2/p2/api/Greeter2.java mod2/internal/Utils.java

jar --create --file greeter2.jar -C mod2 .
jar --create --file greeter1.jar -C mod1 .

javac -p greeter1.jar:greeter2.jar client/module-info.java  client/ccc/Client.java
jar --create --file client.jar --main-class ccc.Client -C client .

jlink -p greeter1.jar:greeter2.jar:client.jar --add-modules mod1 --add-modules mod2 --add-modules client  --output dist --launcher launch=client
./dist/bin/launch