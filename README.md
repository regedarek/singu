singu
=====

Sinatra + Angular Base App Generator

## Development Boostrap

To create Sinatra + Angular App:

Install **singu** gem with provides base app generator

```
gem install singu
```

To create new application in current directory run

```
singu app_name
```

To start sinatra app server run

```
rackup
```

Then you can open

```
open http://0.0.0.0:9292
```

## Application Structure

Generator proceeds 
```
Code» singu your_app
      create  your_app
      create  your_app/.gitignore
      create  your_app/Gemfile
      create  your_app/Procfile
      create  your_app/Rakefile
      create  your_app/app.rb
      create  your_app/app/lib/db.rb
      create  your_app/app/models.rb
      create  your_app/app/models/
      create  your_app/app/routes.rb
      create  your_app/app/routes/base.rb
      create  your_app/config.ru
       exist  your_app
      create  your_app/client/Gruntfile.js
      create  your_app/client/app/index.html
      create  your_app/client/package.json
         run  git init . from "./your_app"
Initialized empty Git repository in /Users/rege/Code/your_app/.git/
         run  bundle from "./your_app"
```
