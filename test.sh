#!/bin/sh
mvn install:install-file -Dfile=outjar/ojdbc6/ojdbc6-11.2.0.4-oracle.jar -DpomFile=outjar/ojdbc6/ojdbc6-11.2.0.4.pom
mvn -B test -Dmaven.test.failure.ignore=true
mvn surefire-report:report-only
# site暂时不可用
# mvn site -DgenerateReports=false
