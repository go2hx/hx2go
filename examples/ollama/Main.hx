import go.Context;
import go.github_com.ollama.ollama.Api;
import go.github_com.ollama.ollama.api.GenerateRequest;
import go.github_com.ollama.ollama.api.GenerateResponse;
import go.github_com.ollama.ollama.api.Client;
import go.context.Context as ContextInst;
import go.Pointer;

var client: Pointer<Client>;
var ctx: ContextInst;

function loop() {
    Sys.print("You: ");

    var req: GenerateRequest = {
        model: "gemma3:270m",
        prompt: Sys.stdin().readLine(),
        stream: null
    };

    Sys.print("LLM: ");

    client.generate(ctx, req, (res: GenerateResponse) -> {
        Sys.print(res.response);

        if (res.done) {
            Sys.print("\n");
        }

        return null;
    }).sure();
}

function main() {
    ctx = Context.background();
    client = Api.clientFromEnvironment().sure();
    do loop() while (true);
}