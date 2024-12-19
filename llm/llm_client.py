# DeepSeek API密钥
DEEPSEEK_API_KEY = "your-deepseek-api-key"  # 请替换为您的API密钥

def call_deepseek_api(prompt: str) -> str:
    client = OpenAI(
        api_key=DEEPSEEK_API_KEY,
        base_url="https://api.deepseek.com"
    )

    response = client.chat.completions.create(
        model="deepseek-chat",
        messages=[
            {"role": "user", "content": prompt},
        ],
        max_tokens=500,
        temperature=0.2,
        stream=False
    )

    if response:
        return response.choices[0].message.content.strip()
    else:
        raise Exception(f"Error: {response.status_code}, {response.text}")