# Use an official Ruby image as the base image
FROM ruby:3.2.2

# Set the working directory inside the container
WORKDIR /app

# Install system dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install Ruby gems
RUN gem install bundler
RUN bundle install

# Copy the rest of the Rails application code into the container
COPY . .

# Expose port 3000 (assuming your Rails app runs on this port)
EXPOSE 3000
ARG URL=0.0.0.0:3000
# Set environment variables if needed (e.g., for database configuration)
# ENV DATABASE_URL=mysql2://username:password@mysql_host:3306/database_name

# Define the command to start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]

#Lo importante es usar esto para el despliegue : docker run -p 3000:3000 calendar_ms