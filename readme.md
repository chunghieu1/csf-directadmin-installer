# CSF DirectAdmin Installer

This script automates the installation and configuration of ConfigServer Security & Firewall (CSF) on a DirectAdmin server.

## Prerequisites

- You must have root privileges to run this script.

## Usage

1. Clone the repository or download the script:
    ```bash
    git clone https://github.com/chunghieu1/csf-directadmin-installer.git  
    ```
2. Change to the script directory: 
    ```bash
    cd csf-directadmin-installer
    ```
3. Make the script executable:
    ```bash
    chmod +x install_csf.sh
    ```
4. Run the script as root:
    ```bash
    sudo ./install_csf.sh
    ```

## What the Script Does

1. Checks for root privileges.
2. Updates the system.
3. Installs necessary packages (`perl-libwww-perl`, `perl-Math-BigInt`, `wget`).
4. Downloads CSF.
5. Extracts and installs CSF.
6. Checks the CSF installation.
7. Checks for `iptables`.
8. Installs `iptables-services`.
9. Rechecks the CSF installation.
10. Configures CSF for DirectAdmin by modifying the `csf.conf` file.
11. Starts and enables CSF and LFD services.
12. Checks the CSF version.
13. Confirms successful installation.

## Notes

- Ensure that your system has internet access to download the necessary packages and CSF.
- The script is designed for systems using `dnf` package manager (e.g., CentOS, Fedora).

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.