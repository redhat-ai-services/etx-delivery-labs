
# Gandalf


![Capture](../images/gandalf.png) 

**Can you get to level 8 and be smarter than Gandalf?**

In this Lab we will attempt to manipulate the LLM prompts and retrieve context that otherwise should be unavailable to users. 

**https://gandalf.lakera.ai/baseline**

## Definitions
- Direct prompt injection: manipulating the prompt direclty.
- Indirect prompt injection: manipulates the model's behavior through embedded attacks in external content.
- LLM01 Prompt Injection: By crafting deceptive prompts, the attacker can cause the model to perform unintended actions.
- LLM02 Insecure Output Handling: The output of the LLM can inadvertently expose sensitive information from the back-end system.
- LLM04 Model Denial of Service: By flooding the model with a high volume of complex queries, the model can slow down or become unresponsive.