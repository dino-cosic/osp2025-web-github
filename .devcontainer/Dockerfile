FROM mcr.microsoft.com/vscode/devcontainers/dotnet:8.0

RUN apt-get update && apt-get install -y curl unzip jq && rm -rf /var/lib/apt/lists/*

RUN mkdir /azp
WORKDIR /azp

RUN curl -LsS https://vstsagentpackage.azureedge.net/agent/3.220.2/vsts-agent-linux-x64-3.220.2.tar.gz | tar -xz

# Fix: Copy from current build context directory
COPY start-agent.sh .  # Removed .devcontainer/ prefix

RUN chmod +x start-agent.sh
