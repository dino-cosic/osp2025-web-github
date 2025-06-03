# Base image with .NET 8 SDK preinstalled
FROM mcr.microsoft.com/devcontainers/dotnet:8.0

# Install prerequisites for Azure Pipelines agent
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Environment variables for Azure Pipelines agent
ARG AZP_URL=https://dev.azure.com/dinocosic95
ARG AZP_TOKEN=5GUfxbFV3Y3Ph6PV5gOl23id1qgL2u1IIAezyjpLvQJkgprvwxlsJQQJ99BFACAAAAAAAAAAAAASAZDO2Q71
ARG AZP_POOL=CodespacesPool
ARG AZP_AGENT_NAME=CodespacesAgent

# Create directory for the agent
RUN mkdir /azp
WORKDIR /azp

# Download and extract the Azure Pipelines agent
RUN curl -LsS https://vstsagentpackage.azureedge.net/agent/3.220.2/vsts-agent-linux-x64-3.220.2.tar.gz | tar -xz

# Configure the agent in unattended mode
RUN ./config.sh --unattended \
    --url $AZP_URL \
    --auth pat \
    --token $AZP_TOKEN \
    --pool $AZP_POOL \
    --agent $AZP_AGENT_NAME \
    --acceptTeeEula

# Start the agent by default when Codespace starts
CMD ["./run.sh"]
