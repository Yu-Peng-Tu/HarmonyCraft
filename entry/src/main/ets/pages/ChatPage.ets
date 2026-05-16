import { Theme } from '../utils/Theme';
import { router } from '@kit.ArkUI';
import { ChatMessage, ChatPageParams } from '../models/Models';
import { CraftIcon } from '../components/CraftIcon';
import { AIAvatar } from '../components/AIAvatar';
import { SkeletonRect } from '../components/Skeleton';

const SUGGESTIONS: string[] = [
  '登录页面', '待办清单', '个人中心', '新闻卡片', '设置页面',
  '音乐播放器', '聊天界面', '天气卡片', '数据表格', '计数器'
];

interface DemoCodeItem {
  keywords: string[];
  name: string;
  response: string;
  description: string;
  code: string;
}

const DEMO_CODES: DemoCodeItem[] = [
  {
    keywords: ['计数', '按钮', 'counter', '点击', '加一'],
    name: 'CounterPage',
    response: '好的，我为你设计了一个计数器界面，带有点击效果。',
    description: '这个计数器采用了居中大数字设计，配合胶囊按钮，整体风格简洁明快。使用了 @State 管理计数状态，点击按钮即可触发状态更新，数字会实时变化。',
    code: `@Entry\n@Component\nstruct CounterPage {\n  @State count: number = 0\n\n  build() {\n    Column({ space: 20 }) {\n      Text('计数器')\n        .fontSize(24)\n        .fontWeight(FontWeight.Bold)\n      Text(this.count.toString())\n        .fontSize(48)\n        .fontColor(Theme.PRIMARY)\n      Button('点击 +1')\n        .type(ButtonType.Capsule)\n        .backgroundColor(Theme.PRIMARY)\n        .onClick(() => this.count++)\n    }\n    .width('100%')\n    .height('100%')\n    .justifyContent(FlexAlign.Center)\n  }\n}`
  },
  {
    keywords: ['登录', '表单', 'login', '密码', '账号', '注册', '联系', '验证'],
    name: 'LoginPage',
    response: '已为你设计好登录界面，包含账号输入和密码输入。',
    description: '登录界面采用垂直居中布局，包含用户名和密码输入框，均使用了圆角背景样式提升视觉舒适度。密码输入框设置了 Password 类型保护隐私，登录按钮使用了胶囊样式并占满宽度，点击感明确。',
    code: `@Entry\n@Component\nstruct LoginPage {\n  @State username: string = ''\n  @State password: string = ''\n\n  build() {\n    Column({ space: 16 }) {\n      Text('用户登录')\n        .fontSize(24)\n        .fontWeight(FontWeight.Bold)\n      TextInput({ placeholder: '请输入用户名' })\n        .height(48)\n        .backgroundColor(Theme.BG_INPUT)\n        .borderRadius(8)\n      TextInput({ placeholder: '请输入密码' })\n        .type(InputType.Password)\n        .height(48)\n        .backgroundColor(Theme.BG_INPUT)\n        .borderRadius(8)\n      Button('登录')\n        .type(ButtonType.Capsule)\n        .backgroundColor(Theme.PRIMARY)\n        .width('100%')\n        .height(48)\n    }\n    .padding(24)\n    .width('100%')\n    .height('100%')\n    .justifyContent(FlexAlign.Center)\n  }\n}`
  },
  {
    keywords: ['待办', '清单', 'todo', '任务'],
    name: 'TodoPage',
    response: '已为你设计好待办清单界面，可以添加和管理任务。',
    description: '待办清单包含任务列表和底部输入区。使用 List 组件展示任务，支持滚动查看。底部输入栏配合圆形添加按钮，方便快速新增任务。整体采用卡片式列表，视觉上层次分明。',
    code: `@Entry\n@Component\nstruct TodoPage {\n  @State todos: string[] = ['学习ArkTS', '写代码', '测试应用']\n  @State newTask: string = ''\n\n  build() {\n    Column({ space: 12 }) {\n      Text('待办清单')\n        .fontSize(22)\n        .fontWeight(FontWeight.Bold)\n      List() {\n        ForEach(this.todos, (item: string, idx: number) => {\n          ListItem() {\n            Text(item)\n              .fontSize(15)\n              .padding(12)\n          }\n          .width('100%')\n          .backgroundColor(Theme.BG_CARD)\n          .borderRadius(8)\n        })\n      }\n      .layoutWeight(1)\n      Row({ space: 8 }) {\n        TextInput({ placeholder: '新任务...', text: $$this.newTask })\n          .layoutWeight(1)\n          .height(44)\n        Button('+')\n          .type(ButtonType.Circle)\n          .backgroundColor(Theme.PRIMARY)\n          .onClick(() => {\n            if (this.newTask.length > 0) {\n              this.todos.push(this.newTask)\n              this.newTask = ''\n            }\n          })\n      }\n      .width('100%')\n    }\n    .padding(16)\n    .width('100%')\n    .height('100%')\n  }\n}`
  },
  {
    keywords: ['新闻', '卡片', 'news', '图文', '展示'],
    name: 'NewsCardPage',
    response: '已为你设计好新闻卡片界面，支持标题和摘要展示。',
    description: '新闻卡片采用卡片式布局，包含标题、摘要和日期信息。标题支持最多两行显示，超出自动省略。底部使用 Row 排布日期和阅读全文链接，整体结构清晰，信息层级分明。',
    code: `@Entry\n@Component\nstruct NewsCardPage {\n  @State title: string = '鸿蒙生态蓬勃发展'\n  @State summary: string = 'HarmonyOS NEXT 正式发布，全新星盾安全架构助力万物互联。'\n\n  build() {\n    Column({ space: 12 }) {\n      Text(this.title)\n        .fontSize(18)\n        .fontWeight(FontWeight.Bold)\n        .fontColor(Theme.TEXT_PRIMARY)\n        .maxLines(2)\n        .textOverflow({ overflow: TextOverflow.Ellipsis })\n      Text(this.summary)\n        .fontSize(14)\n        .fontColor(Theme.TEXT_SECONDARY)\n        .maxLines(3)\n        .textOverflow({ overflow: TextOverflow.Ellipsis })\n      Row({ space: 8 }) {\n        Text('2026-05-15')\n          .fontSize(12)\n          .fontColor(Theme.TEXT_TERTIARY)\n        Blank()\n        Text('阅读全文 ›')\n          .fontSize(12)\n          .fontColor(Theme.PRIMARY)\n      }\n      .width('100%')\n    }\n    .padding(16)\n    .width('100%')\n    .backgroundColor(Theme.BG_CARD)\n    .borderRadius(12)\n    .border({ width: 1, color: Theme.BORDER })\n  }\n}`
  },
  {
    keywords: ['设置', '配置', 'setting', '选项', '开关', '对话框', '弹窗', '提示'],
    name: 'SettingsPage',
    response: '已为你设计好设置界面，包含通知开关和深色模式切换。',
    description: '设置页面使用分组列表形式展示选项，每个设置项包含文字说明和开关控件。使用了 Toggle 组件实现开关效果，选中态采用主题琥珀色高亮，视觉反馈明确。',
    code: `@Entry\n@Component\nstruct SettingsPage {\n  @State notifyOn: boolean = true\n  @State darkMode: boolean = false\n\n  build() {\n    Column({ space: 0 }) {\n      Text('设置')\n        .fontSize(22)\n        .fontWeight(FontWeight.Bold)\n        .fontColor(Theme.TEXT_PRIMARY)\n        .padding(16)\n\n      Column({ space: 0 }) {\n        Row({ space: 12 }) {\n          Text('消息通知')\n            .fontSize(15)\n            .fontColor(Theme.TEXT_PRIMARY)\n            .layoutWeight(1)\n          Toggle({ type: ToggleType.Switch, isOn: this.notifyOn })\n            .selectedColor(Theme.PRIMARY)\n        }\n        .width('100%')\n        .height(52)\n        .padding({ left: 16, right: 16 })\n        .border({ width: { bottom: 1 }, color: Theme.BORDER })\n\n        Row({ space: 12 }) {\n          Text('深色模式')\n            .fontSize(15)\n            .fontColor(Theme.TEXT_PRIMARY)\n            .layoutWeight(1)\n          Toggle({ type: ToggleType.Switch, isOn: this.darkMode })\n            .selectedColor(Theme.PRIMARY)\n        }\n        .width('100%')\n        .height(52)\n        .padding({ left: 16, right: 16 })\n      }\n      .width('100%')\n      .backgroundColor(Theme.BG_CARD)\n      .borderRadius(12)\n      .border({ width: 1, color: Theme.BORDER })\n      .margin(16)\n    }\n    .width('100%')\n    .height('100%')\n    .backgroundColor(Theme.BG_MAIN)\n  }\n}`
  },
  {
    keywords: ['数据', '表格', '图表', 'list', 'table', '商品', '文章', '搜索', '列表'],
    name: 'DataListPage',
    response: '已为你设计好数据列表界面，带表头和数据行展示。',
    description: '数据列表使用表格形式展示，首行作为表头使用不同背景色区分。每行数据等宽分布，使用了 ForEach 循环渲染数据行，结构清晰易于扩展。',
    code: `@Entry\n@Component\nstruct DataListPage {\n  @State items: string[][] = [\n    ['项目', '状态', '进度'],\n    ['首页开发', '进行中', '80%'],\n    ['接口联调', '待开始', '0%'],\n    ['UI优化', '已完成', '100%']\n  ]\n\n  build() {\n    Column({ space: 12 }) {\n      Text('项目进度')\n        .fontSize(20)\n        .fontWeight(FontWeight.Bold)\n        .fontColor(Theme.TEXT_PRIMARY)\n\n      Column({ space: 0 }) {\n        ForEach(this.items, (row: string[], rIdx: number) => {\n          Row({ space: 0 }) {\n            ForEach(row, (cell: string, cIdx: number) => {\n              Text(cell)\n                .fontSize(13)\n                .fontColor(rIdx === 0 ? Theme.TEXT_TERTIARY : Theme.TEXT_PRIMARY)\n                .fontWeight(rIdx === 0 ? FontWeight.Bold : FontWeight.Normal)\n                .layoutWeight(1)\n                .textAlign(TextAlign.Center)\n            })\n          }\n          .width('100%')\n          .height(44)\n          .backgroundColor(rIdx === 0 ? Theme.BG_INPUT : Theme.BG_CARD)\n          .border({ width: { bottom: 1 }, color: Theme.BORDER })\n        })\n      }\n      .width('100%')\n      .backgroundColor(Theme.BG_CARD)\n      .borderRadius(8)\n      .border({ width: 1, color: Theme.BORDER })\n    }\n    .padding(16)\n    .width('100%')\n    .height('100%')\n    .backgroundColor(Theme.BG_MAIN)\n  }\n}`
  },
  {
    keywords: ['音乐', '播放', 'music', '音频', '歌曲', 'player'],
    name: 'MusicPage',
    response: '已为你设计好音乐播放器界面，带有专辑封面和控制按钮。',
    description: '音乐播放器采用居中布局，顶部为专辑封面占位区，下方展示歌曲信息和进度条。控制区包含上一首/播放/下一首按钮，播放按钮使用主题色圆形设计，整体风格沉浸感十足。',
    code: `@Entry\n@Component\nstruct MusicPage {\n  @State playing: boolean = false\n  @State progress: number = 35\n\n  build() {\n    Column({ space: 0 }) {\n      Column()\n        .width(200)\n        .height(200)\n        .backgroundColor(Theme.PRIMARY)\n        .borderRadius(20)\n        .margin({ bottom: 32 })\n\n      Text('夏日微风')\n        .fontSize(20)\n        .fontWeight(FontWeight.Bold)\n        .margin({ bottom: 8 })\n      Text('创作者 · HarmonyOS')\n        .fontSize(14)\n        .fontColor(Theme.TEXT_SECONDARY)\n        .margin({ bottom: 24 })\n\n      Slider({ value: this.progress, min: 0, max: 100 })\n        .width('80%')\n        .margin({ bottom: 24 })\n\n      Row({ space: 0 }) {\n        Button('⏮')\n          .backgroundColor(Color.Transparent)\n          .fontColor(Theme.TEXT_SECONDARY)\n        Button(this.playing ? '⏸' : '▶')\n          .backgroundColor(Theme.PRIMARY)\n          .fontColor(Theme.TEXT_LIGHT)\n          .width(56)\n          .height(56)\n          .borderRadius(28)\n        Button('⏭')\n          .backgroundColor(Color.Transparent)\n          .fontColor(Theme.TEXT_SECONDARY)\n      }\n      .width('60%')\n      .justifyContent(FlexAlign.SpaceEvenly)\n    }\n    .width('100%')\n    .height('100%')\n    .justifyContent(FlexAlign.Center)\n    .backgroundColor(Theme.BG_MAIN)\n  }\n}`
  },
  {
    keywords: ['聊天', '消息', 'chat', '对话', '通讯', 'message'],
    name: 'ChatRoomPage',
    response: '已为你设计好聊天界面，支持消息列表和输入发送。',
    description: '聊天界面分为消息列表区和底部输入区。消息使用 List 展示，每条消息采用卡片样式气泡。底部输入栏配合发送按钮，支持文字消息发送，整体布局简洁实用。',
    code: `@Entry\n@Component\nstruct ChatRoomPage {\n  @State message: string = ''\n  @State messages: string[] = ['你好！', '这是一个聊天界面模板。', '支持发送文字消息。']\n\n  build() {\n    Column({ space: 0 }) {\n      Text('聊天')\n        .fontSize(20)\n        .fontWeight(FontWeight.Bold)\n        .padding(16)\n\n      List({ space: 8 }) {\n        ForEach(this.messages, (msg: string) => {\n          ListItem() {\n            Column() {\n              Text(msg)\n                .fontSize(15)\n                .fontColor(Theme.TEXT_PRIMARY)\n                .padding(12)\n                .backgroundColor(Theme.BG_CARD)\n                .borderRadius(12)\n            }\n            .alignItems(HorizontalAlign.Start)\n            .width('100%')\n            .padding({ horizontal: 16 })\n          }\n        })\n      }\n      .layoutWeight(1)\n\n      Row({ space: 8 }) {\n        TextInput({ placeholder: '输入消息', text: $$this.message })\n          .layoutWeight(1)\n          .height(44)\n        Button('发送')\n          .height(44)\n          .backgroundColor(Theme.PRIMARY)\n          .fontColor(Theme.TEXT_LIGHT)\n          .onClick(() => {\n            if (this.message.length > 0) {\n              this.messages.push(this.message)\n              this.message = ''\n            }\n          })\n      }\n      .padding(12)\n      .backgroundColor(Theme.BG_CARD)\n    }\n    .width('100%')\n    .height('100%')\n    .backgroundColor(Theme.BG_MAIN)\n  }\n}`
  },
  {
    keywords: ['天气', 'weather', '温度', '预报', '气象'],
    name: 'WeatherPage',
    response: '已为你设计好天气卡片界面，展示城市和温度信息。',
    description: '天气卡片使用主题色背景，居中展示城市、温度和天气状况。底部三列信息展示湿度、风速和气压数据，数字使用白色高亮，整体风格清爽醒目，信息一目了然。',
    code: `@Entry\n@Component\nstruct WeatherPage {\n  @State city: string = '深圳'\n  @State temp: number = 28\n  @State condition: string = '晴'\n\n  build() {\n    Column({ space: 0 }) {\n      Text(this.city)\n        .fontSize(18)\n        .fontColor('rgba(255,255,255,0.9)')\n\n      Text(this.temp.toString() + '°')\n        .fontSize(64)\n        .fontWeight(FontWeight.Bold)\n        .fontColor(Theme.TEXT_LIGHT)\n        .margin({ vertical: 8 })\n\n      Text(this.condition)\n        .fontSize(16)\n        .fontColor('rgba(255,255,255,0.8)')\n\n      Row({ space: 0 }) {\n        Column({ space: 4 }) {\n          Text('湿度')\n            .fontSize(12)\n            .fontColor('rgba(255,255,255,0.7)')\n          Text('65%')\n            .fontSize(14)\n            .fontColor(Theme.TEXT_LIGHT)\n        }\n        Column({ space: 4 }) {\n          Text('风速')\n            .fontSize(12)\n            .fontColor('rgba(255,255,255,0.7)')\n          Text('3级')\n            .fontSize(14)\n            .fontColor(Theme.TEXT_LIGHT)\n        }\n        Column({ space: 4 }) {\n          Text('气压')\n            .fontSize(12)\n            .fontColor('rgba(255,255,255,0.7)')\n          Text('1013')\n            .fontSize(14)\n            .fontColor(Theme.TEXT_LIGHT)\n        }\n      }\n      .width('100%')\n      .justifyContent(FlexAlign.SpaceEvenly)\n      .margin({ top: 20 })\n    }\n    .width('100%')\n    .height('100%')\n    .padding(32)\n    .backgroundColor(Theme.PRIMARY)\n    .justifyContent(FlexAlign.Center)\n  }\n}`
  },
  {
    keywords: ['个人', 'profile', '我的', '用户', '中心', 'account', '导航', 'tab'],
    name: 'ProfileCenterPage',
    response: '已为你设计好个人中心界面，展示头像和常用功能入口。',
    description: '个人中心采用顶部头像+信息展示，下方为功能列表入口。头像使用圆形占位，功能列表包含订单、收藏、历史等常用入口，带右侧箭头指示，结构清晰便于导航。',
    code: `@Entry\n@Component\nstruct ProfileCenterPage {\n  @State orders: number = 12\n  @State favorites: number = 5\n  @State history: number = 128\n\n  build() {\n    Column({ space: 0 }) {\n      Column()\n        .width(80)\n        .height(80)\n        .backgroundColor(Theme.PRIMARY)\n        .borderRadius(40)\n        .margin({ top: 40, bottom: 16 })\n\n      Text('用户名称')\n        .fontSize(20)\n        .fontWeight(FontWeight.Bold)\n        .margin({ bottom: 4 })\n\n      Text('ID: 88021234')\n        .fontSize(13)\n        .fontColor(Theme.TEXT_SECONDARY)\n        .margin({ bottom: 32 })\n\n      Column({ space: 0 }) {\n        this.ProfileRow('我的订单', this.orders.toString())\n        this.ProfileRow('我的收藏', this.favorites.toString())\n        this.ProfileRow('浏览历史', this.history.toString())\n        this.ProfileRow('地址管理', '')\n        this.ProfileRow('客服中心', '')\n      }\n      .width('100%')\n      .padding(16)\n      .backgroundColor(Theme.BG_CARD)\n      .borderRadius(16)\n    }\n    .width('100%')\n    .height('100%')\n    .padding(20)\n    .backgroundColor(Theme.BG_MAIN)\n    .alignItems(HorizontalAlign.Center)\n  }\n\n  @Builder\n  ProfileRow(label: string, value: string) {\n    Row({ space: 0 }) {\n      Text(label)\n        .fontSize(15)\n        .fontColor(Theme.TEXT_PRIMARY)\n      Blank()\n      Row({ space: 4 }) {\n        if (value.length > 0) {\n          Text(value)\n            .fontSize(13)\n            .fontColor(Theme.TEXT_TERTIARY)\n        }\n        Text('›')\n          .fontSize(16)\n          .fontColor(Theme.TEXT_TERTIARY)\n      }\n    }\n    .width('100%')\n    .justifyContent(FlexAlign.SpaceBetween)\n    .padding({ top: 14, bottom: 14 })\n    .border({ width: { bottom: 1 }, color: Theme.BORDER })\n  }\n}`
  }
];

