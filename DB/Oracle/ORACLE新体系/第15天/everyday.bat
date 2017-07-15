set PATH=%PATH%;c:\jdk\bin
set CLASSPATH=%CLASSPATH%;f:\msbase.jar;f:\mssqlserver.jar;f:\msutil.jar;.
javac GetAuthors.java
javac GenHtml.java
java GetAuthors
java GenHtml

