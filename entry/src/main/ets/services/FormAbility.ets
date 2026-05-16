import { FormExtensionAbility, formBindingData } from '@kit.FormKit';
import { Want } from '@kit.AbilityKit';

interface FormData {
  title: string;
  content: string;
  updateTime: string;
}

export default class FormAbility extends FormExtensionAbility {
  onAddForm(want: Want): formBindingData.FormBindingData {
    const data: FormData = {
      title: 'HarmonyCraft',
      content: 'AI 生成卡片',
      updateTime: new Date().toLocaleTimeString()
    };
    return formBindingData.createFormBindingData(data);
  }

  onUpdateForm(formId: string): void {
    const data: FormData = {
      title: 'HarmonyCraft',
      content: '卡片已更新',
      updateTime: new Date().toLocaleTimeString()
    };
    formBindingData.createFormBindingData(data);
  }

  onFormEvent(formId: string, message: string): void {
    // 处理卡片事件
  }

  onRemoveForm(formId: string): void {
    // 清理卡片资源
  }
}