@Entry
@Component
struct ChatPage {
  @State messages: ChatMessage[] = [
    {
      role: 'assistant',
      content: '你好！我是你的界面设计师。\n\n告诉我你想要什么页面，我来帮你设计。比如：\n• "帮我做一个登录页面"\n• "设计一个待办清单"\n• "做一个新闻卡片"',
      timestamp: Date.now(),
      isCode: false
    }
  ];
  @State inputText: string = '';
  @State isLoading: boolean = false;
  @State currentCode: string = '';
  @State autoPrompt: string = '';
  @State isRecording: boolean = false;
  @State showConfirmDialog: boolean = false;
  @State pageOpacity: number = 0;
  private listScroller: ListScroller = new ListScroller();

  onPageShow(): void {
    this.pageOpacity = 1;
    const params: object | undefined = router.getParams();
    if (params) {
      const p = params as ChatPageParams;
      if (p.prompt && p.prompt.length > 0 && this.autoPrompt !== p.prompt) {
        this.autoPrompt = p.prompt;
        this.addUserMessage(p.prompt);
        this.simulateAIResponse(p.prompt);
      }
    }
  }

  private addUserMessage(text: string): void {
    const msg: ChatMessage = {
      role: 'user',
      content: text,
      timestamp: Date.now(),
      isCode: false
    };
    this.messages.push(msg);
    this.scrollToBottom();
  }

