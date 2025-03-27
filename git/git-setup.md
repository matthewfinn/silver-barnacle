# Steps to Add Git to PATH and "Git Bash Here" Context Menu with Icon on Windows

## 1. **Add Git to the System PATH**

### a. Verify Git Installation
1. Open **Command Prompt** or **PowerShell**.
2. Type `git --version` and press **Enter**.
3. If Git is installed correctly, you should see the version number, e.g., `git version 2.x.x.windows.x`. If not, follow the steps below to add Git to the PATH.

### b. Manually Add Git to PATH
1. Open **Start Menu**, type **"Environment Variables"**, and select **"Edit the system environment variables"**.
2. Click **Environment Variables**.
3. Under **System variables**, find **Path**, select it, and click **Edit**.
4. Click **New**, and add the following Git path (depending on your installation directory):
    - `C:\Program Files\Git\cmd`
    - `C:\Program Files\Git\bin`
5. Click **OK** to save, then restart your system or Command Prompt.

## 2. **Add "Git Bash Here" to Context Menu**

### a. Open the Registry Editor
1. Press `Win + R`, type `regedit`, and press **Enter** to open the **Registry Editor**.

### b. Create the "Git Bash Here" Context Menu Entry
1. Navigate to the following registry key: HKEY_CLASSES_ROOT\Directory\Background\shell
2. right-click on **shell**, select **New > Key**, and name it `git bash`.
3. Right-click on the newly created **git bash** key, select **New > Key**, and name it `command`.
4. Select the **command** key, then double-click **(Default)** and enter the following value: `C:\Program Files\Git\git-bash.exe`

### c. Add Icon to "Git Bash Here"
1. Right-click on the **git bash** key in the registry, select **New > String Value**, and name it `Icon`.
2. Right-click on **Icon**, select **Modify**, and set the **Value data** to: `C:\Program Files\Git\mingw64\share\git\git-for-windows.ico`

(Adjust the path to match your Git installation directory.)
3. Click **OK** to save.

## 3. **Restart Windows Explorer**
1. Open **Task Manager** (`Ctrl + Shift + Esc`), locate **Windows Explorer**, right-click it, and select **Restart**.

## 4. **Verify the Context Menu Option**
1. After restarting, right-click on the **background** of any folder.
2. You should now see **"Git Bash Here"** with the Git icon.

---

## Notes:
- If the context menu still doesn't appear, try restarting your computer.
- Ensure that Git is installed in the default directory or adjust the registry paths accordingly.
---

