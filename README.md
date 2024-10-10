Here’s a simple `README.md` file for running your PostgreSQL setup script.

---

# PostgreSQL Setup Script

This script automates the process of setting up a PostgreSQL database, creating a user, and generating a `.env` file containing the database connection information. 

## Requirements

- Ubuntu (or any Linux distribution that uses `apt`)
- PostgreSQL installed (if not, the script will install it)
- Bash shell

## How to Use

1. **Clone the repository** or download the script to your local machine.

2. **Make the script executable** (if not already):
   ```bash
   chmod +x automate_pg_setup.sh
   ```

3. **Run the script**:
   ```bash
   ./automate_pg_setup.sh
   ```

4. **Provide the required information** when prompted:
   - PostgreSQL database name
   - PostgreSQL username
   - PostgreSQL port (default is 5432)
   - PostgreSQL password for the specified user
   - The directory where the `.env` file should be saved

5. **The script will do the following**:
   - Install PostgreSQL (if it's not installed)
   - Start the PostgreSQL service
   - Create the specified PostgreSQL user (if it doesn't exist)
   - Create a new PostgreSQL database
   - Grant the user access to the new database
   - Generate a `.env` file with the database connection information

## Example

```bash
➜  ./automate_pg_setup.sh
Enter the PostgreSQL database name: mydb
Enter the PostgreSQL username: myuser
Enter the PostgreSQL port [5432]: 5432
Enter the PostgreSQL password for user 'myuser': ********
You'll need to enter your system (Ubuntu) password for sudo commands.
PostgreSQL is already installed.
Creating PostgreSQL user and database...
Creating PostgreSQL user 'myuser'...
Database 'mydb' created successfully.
Connection info saved to /path/to/directory/.env file.
```

## Connection Info

The `.env` file will be generated in the directory you specified, and it will contain the following information:

```env
DB_HOST=localhost
DB_PORT=5432
DB_NAME=mydb
DB_USER=myuser
DB_PASSWORD=my_password
```

You can then use this `.env` file to connect your backend application to the PostgreSQL database.

## Notes

- Make sure that the database name contains only letters, numbers, and underscores. Hyphens (`-`) are not allowed in PostgreSQL database names.
- If the PostgreSQL user already exists, the script will skip creating it and proceed with the rest of the steps.

## License

This script is provided as-is. Feel free to modify it for your own use.
