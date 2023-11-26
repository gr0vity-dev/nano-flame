# nano_flame

`nano_flame` is a tool designed to simplify the generation of flame graphs for docker instances running `nano_node`.
It's particularly useful for developers who need to analyze and optimize the performance of the nano-currency node.

## Features
- **Automatic Architecture Detection**: The script detects whether it's running on AMD64 or ARM64 (including Apple M1/M2) and selects the appropriate Docker image.
- **Easy to Use**: Easily generate flame graphs for your `nano_node` instances.

## Prerequisites
- Docker installed on your system.
- Git installed on your system for cloning the repository.

## Installation
Clone the `nano_flame` project from GitHub:

```bash
git clone https://github.com/gr0vity-dev/nano-flame
```

Navigate to the cloned directory and run the `add_alias.sh` script to add `nano-flame` as an alias in your shell:

```bash
cd nano-flame
./add_alias.sh
# Manually source the updated configuration file. The script will provide the specific command to use.
```

This will set up the `nano-flame` command so you can easily call it from the terminal.

## Usage
With the alias set up, you can use `nano-flame` to generate flame graphs:

```bash
nano-flame [container_name] [duration in seconds]
```

1. **Specify the Container Name**: Replace `[container_name]` with the name of your Docker container running `nano_node`.
2. **Set the Duration**: Replace `[duration in seconds]` with the duration for which you want to generate the flame graph.

Example:
```bash
nano-flame nl_pr1 20
```

## Contributing
Contributions are welcome! If you have suggestions or improvements, please submit a pull request or open an issue in the GitHub repository.

## License
This project is licensed under the [MIT License](LICENSE).

## Disclaimer
This script runs with elevated privileges and performs system checks. Please review the script before running it on your system.

## Acknowledgments
- This project is inspired by the need for easy performance analysis of nano nodes.