  private addAssistantMessage(text: string, isCode: boolean): void {
    const msg: ChatMessage = {
      role: 'assistant',
      content: text,
      timestamp: Date.now(),
      isCode: isCode
    };
    this.messages.push(msg);
    this.scrollToBottom();
  }

  private scrollToBottom(): void {
    setTimeout(() => {
      if (this.messages.length > 0) {
        this.listScroller.scrollToIndex(this.messages.length - 1);
      }
    }, 50);
  }

  private findDemoCode(query: string): DemoCodeItem {
    const q: string = query.toLowerCase();

    // 精确关键词优先匹配，避免宽泛词干扰
    if (q.includes('天气') || q.includes('weather') || q.includes('温度') || q.includes('预报')) {
      return DEMO_CODES[8];
    }
    if (q.includes('音乐') || q.includes('music') || q.includes('播放') || q.includes('歌曲')) {
      return DEMO_CODES[6];
    }
    if (q.includes('聊天') || q.includes('chat') || q.includes('message') || q.includes('通讯')) {
      return DEMO_CODES[7];
    }
    if (q.includes('计数') || q.includes('counter')) {
      return DEMO_CODES[0];
    }
    if (q.includes('登录') || q.includes('login') || q.includes('密码') || q.includes('账号')) {
      return DEMO_CODES[1];
    }
    if (q.includes('待办') || q.includes('todo') || q.includes('任务')) {
      return DEMO_CODES[2];
    }
    if (q.includes('设置') || q.includes('setting') || q.includes('开关')) {
      return DEMO_CODES[4];
    }
    if (q.includes('新闻') || q.includes('news')) {
      return DEMO_CODES[3];
    }
    if (q.includes('个人') || q.includes('profile') || q.includes('我的')) {
      return DEMO_CODES[9];
    }

    // 通用关键词匹配（模板市场兜底）
    for (let i: number = 0; i < DEMO_CODES.length; i++) {
      const demo: DemoCodeItem = DEMO_CODES[i];
      for (let j: number = 0; j < demo.keywords.length; j++) {
        if (q.includes(demo.keywords[j])) {
          return demo;
        }
      }
    }
    return {
      keywords: [],
      name: 'CustomPage',
      response: '收到！我为你设计了一个通用界面，你可以在此基础上继续调整：',
      description: '这是一个通用页面框架，采用居中布局，包含标题、说明文字和操作按钮。你可以根据实际需求替换内容，添加更多组件和功能。',
      code: `@Entry\n@Component\nstruct CustomPage {\n  build() {\n    Column({ space: 20 }) {\n      Text('自定义页面')\n        .fontSize(24)\n        .fontWeight(FontWeight.Bold)\n        .fontColor(Theme.TEXT_PRIMARY)\n      Text('这是根据你的描述生成的界面框架')\n        .fontSize(14)\n        .fontColor(Theme.TEXT_SECONDARY)\n      Button('开始编辑')\n        .type(ButtonType.Capsule)\n        .backgroundColor(Theme.PRIMARY)\n        .fontColor(Theme.TEXT_LIGHT)\n        .height(44)\n        .padding({ left: 32, right: 32 })\n    }\n    .width('100%')\n    .height('100%')\n    .justifyContent(FlexAlign.Center)\n    .backgroundColor(Theme.BG_MAIN)\n  }\n}`
    };
  }

