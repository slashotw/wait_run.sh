# Process Monitor & Trigger Script

A lightweight bash utility to monitor a running process by its Process ID (PID) and automatically trigger a subsequent task (e.g., model training, data processing) once the original process has terminated.

## Key Features

- **Automated Workflow Execution:** Efficiently chain long-running tasks without manual intervention.
- **Continuous Monitoring:** Periodically checks the system process table to confirm if the target process is still active.
- **Time-Stamped Logging:** Provides clear, timestamped terminal output on the status of the monitored process.

## Usage

1. Grant execution permissions to the script:
   ```bash
   chmod +x wait_and_run.sh
   ```

2. Retrieve the Process ID (PID) of the task you want to monitor.
   ```bash
   # You can find the PID using `top`, `htop`, or `ps` commands
   ps aux | grep <process_name>
   ```

3. Run the monitor script, passing the PID as the first argument:
   ```bash
   ./wait_and_run.sh <PID>
   ```

### Example

```bash
$ ./wait_and_run.sh 12345
==== Monitoring Started ====
Waiting for PID 12345 to complete...
[2024-05-18 10:30:15] PID 12345 is still running... Retrying in 60 seconds.
[2024-05-18 10:31:15] PID 12345 is still running... Retrying in 60 seconds.
...
==== Target Process Terminated ====
[2024-05-18 10:45:00] Initializing training routine...
...
==== Training Routine Completed ====
```

## Configuration

By default, the script triggers the execution of `python train_v8.py`. To customize the triggered task or environment, modify the execution block inside `wait_and_run.sh`:

```bash
# Execute subsequent command
# Replace the line below with your desired command
python my_custom_script.py --args
```

The script polls the process status every 60 seconds to avoid unnecessary CPU load. You can adjust the `sleep 60` duration in the loop to your preference.
