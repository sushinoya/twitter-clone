# Twitter Clone

This is a basic clone of Twitter built using Ruby on Rails. Instead of design, the project focuses more on using a clean and well-tested codebase to implement the fundamental functionalities of any platform such as Twitter.

Screenshots:

<img width="1280" alt="screen shot 2017-08-22 at 10 31 33 pm" src="https://user-images.githubusercontent.com/23443586/29573472-a44c8096-8791-11e7-8c05-bae389e2f9f2.png">

<img width="1280" alt="screen shot 2017-08-22 at 11 26 57 pm" src="https://user-images.githubusercontent.com/23443586/29573700-41fc1c34-8792-11e7-9048-6f7a09c0af3c.png">

<img width="1280" alt="screen shot 2017-08-22 at 11 32 16 pm" src="https://user-images.githubusercontent.com/23443586/29573673-302e2b82-8792-11e7-9b73-930b7c504401.png">



## System Dependencies

1. [PostgreSQL](https://www.postgresql.org/) at least version 9.4


## Getting Started

1. Get the codebase

  ```bash
  git clone https://github.com/sushinoya/twitter-clone.git
  ```

2. Install gem dependencies

  ```bash
  cd twitter-clone
  bundle install
  ```

3. Setup environment variables

  You can find the environment variables used in this application in `.env.sample`. We're using [Dotenv](https://github.com/bkeepers/dotenv) to load the environment variables.

  ```bash
  cp .env.sample .env
  # Update the values of the environment variables in .env accordingly
  ```

4. Setup Database

  ```bash
  rake db:setup
  ```

  To seed the database, simply run

  ```bash
  rake db:seed
  ```

5. Start the application

  We're using [Puma](https://github.com/puma/puma) as our web server.

  ```bash
  # Start the web server
  rails server
  ```

## Testing

We use [Rspec](https://github.com/rspec/rspec-rails) as our testing framework. So, during development, run these regularly.

```bash
# Run the specs
bundle exec rspec
```


## Coding Style

1. Ruby

	We use [Rubocop](https://github.com/bbatsov/rubocop) to perform static analysis of the code according to rules defined in `.rubocop.yml`. Basically, it follows [Ruby Style Guide](https://github.com/bbatsov/ruby-style-guide) and [Rails Style Guide](https://github.com/bbatsov/rails-style-guide).

	```bash
	# Run rubocop
	bundle exec rubocop
	```

2. CoffeeScript

	We setup [CoffeeLint](http://www.coffeelint.org) to ensure our CoffeeScript code are clean and consistent. You may find the installation steps [here](http://www.coffeelint.org/#install).

	```bash
	# Run coffeelint
	coffeelint .
	```

3. Slim - [Slim-Lint](https://github.com/sds/slim-lint)

  ```bash
  # Run slim-lint
  slim-lint .
  ```

4. SCSS - [SCSS-Lint](https://github.com/brigade/scss-lint)

  ```bash
  # Run scss-lint
  scss-lint
  ```

## Branch Policy

We follow the [Github Flow](https://guides.github.com/introduction/flow/) when developing the application, and name our branches as follow:

- `master` is the active development branch

Local development branch naming:

- `feature/<your-branch-name>` for substantial new feature or function
- `enhance/<your-branch-name>` for minor feature or function enhancement
- `bugfix/<your-branch-name>` for bug fixes