  private async simulateAIResponse(query: string): Promise<void> {
    this.isLoading = true;
    await this.delay(500);

    const demo: DemoCodeItem = this.findDemoCode(query);
    const thinkingSteps: string[] = [
      '正在理解你的需求...',
      '正在分析页面布局结构...',
      '正在生成组件代码...',
      '正在优化样式细节...'
    ];

    for (let i: number = 0; i < thinkingSteps.length; i++) {
      const stepMsg: ChatMessage = {
        role: 'assistant',
        content: thinkingSteps[i],
        timestamp: Date.now(),
        isCode: false
      };
      this.messages.push(stepMsg);
      this.scrollToBottom();
      await this.delay(i < thinkingSteps.length - 1 ? 600 : 800);
      this.messages.pop();
    }

    // 分段输出：确认消息
    this.addAssistantMessage(demo.response, false);
    await this.delay(400);

    // 分段输出：设计说明
    this.addAssistantMessage(demo.description, false);
    await this.delay(300);

    // 代码块
    this.addAssistantMessage(demo.code, true);

    this.currentCode = demo.code;
    this.isLoading = false;
    this.scrollToBottom();
  }

  private sendMessage(): void {
    const text: string = this.inputText.trim();
    if (text.length === 0 || this.isLoading) return;
    this.addUserMessage(text);
    this.inputText = '';
    this.simulateAIResponse(text);
  }

