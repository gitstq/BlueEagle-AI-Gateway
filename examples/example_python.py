"""
BlueEagle AI Gateway - Python 调用示例
官方文档: https://ahg.codes
"""

from openai import OpenAI

# 配置 BlueEagle API
client = OpenAI(
    api_key="your-blueeagle-api-key",  # 从 https://ahg.codes 获取
    base_url="https://ahg.codes/v1"
)


def chat_completion():
    """基础对话示例"""
    response = client.chat.completions.create(
        model="gpt-4o",
        messages=[
            {"role": "system", "content": "You are a helpful assistant."},
            {"role": "user", "content": "介绍一下蓝鹰AI网关的优势"}
        ],
        temperature=0.7,
        max_tokens=2000
    )
    print("=== GPT-4o 回复 ===")
    print(response.choices[0].message.content)


def stream_chat():
    """流式输出示例"""
    response = client.chat.completions.create(
        model="claude-3-5-sonnet-20241022",
        messages=[{"role": "user", "content": "请用流式方式写一首短诗"}],
        stream=True
    )
    print("=== Claude 3.5 Sonnet 流式回复 ===")
    for chunk in response:
        if chunk.choices[0].delta.content:
            print(chunk.choices[0].delta.content, end="", flush=True)
    print()


def multi_model_compare():
    """同一问题多模型对比"""
    question = "解释量子计算的基本原理，用一句话总结"
    models = [
        ("gpt-4o-mini", "OpenAI"),
        ("claude-3-5-haiku-20241022", "Anthropic"),
        ("gemini-1.5-flash", "Google"),
    ]

    for model, provider in models:
        try:
            resp = client.chat.completions.create(
                model=model,
                messages=[{"role": "user", "content": question}],
                max_tokens=500
            )
            print(f"\n=== {provider} ({model}) ===")
            print(resp.choices[0].message.content)
        except Exception as e:
            print(f"\n=== {provider} ({model}) 调用失败 ===")
            print(str(e))


def embedding_example():
    """Embedding 向量示例"""
    response = client.embeddings.create(
        model="text-embedding-3-small",
        input="蓝鹰AI网关提供高性价比的大模型API服务"
    )
    print("=== Embedding 结果 ===")
    print(f"向量维度: {len(response.data[0].embedding)}")
    print(f"前5维: {response.data[0].embedding[:5]}")


if __name__ == "__main__":
    print("🦅 BlueEagle AI Gateway - Python Examples\n")

    # 1. 基础对话
    chat_completion()
    print()

    # 2. 流式输出
    stream_chat()
    print()

    # 3. 多模型对比
    multi_model_compare()
    print()

    # 4. Embedding
    embedding_example()
