# Find processes running on port
We can do this using the Windows command line. Run cmd.exe as an administrator and enter the following command:

Click to Copy
netstat -ano | findstr :8080

# Kill process where PID is 2660
taskkill /PID 2660 /F
