Here’s a set of intermediate-level shell scripting questions covering various scenarios, including file management, process control, text processing, automation, security, and working with APIs.

### **File Management and Manipulation**

1. **File Check and Operations**:
   - Write a script that checks if a given directory exists. If it exists, create a backup of all `.txt` files in the directory to a `backup` subdirectory with the current date appended to the filenames.
   
2. **Recursive File Search**:
   - Write a script that recursively searches for all files larger than 100MB in a given directory and its subdirectories. Save the results to a file named `large_files.txt`.

3. **File Permissions**:
   - Write a script that finds all files in a directory (and its subdirectories) that are writable by others (world-writable). Change the permissions of these files to remove the write permission for others.

### **Process Control and Job Management**

4. **Background Jobs**:
   - Write a script that launches a long-running process (e.g., a loop that counts to 1 million). Ensure that the process runs in the background and logs its progress to a file every 10 seconds. Implement a way to safely stop the process and clean up any temporary files it creates.

5. **Job Control**:
   - Write a script that launches three different commands in the background. Use `jobs`, `fg`, and `bg` to manage these jobs, and ensure that they are all successfully completed before the script exits.

### **Text Processing**

6. **Log File Analysis**:
   - Write a script that parses a log file and extracts all unique IP addresses. The script should also count how many times each IP address appears in the log and display the top 5 most frequent IP addresses.

7. **Text Replacement**:
   - Write a script that replaces all occurrences of a specific word in a set of files with another word. The script should prompt the user for the word to replace, the replacement word, and the files to modify.

8. **Complex `awk` Usage**:
   - Write a script that processes a CSV file containing a list of products, their prices, and quantities. The script should calculate the total value of inventory for each product and print a summary report showing the product name, total inventory value, and a grand total for all products.

### **Automation and Workflow Management**

9. **CI/CD Pipeline**:
   - Write a script that simulates a simple CI/CD pipeline. The script should perform the following steps:
     - Pull the latest code from a Git repository.
     - Run unit tests.
     - Build the project (simulate with a simple command).
     - Deploy the project to a test environment (simulate by copying files).
     - Notify the user of the build and deployment status.

10. **Automated Backups**:
    - Write a script that automates the backup of a MySQL database. The script should:
      - Dump the database to a file with the current date in the filename.
      - Compress the dump file.
      - Upload the compressed file to an SFTP server.
      - Remove old backups older than 7 days from the SFTP server.

### **Security and Permissions**

11. **User Privilege Management**:
    - Write a script that checks for all users in the system who have a UID of 0 (superuser privileges). If any users other than `root` have UID 0, send an alert (simulated by printing a message to the screen).

12. **Secure Data Handling**:
    - Write a script that prompts the user for a password, securely stores it in an encrypted file, and allows the user to retrieve and decrypt the password later. Ensure the script handles sensitive information securely.

13. **Environment Variable Sanitization**:
    - Write a script that sets up environment variables required by a web application. Ensure that the script validates the environment variables for security, such as checking that URLs do not contain dangerous characters and that passwords meet complexity requirements.

### **API Interaction**

14. **REST API Interaction with `curl`**:
    - Write a script that interacts with a public API (e.g., a weather API). The script should:
      - Accept a city name as input.
      - Fetch the current weather data for the city using `curl`.
      - Parse the JSON response using `jq` and display the temperature, humidity, and weather conditions.

15. **Bulk API Requests**:
    - Write a script that reads a list of URLs from a file and sends a GET request to each URL using `curl`. Save the responses to individual files named after the domain of each URL.

16. **Automated API Monitoring**:
    - Write a script that periodically checks the status of a list of web services (by sending HTTP requests). The script should log the response time and HTTP status code for each service and alert the user (e.g., by printing a message) if any service becomes unavailable.

### **Scripting for Cloud Platforms**

17. **AWS CLI Automation**:
    - Write a script that uses the AWS CLI to:
      - Launch a new EC2 instance.
      - Attach an Elastic IP to the instance.
      - Deploy a simple static website (HTML file) to an S3 bucket.
      - Output the public URL of the deployed website.

18. **Azure Resource Management**:
    - Write a script that uses the Azure CLI to create a new Resource Group, deploy a Virtual Machine within it, and set up basic monitoring (e.g., CPU and memory usage).

19. **GCP CLI for Instance Management**:
    - Write a script that uses the GCP CLI to:
      - Create a Compute Engine VM.
      - Assign a static IP address to the VM.
      - Set up a firewall rule to allow HTTP traffic.
      - Output the external IP address of the VM.

### **Miscellaneous**

20. **Date and Time Handling**:
    - Write a script that schedules a job (using `at` or `cron`) to run at a specific time in the future. The script should allow the user to specify the job's command and the time it should run.

21. **Scripting with `sed` and `awk`**:
    - Write a script that reformats a configuration file (e.g., INI or JSON) using `sed` and `awk` to meet a new format specification. The script should be capable of handling nested sections and complex data structures.

22. **Parallel Processing**:
    - Write a script that splits a large file into smaller chunks and processes each chunk in parallel (e.g., using `xargs` or `parallel`). The script should then combine the results into a single output file.

### **Challenge Questions**

23. **Recursive Function Implementation**:
    - Write a recursive shell function that calculates the nth Fibonacci number. Optimize the function to handle larger values of n.

24. **Dynamic Configuration Management**:
    - Write a script that dynamically generates a configuration file for a service (e.g., Apache, Nginx, or a database). The script should take user input for the service's settings, validate them, and create a valid configuration file.

25. **Advanced Signal Handling**:
    - Write a script that runs a long-running process (e.g., a server or monitoring script) and implements advanced signal handling to:
      - Gracefully shut down the process on receiving `SIGINT` or `SIGTERM`.
      - Reload configuration files without stopping the process when receiving `SIGHUP`.

These questions cover a wide range of topics and scenarios that an intermediate shell scripter might encounter. They are designed to challenge the user's understanding of shell scripting, encourage the development of robust and secure scripts, and promote the use of automation in real-world tasks.
