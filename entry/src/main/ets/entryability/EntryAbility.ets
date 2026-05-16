import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';

const TAG: string = 'EntryAbility';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, TAG, 'onCreate');
  }

  onDestroy(): void {
    hilog.info(0x0000, TAG, 'onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, TAG, 'onWindowStageCreate');
    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        hilog.error(0x0000, TAG, 'Failed to load content: ' + JSON.stringify(err));
        return;
      }
      hilog.info(0x0000, TAG, 'Succeeded in loading content');
    });
  }

  onWindowStageDestroy(): void {
    hilog.info(0x0000, TAG, 'onWindowStageDestroy');
  }

  onForeground(): void {
    hilog.info(0x0000, TAG, 'onForeground');
  }

  onBackground(): void {
    hilog.info(0x0000, TAG, 'onBackground');
  }
}
