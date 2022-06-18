#!/bin/sh
mvn clean install -DskipTests
mvn -B test -Dmaven.test.failure.ignore=true
mvn surefire-report:report-only
# site暂时不可用
# mvn site -DgenerateReports=false
