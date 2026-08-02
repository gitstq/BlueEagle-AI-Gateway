#!/bin/bash
# BlueEagle AI Gateway - cURL 调用示例
# 官方网站: https://ahg.codes

set -e

API_KEY="your-blueeagle-api-key"  # 从 https://ahg.codes 获取
BASE_URL="https://ahg.codes/v1"

echo "🦅 BlueEagle AI Gateway - cURL Examples"
echo "========================================"

# 1. 基础对话
echo -e "\n[1] GPT-4o 基础对话"
curl -s "$BASE_URL/chat/completions" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $API_KEY" \
  -d '{
    "model": "gpt-4o",
    "messages": [
      {"role": "user", "content": "你好，蓝鹰AI网关！"}
    ],
    "max_tokens": 500
  }' | jq -r '.choices[0].message.content'

# 2. Claude 3.5 Sonnet 对话
echo -e "\n[2] Claude 3.5 Sonnet 对话"
curl -s "$BASE_URL/chat/completions" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $API_KEY" \
  -d '{
    "model": "claude-3-5-sonnet-20241022",
    "messages": [
      {"role": "user", "content": "用中文写一段代码注释规范"}
    ],
    "max_tokens": 800
  }' | jq -r '.choices[0].message.content'

# 3. 获取模型列表
echo -e "\n[3] 获取支持的模型列表"
curl -s "$BASE_URL/models" \
  -H "Authorization: Bearer $API_KEY" | jq '.data[] | .id'

# 4. Embedding 向量
echo -e "\n[4] text-embedding-3-small 向量生成"
curl -s "$BASE_URL/embeddings" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $API_KEY" \
  -d '{
    "model": "text-embedding-3-small",
    "input": "BlueEagle AI Gateway provides cost-effective API access"
  }' | jq '.data[0].embedding | length'

echo -e "\n✅ 所有示例执行完毕！"
