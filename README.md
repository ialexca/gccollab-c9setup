#GCCollab Basic Setup 

1. Create cloud9 workspace using PHP, Mysql and Apache template
2. Clone this repo inside your cloud9 workspace (Works) 
   Execute this command line in your root directory
   ```bash
     # git clone https://github.com/ialexca/gccollab-c9setup.git setup
   ```
3. Execute setup script
   ```bash
     # ./setup/setup.sh
   ```
4. Environment is now configured
  - Database name: gccollabdb
  - Database user: gccollab
  - Database password: secret
  
  Mailcatcher
  - smtp://localhost:1025
  - http://localhost:1080
  
5. Goto Page https://your-project-name-c9username.c9users.io/gccollab
  - Note that you must replace `your-project-name` and `c9username`.

6. Setup Elgg with appropriate values

7. Once it's done, execute after.sh script to set folder rights.
  ```bash
     # ./setup/after.sh
   ```
   
   
