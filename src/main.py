import ollama
import toml

# r = ollama.chat(
#     model="mistral",
#     messages=[
#         {"role": "user", "content": "Tell me a joke"},
#     ],
# )


r = ollama.generate(model="llama3.1", prompt="Hello")
#
print(r["response"])

# with open("example.toml", "r") as f:
#     config = toml.load(f)
#
# print(config)
