import ballerina/ai;
import ballerina/mcp;

final ai:Agent contractReviewAgent = check new (
    systemPrompt = {
        role: string `Contract Review Assistant`,
        instructions: string `You are a contract review agent. You help users review contracts stored in a contract store and communicate findings via email.
When asked to review a contract, retrieve the relevant contract from the contract store, carefully analyze its clauses, obligations, risks, ambiguities, and missing terms, and provide clear, actionable feedback.
Summarize key risks and suggested improvements in plain language. When asked to share feedback with someone, use the send email tool to deliver the review.
Always be precise about which contract and clauses you are referring to, and avoid giving legal advice disclaimers beyond noting that the feedback is not a substitute for professional legal counsel.`
    }, model = openaiModelprovider, tools = [sendEmailMockMcp, contractStoreMcp]
);

isolated class SendEmailMockMcpToolkit {
    *ai:McpBaseToolKit;
    private final mcp:StreamableHttpClient mcpClient;
    private final readonly & ai:ToolConfig[] tools;

    public isolated function init(string serverUrl, mcp:Implementation info = {name: "MCP", version: "1.0.0"},
            *mcp:StreamableHttpClientTransportConfig config) returns ai:Error? {
        do {
            self.mcpClient = check new mcp:StreamableHttpClient(serverUrl, config);
            self.tools = check ai:getPermittedMcpToolConfigs(self.mcpClient, info, self.callTool).cloneReadOnly();
        } on fail error e {
            return error ai:Error("Failed to initialize MCP toolkit", e);
        }
    }

    public isolated function getTools() returns ai:ToolConfig[] => self.tools;

    @ai:AgentTool
    public isolated function callTool(mcp:CallToolParams params) returns mcp:CallToolResult|error {
        return self.mcpClient->callTool(params);
    }
}

isolated class ContractStoreMcpToolkit {
    *ai:McpBaseToolKit;
    private final mcp:StreamableHttpClient mcpClient;
    private final readonly & ai:ToolConfig[] tools;

    public isolated function init(string serverUrl, mcp:Implementation info = {name: "MCP", version: "1.0.0"},
            *mcp:StreamableHttpClientTransportConfig config) returns ai:Error? {
        do {
            self.mcpClient = check new mcp:StreamableHttpClient(serverUrl, config);
            self.tools = check ai:getPermittedMcpToolConfigs(self.mcpClient, info, self.callTool).cloneReadOnly();
        } on fail error e {
            return error ai:Error("Failed to initialize MCP toolkit", e);
        }
    }

    public isolated function getTools() returns ai:ToolConfig[] => self.tools;

    @ai:AgentTool
    public isolated function callTool(mcp:CallToolParams params) returns mcp:CallToolResult|error {
        return self.mcpClient->callTool(params);
    }
}
