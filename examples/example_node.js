/**
 * BlueEagle AI Gateway - Node.js 调用示例
 * 官方文档: https://ahg.codes
 */

import OpenAI from 'openai';

const client = new OpenAI({
  apiKey: 'your-blueeagle-api-key', // 从 https://ahg.codes 获取
  baseURL: 'https://ahg.codes/v1',
});

async function chatCompletion() {
  /** 基础对话示例 */
  const response = await client.chat.completions.create({
    model: 'gpt-4o',
    messages: [
      { role: 'system', content: 'You are a helpful assistant.' },
      { role: 'user', content: '用一句话介绍蓝鹰AI网关' },
    ],
    temperature: 0.7,
    max_tokens: 1000,
  });
  console.log('=== GPT-4o 回复 ===');
  console.log(response.choices[0].message.content);
}

async function streamChat() {
  /** 流式输出示例 */
  const stream = await client.chat.completions.create({
    model: 'gemini-1.5-pro',
    messages: [{ role: 'user', content: '写一段关于AI网关的短文' }],
    stream: true,
  });

  console.log('\n=== Gemini 1.5 Pro 流式回复 ===');
  for await (const chunk of stream) {
    const content = chunk.choices[0]?.delta?.content;
    if (content) {
      process.stdout.write(content);
    }
  }
  console.log();
}

async function listModels() {
  /** 列出可用模型 */
  const models = await client.models.list();
  console.log('\n=== 可用模型列表（前10个）===');
  models.data.slice(0, 10).forEach((m) => {
    console.log(`- ${m.id}`);
  });
}

async function functionCalling() {
  /** Function Calling 示例 */
  const tools = [
    {
      type: 'function',
      function: {
        name: 'get_weather',
        description: '获取指定城市的天气信息',
        parameters: {
          type: 'object',
          properties: {
            city: { type: 'string', description: '城市名称' },
          },
          required: ['city'],
        },
      },
    },
  ];

  const response = await client.chat.completions.create({
    model: 'gpt-4o',
    messages: [{ role: 'user', content: '北京今天天气怎么样？' }],
    tools,
    tool_choice: 'auto',
  });

  console.log('\n=== Function Calling 结果 ===');
  console.log(JSON.stringify(response.choices[0].message.tool_calls, null, 2));
}

async function main() {
  console.log('🦅 BlueEagle AI Gateway - Node.js Examples\n');

  try {
    await chatCompletion();
    await streamChat();
    await listModels();
    await functionCalling();
  } catch (error) {
    console.error('调用出错:', error.message);
  }
}

main();
