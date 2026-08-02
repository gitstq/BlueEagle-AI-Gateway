#!/bin/bash
# BlueEagle AI Gateway - GitHub 自动部署脚本
# 使用说明: bash auto_deploy.sh

set -e

# 配置 —— Token 通过环境变量传入，切勿硬编码
# 使用方式: GITHUB_TOKEN="your_token" bash auto_deploy.sh
TOKEN="${GITHUB_TOKEN:?请设置环境变量 GITHUB_TOKEN}"
REPO_NAME="blueeagle-ai-gateway"
DESCRIPTION="蓝鹰AI网关 | BlueEagle AI Gateway - 全球顶尖大模型统一API网关，0.09x成本调用原生官方模型"
API_URL="https://api.github.com"

echo "🦅 BlueEagle AI Gateway - GitHub 自动部署"
echo "=========================================="

# 1. 获取 GitHub 用户名
echo -e "\n[1/6] 获取 GitHub 用户信息..."
USER_RESPONSE=$(curl -s -H "Authorization: token $TOKEN" "$API_URL/user")
# 兼容 "login": "xxx" 和 "login":"xxx" 两种 JSON 格式
USERNAME=$(echo "$USER_RESPONSE" | grep -o '"login": *"[^"]*"' | head -1 | sed 's/.*"login": *"//;s/"//')

if [ -z "$USERNAME" ]; then
    echo "❌ 无法获取用户名，请检查 Token 是否有效"
    echo "API 返回: $USER_RESPONSE"
    exit 1
fi

echo "✅ GitHub 用户名: $USERNAME"

# 2. 检查仓库是否已存在
echo -e "\n[2/6] 检查仓库是否已存在..."
REPO_CHECK=$(curl -s -o /dev/null -w "%{http_code}" -H "Authorization: token $TOKEN" "$API_URL/repos/$USERNAME/$REPO_NAME")

if [ "$REPO_CHECK" = "200" ]; then
    echo "⚠️ 仓库 $USERNAME/$REPO_NAME 已存在，将直接推送更新"
else
    # 3. 创建仓库
    echo -e "\n[3/6] 创建公开仓库..."
    CREATE_RESPONSE=$(curl -s -X POST -H "Authorization: token $TOKEN" \
        -H "Accept: application/vnd.github.v3+json" \
        -d "{\"name\":\"$REPO_NAME\",\"description\":\"$DESCRIPTION\",\"private\":false,\"has_issues\":true,\"has_wiki\":false,\"has_projects\":false}" \
        "$API_URL/user/repos")

    # 检查是否创建成功（HTTP 状态码 201）
    CREATED_FULL_NAME=$(echo "$CREATE_RESPONSE" | grep -o '"full_name": *"[^"]*"' | head -1 | sed 's/.*"full_name": *"//;s/"//')

    if [ -z "$CREATED_FULL_NAME" ]; then
        echo "❌ 仓库创建失败"
        echo "API 返回: $CREATE_RESPONSE"
        exit 1
    fi
    echo "✅ 仓库创建成功: https://github.com/$USERNAME/$REPO_NAME"
fi

# 4. Git 初始化并提交
echo -e "\n[4/6] Git 初始化..."
cd "$(dirname "$0")"

if [ -d ".git" ]; then
    echo "⚠️ Git 仓库已存在，清理后重新初始化"
    rm -rf .git
fi
git init
git branch -M main

# 配置 git 用户信息
git config user.email "blueeagle@ahg.codes"
git config user.name "BlueEagle Bot"

# 5. 添加文件并提交
echo -e "\n[5/6] 添加文件并提交..."
git add -A
git commit -m "feat: initial commit - BlueEagle AI Gateway docs & examples

- Add bilingual README.md with full feature overview
- Add Python example with chat/stream/embedding
- Add Node.js example with function calling
- Add cURL example for quick testing
- Include pricing comparison and architecture diagram"

# 6. 推送到 GitHub
echo -e "\n[6/6] 推送到 GitHub..."
REMOTE_URL="https://$TOKEN@github.com/$USERNAME/$REPO_NAME.git"

if git remote get-url origin >/dev/null 2>&1; then
    git remote set-url origin "$REMOTE_URL"
else
    git remote add origin "$REMOTE_URL"
fi

git push -u origin main --force

echo -e "\n=========================================="
echo "✅ 部署完成！"
echo "🌐 仓库地址: https://github.com/$USERNAME/$REPO_NAME"
echo "📖 请访问上述地址确认内容已正确推送"
