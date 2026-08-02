<div align="center">

<!-- 徽章区 -->
<p>
  <a href="https://ahg.codes"><img src="https://img.shields.io/badge/Official_Site-ahg.codes-2563EB?style=for-the-badge&logo=google-chrome&logoColor=white" alt="官方网站"></a>
  <a href="#-pricing"><img src="https://img.shields.io/badge/Charge_Ratio-1:1-16A34A?style=for-the-badge&logo=cash-app&logoColor=white" alt="充值比例"></a>
  <a href="#-pricing"><img src="https://img.shields.io/badge/Consumption_Rate-0.09x-DC2626?style=for-the-badge&logo=fire&logoColor=white" alt="消耗倍率"></a>
  <a href="#-supported-models"><img src="https://img.shields.io/badge/Native_Pool-100%25-7C3AED?style=for-the-badge&logo=shield&logoColor=white" alt="原生号池"></a>
</p>

<p>
  <img src="https://img.shields.io/github/stars/blueeagle-ai/gateway?style=social" alt="Stars">
  <img src="https://img.shields.io/badge/Python-3.8+-3776AB?logo=python&logoColor=white" alt="Python">
  <img src="https://img.shields.io/badge/Node.js-16+-339933?logo=node.js&logoColor=white" alt="Node.js">
  <img src="https://img.shields.io/badge/OpenAI_Compatible-Yes-412991?logo=openai&logoColor=white" alt="OpenAI Compatible">
</p>

<!-- Logo / Title -->
<h1>🦅 蓝鹰AI网关 | BlueEagle AI Gateway</h1>

<h3><em>全球顶尖大模型统一API网关 —— 以 9% 成本调用 100% 原生官方模型</em></h3>
<p><strong>One Gateway. All Models. Official Quality. Fractional Cost.</strong></p>

