export INITIAL_ADMIN_USER=
export INITIAL_ADMIN_PASSWORD=
docker run -e INITIAL_ADMIN_USER=$INITIAL_ADMIN_USER -e INITIAL_ADMIN_PASSWORD=$INITIAL_ADMIN_PASSWORD -e JAVA_OPTS="-Djenkins.install.runSetupWizard=false" -p 8080:8080 -p 5000:5000 --name jenkins jenkins:latest 
