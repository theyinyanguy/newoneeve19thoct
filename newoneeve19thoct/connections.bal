import ballerinax/ai.openai;

final openai:ModelProvider openaiModelprovider = check new (customopenaiAgentManagerKey, "gpt-5.1-chat-latest", customopenaiAgentManagerUrl);

final SendEmailMockMcpToolkit sendEmailMockMcp = check new (sendEmailMockMcpUrl, auth = {tokenUrl: agentIdTokenUrl, clientId: agentIdClientId, clientSecret: agentIdClientSecret, scopes: agentIdScopes, optionalParams: {"resource": sendEmailMockMcpUrl}});
final ContractStoreMcpToolkit contractStoreMcp = check new (contractStoreMcpUrl, auth = {tokenUrl: agentIdTokenUrl, clientId: agentIdClientId, clientSecret: agentIdClientSecret, scopes: agentIdScopes, optionalParams: {"resource": contractStoreMcpUrl}});