[🚀 免费测试](https://ahg.codes) · [📖 文档中心](https://ahg.codes) · [💬 技术支持](https://ahg.codes)

</div>

---

## 🌐 项目简介 | Introduction

**蓝鹰AI网关（BlueEagle AI Gateway）** 是一款面向开发者和企业的高性能AI大模型统一接入平台。我们提供 **100% 原生官方号池**，零掺假、零共享、零二次中转，让您以 **官方定价 9% 的成本**，享受与官方完全一致的服务质量。

通过单一 API 端点，一键接入 OpenAI、Claude、Gemini 等全球顶尖大模型，完全兼容 OpenAI 接口规范，实现零代码迁移。

> **BlueEagle AI Gateway** is a high-performance unified AI model access platform for developers and enterprises. We provide **100% native official API pools** with zero adulteration, zero sharing, and zero secondary relay — enabling you to access world-class AI models at **9% of official pricing** with identical service quality.

---

## ✨ 核心优势 | Core Advantages

| 特性 | 蓝鹰AI网关 | 说明 |
|------|-----------|------|
| 💰 **极致性价比** | **0.09x 消耗倍率** | 仅为官方定价的 9%，行业领先 |
| ⚖️ **1:1 充值比例** | 充 1 元 = 1 美元额度 | 无隐藏汇率损耗，透明公正 |
| 🏆 **原生官方号池** | 100% 官方直连 | 无掺假、无共享账号、无二次中转 |
| ⚡ **智能高可用** | 多账号负载均衡 + 毫秒级故障切换 | 99.9%+ 服务可用性保障 |
| 🔄 **完全兼容** | OpenAI API 规范 | 零代码迁移，改一行 `base_url` 即可 |
| 🎁 **免费测试** | 注册即送测试额度 | 零风险体验全部模型能力 |
| ♾️ **额度永久有效** | 不清零、不过期 | 用多少付多少，余额永久保留 |

---

## 📋 支持模型 | Supported Models

| 服务商 | 模型系列 | 状态 | 备注 |
|--------|---------|------|------|
| **OpenAI** | GPT-4o / GPT-4o-mini / GPT-4-Turbo / GPT-3.5-Turbo / o1 / o3-mini | ✅ 已支持 | 全系列原生官方号池 |
| **Anthropic** | Claude 3.5 Sonnet / Claude 3.5 Haiku / Claude 3 Opus | ✅ 已支持 | 全系列原生官方号池 |
| **Google** | Gemini 1.5 Pro / Gemini 1.5 Flash / Gemini Ultra | ✅ 已支持 | 全系列原生官方号池 |
| **Antigravity** | Antigravity 系列 | ✅ 已支持 | 原生官方号池 |
| **DeepSeek** | DeepSeek-V3 / DeepSeek-R1 | 🚧 即将支持 | coming soon |
| **通义千问** | Qwen-Max / Qwen-Plus / Qwen-Turbo | 🚧 即将支持 | coming soon |
| **Meta** | Llama 3 / Llama 3.1 系列 | 🚧 即将支持 |  coming soon |

> 所有模型均通过 **原生官方号池** 直接调用，非逆向、非共享、非二次聚合，确保输出质量与官方 100% 一致。

---

## 🚀 快速开始 | Quick Start

### 1. 获取 API Key
访问 [ahg.codes](https://ahg.codes) 注册账号，即刻获得 API Key 与免费测试额度。

### 2. 修改 base_url
将官方 `https://api.openai.com/v1` 替换为：

```
https://ahg.codes/v1
```

### 3. 一行代码开始调用

**cURL**
```bash
curl https://ahg.codes/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $BLUEEAGLE_API_KEY" \
  -d '{
    "model": "gpt-4o",
    "messages": [{"role": "user", "content": "Hello, BlueEagle!"}]
  }'
```

**Python**
```python
from openai import OpenAI

client = OpenAI(
    api_key="your-blueeagle-api-key",
    base_url="https://ahg.codes/v1"
)

response = client.chat.completions.create(
    model="gpt-4o",
    messages=[{"role": "user", "content": "Hello, BlueEagle!"}]
)
print(response.choices[0].message.content)
```

**Node.js**
```javascript
import OpenAI from 'openai';

const client = new OpenAI({
  apiKey: 'your-blueeagle-api-key',
  baseURL: 'https://ahg.codes/v1',
});

const response = await client.chat.completions.create({
  model: 'gpt-4o',
  messages: [{ role: 'user', content: 'Hello, BlueEagle!' }],
});
console.log(response.choices[0].message.content);
```

> 📁 更多完整示例请查看 [`/examples`](./examples) 目录。

---

## 💰 充值与计费 | Pricing

### 计费规则

| 项目 | 蓝鹰AI网关 | 官方定价对比 |
|------|-----------|-------------|
| 充值比例 | **1 : 1**（1 元 = 1 美元额度） | 无汇率损耗 |
| 消耗倍率 | **0.09x** | 官方 9% 价格 |
| 计费方式 | 按量计费，用多少扣多少 | 精确到 token |
| 额度有效期 | **永久有效，不清零** | 无时间限制 |

### 成本示例

以 **GPT-4o** 为例（官方输入 $5 / 1M tokens，输出 $15 / 1M tokens）：

| 场景 | 官方成本（美元） | 蓝鹰成本（人民币） | 节省比例 |
|------|----------------|-------------------|---------|
| 输入 1M tokens | $5.00 | ¥0.45 | **91% ↓** |
| 输出 1M tokens | $15.00 | ¥1.35 | **91% ↓** |
| 一次普通对话（2K 输入 + 500 输出） | ~$0.0175 | ~¥0.0016 | **91% ↓** |

> 💡 **无需预存大额套餐，无最低消费，余额永久有效。**

---

## ⚔️ 竞品对比 | Comparison

| 维度 | 蓝鹰AI网关 | 普通中转站A | 普通中转站B | 官方直调 |
|------|-----------|-----------|-----------|---------|
| **价格倍率** | **0.09x** | 0.5x ~ 1.0x | 0.3x ~ 0.8x | 1.0x |
| **号池类型** | **100% 原生官方** | 共享/逆向 | 共享/逆向 | 原生官方 |
| **充值比例** | **1:1（无损耗）** | 复杂汇率 | 复杂汇率 | - |
| **额度有效期** | **永久有效** | 常有时限 | 常有时限 | - |
| **故障切换** | **毫秒级自动** | 手动/无 | 手动/无 | 无 |
| **负载均衡** | **多账号智能** | 单点/无 | 单点/无 | 无 |
| **免费测试** | ✅ 注册即送 | ❌ 或极少 | ❌ 或极少 | 官方 $5 |

---

## 🏗️ 架构特性 | Architecture

```
┌─────────────────────────────────────────────┐
│           蓝鹰AI网关 BlueEagle Gateway        │
│  ┌─────────────┐    ┌─────────────────────┐  │
│  │  智能路由层   │───▶│  多账号负载均衡引擎   │  │
│  └─────────────┘    └─────────────────────┘  │
│         │                    │                │
│         ▼                    ▼                │
│  ┌─────────────┐    ┌─────────────────────┐  │
│  │ 毫秒级故障切换 │    │  原生官方号池调度器   │  │
│  └─────────────┘    └─────────────────────┘  │
│         │                    │                │
│         └────────┬───────────┘                │
│                  ▼                           │
│    ┌─────┬─────┬─────┬─────┬─────┐          │
│    │OpenAI│Claude│Gemini│Anti │ ... │          │
│    │官方号池│官方号池│官方号池│官方号池│      │
│    └─────┴─────┴─────┴─────┴─────┘          │
└─────────────────────────────────────────────┘
```

- **智能路由**：根据模型类型、地区延迟、账号余量自动选择最优官方号池
- **故障切换**：单点异常毫秒级无感知切换，保障业务连续性
- **零二次中转**：直连官方，无中间层篡改请求或响应

---

## 📞 联系与支持 | Support

- 🌐 **官方网站**: [https://ahg.codes](https://ahg.codes)
- 📧 **商务合作**: 请通过官网联系表单
- 💬 **技术支持**: 请通过官网工单系统提交

---

## ⚠️ 免责声明 | Disclaimer

1. 蓝鹰AI网关仅作为官方API的统一接入与调度平台，所有模型能力、输出内容及使用政策均遵循各官方服务商条款。
2. 用户应确保其使用行为符合所在国家/地区法律法规以及各AI服务商的可接受使用政策（AUP）。
3. 价格与支持的模型可能随官方调整而变化，请以 [ahg.codes](https://ahg.codes) 实时信息为准。
4. 本仓库仅供技术展示与宣传用途，最终服务条款以官方网站为准。

---

<div align="center">

**Made with 💙 by BlueEagle Team**

[🔝 回到顶部](#-蓝鹰ai网关--blueeagle-ai-gateway)

</div>
