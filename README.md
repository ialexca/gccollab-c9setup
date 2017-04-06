#GCCollab Basic Setup 

1. Create [cloud9](https://c9.io) workspace using *PHP, Mysql and Apache template*
2. Clone this repo inside your cloud9 workspace (Works) 
   Execute this command line in your root directory
   ```bash
     # git clone https://github.com/ialexca/gccollab-c9setup.git setup
   ```
3. Execute setup script, depends on product.
   For GCCollab:
   ```bash
     # ./setup/gccollab-setup.sh
   ```
   For GCConnex:
   ```bash
     # ./setup/gcconnex-setup.sh
   ```
   
4. Environment is now configured
  - Database name: gccollabdb / gcconnexdb
  - Database user: gccollab / gcconnex
  - Database password: secret
  
  Mailcatcher
  - smtp://localhost:1025
  - http://localhost:1080
  
5. Goto Page https://your-project-name-c9username.c9users.io/gccollab or https://your-project-name-c9username.c9users.io/gcconnex
  - Note that you must replace `your-project-name` and `c9username`.

6. Setup Elgg with appropriate values
   *data folder:* `/home/ubuntu/workspace/gccollab_data` or  `/home/ubuntu/workspace/gcconnex_data`

7. Once it's done, execute after.sh script to set folder rights.
  For GcCollab:
  ```bash
     # ./setup/gccollab-after.sh
   ```
   For Gcconnex:
     ```bash
     # ./setup/gcconnex-after.sh
   ```
   