  private sendSuggestion(suggestion: string): void {
    this.addUserMessage(suggestion);
    this.simulateAIResponse(suggestion);
  }

  private delay(ms: number): Promise<void> {
    return new Promise<void>((resolve: () => void) => setTimeout(resolve, ms));
  }

  private async startVoiceInput(): Promise<void> {
    if (this.isRecording || this.isLoading) return;
    this.isRecording = true;
    await this.delay(1200);
    this.isRecording = false;
    const idx: number = Math.floor(Math.random() * SUGGESTIONS.length);
    const voiceText: string = '帮我做一个' + SUGGESTIONS[idx];
    this.inputText = voiceText;
    await this.delay(300);
    this.sendMessage();
  }

  private goToPreview(): void {
    if (this.currentCode.length > 0) {
      router.pushUrl({ url: 'pages/CodePreview', params: { code: this.currentCode } });
    }
  }

  private formatTime(ts: number): string {
    const d: Date = new Date(ts);
    const h: number = d.getHours();
    const m: number = d.getMinutes();
    const hs: string = h < 10 ? '0' + h.toString() : h.toString();
    const ms: string = m < 10 ? '0' + m.toString() : m.toString();
    return hs + ':' + ms;
  }

  private confirmNewChat(): void {
    if (this.messages.length <= 1) {
      this.resetChat();
      return;
    }
    this.showConfirmDialog = true;
  }

