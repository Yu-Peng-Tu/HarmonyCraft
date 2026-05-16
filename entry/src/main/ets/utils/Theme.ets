/**
 * HarmonyCraft 设计系统 Theme — 暖色调版本 v2.0
 * 配套: 页面暖色调调整方案
 * 核心: 琥珀陶土系，营造温暖工坊氛围
 */

export class Theme {
  // ========== 主色 ==========
  static readonly PRIMARY: string = '#D4763E';
  static readonly PRIMARY_LIGHT: string = '#E89860';
  static readonly ACCENT: string = '#B85C3D';

  // ========== 辅色 ==========
  static readonly GOLD: string = '#E8B86D';
  static readonly OCHRE: string = '#C49A3C';

  // ========== 功能色（暖调化） ==========
  static readonly SUCCESS: string = '#4A9B6B';
  static readonly WARNING: string = '#D4940A';
  static readonly ERROR: string = '#D4504A';

  // ========== 背景 ==========
  static readonly BG_MAIN: string = '#FAF6F1';
  static readonly BG_CARD: string = '#FFFDF9';
  static readonly BG_INPUT: string = '#F2EDE6';
  static readonly BG_SECONDARY: string = '#F5F0EB';
  static readonly BG_CANVAS: string = '#FDFAF6';

  // ========== 文字 ==========
  static readonly TEXT_PRIMARY: string = '#2D2420';
  static readonly TEXT_SECONDARY: string = '#6B5D54';
  static readonly TEXT_TERTIARY: string = '#9A8E84';
  static readonly TEXT_LIGHT: string = '#FFFFFF';

  // ========== 边框/分割线 ==========
  static readonly BORDER: string = '#E8E2DA';

  // ========== 阴影（暖灰色） ==========
  static readonly SHADOW_SM: string = 'rgba(45,36,32,0.06)';
  static readonly SHADOW_MD: string = 'rgba(45,36,32,0.08)';
  static readonly SHADOW_LG: string = 'rgba(45,36,32,0.12)';
  static readonly SHADOW: string = 'rgba(45,36,32,0.08)';

  // ========== 代码编辑器（暖黑主题 "Sunset Amber"） ==========
  static readonly CODE_BG: string = '#2A2520';
  static readonly CODE_EDITOR_BG: string = '#1E1914';
  static readonly CODE_KEYWORD: string = '#E89860';
  static readonly CODE_STRING: string = '#7AB88A';
  static readonly CODE_COMMENT: string = '#8A7E74';
  static readonly CODE_DECORATOR: string = '#E8B86D';
  static readonly CODE_TYPE: string = '#D4945A';
  static readonly CODE_NUMBER: string = '#D4766E';
  static readonly CODE_OPERATOR: string = '#C4B8AC';
  static readonly CODE_TEXT: string = '#E8E2DA';

  // ========== 消息气泡 ==========
  static readonly USER_BUBBLE_BG: string = '#FDF0E8';
  static readonly AI_BUBBLE_BG: string = '#F5F0EB';

  // ========== 渐变 ==========
  static readonly GRADIENT_BRAND_START: string = '#D4763E';
  static readonly GRADIENT_BRAND_END: string = '#B85C3D';
  static readonly GRADIENT_SUNSET_START: string = '#D4763E';
  static readonly GRADIENT_SUNSET_MID: string = '#C49A3C';
  static readonly GRADIENT_SUNSET_END: string = '#E8B86D';

  // ========== 圆角 ==========
  static readonly RADIUS_SM: number = 8;
  static readonly RADIUS_MD: number = 12;
  static readonly RADIUS_LG: number = 16;
  static readonly RADIUS_XL: number = 20;
}
