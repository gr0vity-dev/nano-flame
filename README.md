# nano_flame

`nano_flame` is a tool designed to simplify the generation of flame graphs for docker instances running `nano_node`. 
It's particularly useful for developers who need to analyze and optimize the performance of the nano-currency node.

## Features
- **Automatic Architecture Detection**: The script detects whether it's running on AMD64 or ARM64 (including Apple M1/M2) and selects the appropriate Docker image.
- **Easy to Use**: Run the script without the need to download it, using a simple curl or wget command.

## Prerequisites
- Docker installed on your system.
- Access to the internet to pull Docker images and the script.

## Installation
Run the following command to execute the script directly without downloading:

```bash
curl -sSL https://raw.githubusercontent.com/gr0vity-dev/nano-flame/main/run.sh | bash -s [container_name] [duration in seconds]
```
or
```bash
wget -O - https://raw.githubusercontent.com/gr0vity-dev/nano-flame/main/run.sh | bash -s [container_name] [duration in seconds]
```


## Usage
After running the installation command, follow these steps:
1. **Specify the Container Name**: Replace `[container_name]` with the name of your Docker container running `nano_node`.
2. **Set the Duration**: Replace `[duration in seconds]` with the duration for which you want to generate the flame graph.

Example:
```bash
curl -sSL https://raw.githubusercontent.com/gr0vity-dev/nano-flame/main/run.sh | bash -s nl_pr1 20
```

## Contributing
Contributions are welcome! If you have suggestions or improvements, please submit a pull request or open an issue in the GitHub repository.

## License
This project is licensed under the [MIT License](LICENSE).

## Disclaimer
This script runs with elevated privileges and performs system checks. Please review the script before running it on your system.

## Acknowledgments
- This project is inspired by the need for easy performance analysis of nano nodes.

