import ballerina/os;

configurable string customopenaiAgentManagerUrl = os:getEnv("CUSTOMOPENAI_URL");
configurable string customopenaiAgentManagerKey = os:getEnv("CUSTOMOPENAI_API_KEY");
configurable string sendEmailMockMcpUrl = os:getEnv("SEND_EMAIL_MOCK_MCP_URL");
configurable string contractStoreMcpUrl = os:getEnv("CONTRACT_STORE_MCP_URL");
configurable string sendEmailMockMcpApiKey = os:getEnv("NEWONEEVE19THOCT_MCP_CONFIG_1_API_KEY");
configurable string contractStoreMcpApiKey = os:getEnv("NEWONEEVE19THOCT_MCP_CONFIG_2_API_KEY");
