#!/bin/bash

# Variables
read -p "Enter the PostgreSQL database name: " DB_NAME
read -p "Enter the PostgreSQL username: " DB_USER
read -p "Enter the PostgreSQL port [5432]: " DB_PORT
DB_PORT=${DB_PORT:-5432}
DB_HOST="localhost"

# Prompt for PostgreSQL password
read -sp "Enter the PostgreSQL password for user '$DB_USER': " DB_PASSWORD
echo ""

# Prompt for sudo (Ubuntu) password when needed
echo "You'll need to enter your system (Ubuntu) password for sudo commands."

# Install PostgreSQL if not installed
if ! command -v psql > /dev/null; then
  echo "PostgreSQL not found. Installing..."
  sudo apt update
  sudo apt install -y postgresql postgresql-contrib
else
  echo "PostgreSQL is already installed."
fi

# Start PostgreSQL service if it's not running
sudo systemctl start postgresql

# Create PostgreSQL user and database
echo "Creating PostgreSQL user and database..."
sudo -u postgres psql <<EOF
CREATE USER $DB_USER WITH PASSWORD '$DB_PASSWORD';
CREATE DATABASE $DB_NAME;
GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $DB_USER;
EOF

# Generate connection info and save to .env
echo "Generating connection info..."
cat <<EOT > .env
DB_HOST=$DB_HOST
DB_PORT=$DB_PORT
DB_NAME=$DB_NAME
DB_USER=$DB_USER
DB_PASSWORD=$DB_PASSWORD
EOT

echo "Connection info saved to .env file."
