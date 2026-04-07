# HAL: The MCP Host Demo for SLE16

Welcome to the **mcphost-demo**! This repository holds the soul of HAL, your AI-powered Sysadmin Assistant for SUSE Linux Enterprise Server 16 (SLE16). 

Imagine you are looking at a fresh SLE16 instance. It's a clean slate, but it's missing that intelligent spark. Follow this storyline to implant HAL into your system, bringing advanced container management, system configuration, and deep diagnostics directly to your fingertips.

---

## Chapter 1: The Foundation
Before we can build, we need our tools. Ensure that your system has `git`, the core `mcphost` package, and the necessary `mcp-server` extensions installed. 

These packages are installed on this SLE16 instance and should be present on your target system:
- `mcphost` (The core CLI host application for MCP)
- `mcphost-bash-completion` (Shell completion)
- `mcphost-example-configs` (Sample configurations)
- `mcp-server-systemd` (Bindings to systemd via MCP)
- `mcp-server-systemd-gatekeeper` (Gatekeeper service for systemd access)
- `mcp-server-monitor` (Exposes system metrics via MCP)
- `mcp-server-user-prompt` (Enables requesting user input during generation)

```bash
# Install git and the required MCP packages
sudo zypper in git mcphost mcphost-bash-completion mcphost-example-configs mcp-server-systemd mcp-server-systemd-gatekeeper mcp-server-monitor mcp-server-user-prompt
```

## Chapter 2: The Vault
HAL requires access to external AI models to function, which means safely storing your API keys. We'll create a hidden secrets file, ensuring it is locked down so only you can read it.

```bash
# Create the secrets file with your API key
echo 'export GOOGLE_API_KEY="your_actual_api_key_here"' > ~/.secrets

# Lock down permissions to prevent unauthorized access
chmod 600 ~/.secrets
```

## Chapter 3: Retrieving the Brain
Next, we pull down the configuration files that give HAL its specific SLE16 expertise and permissions.

```bash
# Clone this repository (replace with your actual repo URL)
git clone https://github.com/yourusername/mcphost-demo.git
cd mcphost-demo
```

## Chapter 4: Implanting the Personality
We need to put HAL's configuration files and system prompts exactly where our shell aliases expect them to be.

```bash
# Create the directory structure
mkdir -p ~/mcphost

# Copy the configuration YAMLs as hidden files
cp mcphost.pro.yaml ~/mcphost/.mcphost.pro.yaml
cp mcphost.minimal.yaml ~/mcphost/.mcphost.minimal.yaml

# Copy the system prompts (the true core of HAL's personality)
cp system-prompt.md ~/mcphost/
cp system-prompt-minimal.md ~/mcphost/
```

## Chapter 5: Teaching the Shell
To make calling HAL as effortless as talking to a colleague, we append the provided aliases (`hal` and `minihal`) to your local bash configuration.

```bash
# Append the custom aliases to your shell configuration
cat .bashrc >> ~/.bashrc

# Reload your shell environment
source ~/.bashrc
```

## Chapter 6: The Awakening
Everything is in place. The system knows the commands, the keys are securely loaded, and the configuration maps to the correct system prompts. 

It's time to wake up HAL. Make your first request:

```bash
hal "Hello! Who are you, and what operating system are we running on?"
```

If HAL responds with its SLES 16 Sysadmin persona, congratulations! Your AI assistant is online and ready to help you manage your infrastructure.