  private resetChat(): void {
    this.messages = [
      {
        role: 'assistant',
        content: '你好！我是你的界面设计师。\n\n告诉我你想要什么页面，我来帮你设计。',
        timestamp: Date.now(),
        isCode: false
      }
    ];
    this.currentCode = '';
    this.inputText = '';
    this.showConfirmDialog = false;
  }

  build() {
    Column({ space: 0 }) {
      // 顶部AppBar
      Row() {
        Button() {
          CraftIcon({ iconName: 'back', iconSize: 22, color: Theme.TEXT_PRIMARY })
        }
        .type(ButtonType.Circle)
        .width(40)
        .height(40)
        .backgroundColor(Theme.BG_INPUT)
        .onClick(() => router.back())

        Text('HarmonyCraft')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor(Theme.TEXT_PRIMARY)
          .layoutWeight(1)

        Button() {
          Row({ space: 4 }) {
            CraftIcon({ iconName: 'add', iconSize: 14, color: Theme.PRIMARY })
            Text('新对话')
              .fontSize(13)
              .fontColor(Theme.PRIMARY)
          }
        }
        .type(ButtonType.Capsule)
        .backgroundColor(Theme.USER_BUBBLE_BG)
        .height(32)
        .padding({ left: 12, right: 12 })
        .onClick(() => this.confirmNewChat())
      }
      .width('100%')
      .height(56)
      .padding({ left: 16, right: 16 })
      .backgroundColor(Theme.BG_CARD)
      .border({ width: { bottom: 1 }, color: Theme.BORDER })

      // 消息列表
      List({ space: 12, scroller: this.listScroller }) {
        ForEach(this.messages, (msg: ChatMessage) => {
          ListItem() {
            this.MessageBubbleBuilder(msg)
          }
        })

        if (this.isLoading) {
          ListItem() {
            Row({ space: 8 }) {
              AIAvatar({ avatarSize: 28 })

              Column({ space: 8 }) {
                SkeletonRect({ widthVal: 120, heightVal: 14, radius: 7 })
                SkeletonRect({ widthVal: 80, heightVal: 14, radius: 7 })
                Text('正在设计中...')
                  .fontSize(11)
                  .fontColor(Theme.TEXT_TERTIARY)
                  .margin({ top: 4 })
              }
              .padding({ left: 12, right: 12, top: 10, bottom: 10 })
              .backgroundColor(Theme.AI_BUBBLE_BG)
              .borderRadius(Theme.RADIUS_XL)
            }
            .width('100%')
            .padding({ left: 12, right: 12 })
          }
        }
      }
      .width('100%')
      .layoutWeight(1)
      .padding(12)
      .scrollBar(BarState.Auto)

      // 快捷建议芯片
      if (!this.isLoading) {
        List() {
          ForEach(SUGGESTIONS, (sug: string) => {
            ListItem() {
              Button() {
                Text(sug)
                  .fontSize(12)
                  .fontColor(Theme.TEXT_SECONDARY)
              }
              .type(ButtonType.Capsule)
              .backgroundColor(Theme.BG_CARD)
              .border({ width: 1, color: Theme.BORDER })
              .height(32)
              .padding({ left: 14, right: 14 })
              .onClick(() => this.sendSuggestion(sug))
            }
          })
        }
        .width('100%')
        .height(44)
        .padding({ left: 12, right: 12 })
        .listDirection(Axis.Horizontal)
        .scrollBar(BarState.Off)
      }

      // 新对话确认弹窗
      if (this.showConfirmDialog) {
        Column() {
          Column({ space: 12 }) {
            Text('开始新对话')
              .fontSize(17)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.TEXT_PRIMARY)
            Text('当前对话内容将被清空，是否继续？')
              .fontSize(14)
              .fontColor(Theme.TEXT_SECONDARY)
              .textAlign(TextAlign.Center)
              .width('100%')

            Row({ space: 12 }) {
              Button('取消')
                .fontSize(14)
                .fontColor(Theme.TEXT_SECONDARY)
                .backgroundColor(Theme.BG_INPUT)
                .borderRadius(Theme.RADIUS_MD)
                .layoutWeight(1)
                .height(40)
                .onClick(() => { this.showConfirmDialog = false; })

              Button('确认')
                .fontSize(14)
                .fontColor(Theme.TEXT_LIGHT)
                .backgroundColor(Theme.PRIMARY)
                .borderRadius(Theme.RADIUS_MD)
                .layoutWeight(1)
                .height(40)
                .onClick(() => { this.resetChat(); })
            }
            .width('100%')
            .margin({ top: 8 })
          }
          .width('80%')
          .padding(20)
          .backgroundColor(Theme.BG_CARD)
          .borderRadius(Theme.RADIUS_LG)
          .shadow({ radius: 16, color: Theme.SHADOW_LG, offsetY: 4 })
        }
        .width('100%')
        .height('100%')
        .position({ x: 0, y: 0 })
        .backgroundColor('rgba(45,36,32,0.4)')
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .zIndex(100)
      }

      // 语音输入提示
      if (this.isRecording) {
        Row() {
          Row({ space: 4 }) {
            CraftIcon({ iconName: 'mic', iconSize: 14, color: Theme.PRIMARY })
            Text('正在聆听...')
              .fontSize(13)
              .fontColor(Theme.PRIMARY)
          }
        }
        .width('100%')
        .height(32)
        .justifyContent(FlexAlign.Center)
        .backgroundColor(Theme.USER_BUBBLE_BG)
      }

      // 底部输入栏
      Row({ space: 8 }) {
        Button() {
          CraftIcon({ iconName: 'mic', iconSize: 20, color: this.isRecording ? Theme.TEXT_LIGHT : Theme.TEXT_SECONDARY })
        }
        .type(ButtonType.Circle)
        .width(40)
        .height(40)
        .backgroundColor(this.isRecording ? Theme.PRIMARY : Theme.BG_INPUT)
        .enabled(!this.isLoading)
        .onClick(() => this.startVoiceInput())

        TextArea({ placeholder: this.isRecording ? '正在聆听...' : '比如：帮我做一个登录页面', text: $$this.inputText })
          .placeholderColor(Theme.TEXT_TERTIARY)
          .fontSize(14)
          .height(48)
          .maxLines(4)
          .backgroundColor(Theme.BG_INPUT)
          .borderRadius(20)
          .caretColor(Theme.GOLD)
          .layoutWeight(1)

        Button() {
          CraftIcon({ iconName: 'send', iconSize: 20, color: Theme.TEXT_LIGHT })
        }
        .type(ButtonType.Circle)
        .width(44)
        .height(44)
        .backgroundColor(Theme.PRIMARY)
        .enabled(!this.isLoading && this.inputText.trim().length > 0)
        .onClick(() => this.sendMessage())
      }
      .width('100%')
      .height(72)
      .padding(12)
      .backgroundColor(Theme.BG_CARD)
      .border({ width: { top: 1 }, color: Theme.BORDER })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Theme.BG_MAIN)
    .opacity(this.pageOpacity)
    .animation({ duration: 250, curve: Curve.EaseOut })
  }

  @Builder
  MessageBubbleBuilder(msg: ChatMessage) {
    Row() {
      if (msg.role === 'user') {
        Blank()
      }

      if (msg.role === 'assistant') {
        AIAvatar({ avatarSize: 28 })
          .margin({ right: 8 })
      }

      Column() {
        if (msg.isCode) {
          Column({ space: 8 }) {
            Row({ space: 8 }) {
              CraftIcon({ iconName: 'check', iconSize: 16, color: Theme.SUCCESS })
              Text('界面设计完成！')
                .fontSize(14)
                .fontWeight(FontWeight.Bold)
                .fontColor(Theme.TEXT_PRIMARY)
            }

            Text('点击下面查看预览效果 ›')
              .fontSize(13)
              .fontColor(Theme.PRIMARY)

            Button() {
              Text('查看预览效果')
                .fontSize(13)
                .fontColor(Theme.TEXT_LIGHT)
            }
            .type(ButtonType.Capsule)
            .backgroundColor(Theme.PRIMARY)
            .height(36)
            .padding({ left: 20, right: 20 })
            .onClick(() => this.goToPreview())
          }
          .width('100%')
          .padding(12)
          .backgroundColor(Theme.BG_CARD)
          .borderRadius(Theme.RADIUS_XL)
          .border({ width: 1, color: Theme.BORDER })
        } else {
          Text(msg.content)
            .fontSize(14)
            .fontColor(Theme.TEXT_PRIMARY)
            .lineHeight(20)
        }

        // 时间戳
        if (msg.role === 'assistant' && !msg.isCode) {
          Text(this.formatTime(msg.timestamp))
            .fontSize(10)
            .fontColor(Theme.TEXT_TERTIARY)
            .margin({ top: 4 })
            .alignSelf(ItemAlign.End)
        }
      }
      .constraintSize({ maxWidth: msg.role === 'user' ? '80%' : '85%' })
      .padding(12)
      .backgroundColor(msg.role === 'user' ? Theme.USER_BUBBLE_BG : Theme.AI_BUBBLE_BG)
      .borderRadius(Theme.RADIUS_XL)

      if (msg.role === 'assistant') {
        Blank()
      }
    }
    .width('100%')
    .padding({ left: 12, right: 12 })
  }
}
