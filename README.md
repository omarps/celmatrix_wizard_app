# README

##Wizard App example

###The app covers:

* Data entered is stored in a user model at the end of the wizard.

* Session storage to returning users.

* Includes model validations with form validation feedback.

* Structured in incremental object (Step{n}) to avoid loading the entire User model.

* Develop entirely in the cloud (C9.io).

* Includes a link to a deployment in Heroku.

###Technologies:

* PostgreSQL connector.

* HAML templating system.

* Bootstrap for styling view components.

* JQuery for user interactions.

* SimpleForm to generate form objects.

* RSpec for the following types of tests: models, controllers, and features.

* FactoryGirl to create mock objects.

###To run the application: (tested in C9 IDE)

* Positioning in the project folder:
```
$ cd ~/workspace/wizard_app
```

* Ensure the PostgreSQL instance is running:
```
sudo service postgresql start
```

* Ensure the libraries is up-to-date:
```
bundle install --without production
```

* Restart the DB objects:
```
rails db:drop db:create db:migrate
```

* Start the rails server with the correct binding:
```
rails s -b 0.0.0.0 -p 8080
```

* Open the project preview link: https://wizard-app-omarps.c9users.io/

###Project links:

* C9 IDE workspace: https://ide.c9.io/omarps/wizard-app

* Github repository: https://github.com/omarps/wizard_app

* Heroku deployment: https://omarps-wizard-app.herokuapp.com/
