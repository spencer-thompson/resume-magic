import ollama
import toml


def main():

    md = ""

    with open("../my_resume.toml", "r") as f:
        resume_data = toml.load(f)

    print(resume_data)


# r = ollama.chat(
#     model="mistral",
#     messages=[
#         {"role": "user", "content": "Tell me a joke"},
#     ],
# )


# r = ollama.generate(model="llama3.1", prompt="Hello")
#
# print(r["response"])


if __name__ == "__main__":
    main()
