import { Theme } from '../utils/Theme';
import { router } from '@kit.ArkUI';
import { ProjectItem, getSavedProjects, deleteProject, renameProject } from '../models/Models';
import { BottomNav } from '../components/BottomNav';
import { CraftIcon } from '../components/CraftIcon';
import { EmptyState } from '../components/EmptyState';

const MOCK_PROJECTS: ProjectItem[] = [
  { id: 'p1', name: '我的待办应用', type: '工具', updateTime: '今天 10:30', status: 'done' },
  { id: 'p2', name: '登录页面组件', type: '表单', updateTime: '昨天 18:20', status: 'done' },
  { id: 'p3', name: '新闻阅读卡片', type: '卡片', updateTime: '5月10日', status: 'done' },
  { id: 'p4', name: '计数器Demo', type: '组件', updateTime: '5月9日', status: 'done' },
  { id: 'p5', name: '数据仪表盘', type: '图表', updateTime: '5月8日', status: 'error' },
  { id: 'p6', name: '设置页面', type: '配置', updateTime: '5月7日', status: 'done' }
];

@Entry
@Component
struct ProjectManage {
  @State projects: ProjectItem[] = MOCK_PROJECTS;
  @State searchText: string = '';
  @State showActionMenu: boolean = false;
  @State selectedProject: ProjectItem = MOCK_PROJECTS[0];
  @State showRenameDialog: boolean = false;
  @State renameValue: string = '';
  @State showDeleteConfirm: boolean = false;
  @State pageOpacity: number = 0;

  onPageShow(): void {
    this.pageOpacity = 1;
    const saved: ProjectItem[] = getSavedProjects();
    if (saved.length > 0) {
      this.projects = saved.concat(MOCK_PROJECTS);
    }
  }

  onPageHide(): void {
    this.pageOpacity = 0;
  }

  private getFilteredProjects(): ProjectItem[] {
    if (this.searchText.length === 0) return this.projects;
    return this.projects.filter((p: ProjectItem) => p.name.includes(this.searchText) || p.type.includes(this.searchText));
  }

  private getStatusColor(status: string): string {
    if (status === 'done') return Theme.SUCCESS;
    if (status === 'error') return Theme.ERROR;
    return Theme.WARNING;
  }

  private getStatusText(status: string): string {
    if (status === 'done') return '已完成';
    if (status === 'error') return '出错了';
    return '进行中';
  }

  private getTypeIcon(type: string): string {
    if (type === '工具') return '工';
    if (type === '表单') return '表';
    if (type === '卡片') return '卡';
    if (type === '组件') return '组';
    if (type === '图表') return '图';
    if (type === '配置') return '配';
    return '件';
  }

  private openActionMenu(proj: ProjectItem): void {
    this.selectedProject = proj;
    this.showActionMenu = true;
  }

  private closeActionMenu(): void {
    this.showActionMenu = false;
  }

  private goToDetail(): void {
    this.showActionMenu = false;
    router.pushUrl({
      url: 'pages/ProjectDetail',
      params: {
        projectId: this.selectedProject.id,
        projectName: this.selectedProject.name,
        projectType: this.selectedProject.type,
        updateTime: this.selectedProject.updateTime
      }
    });
  }

  private openRename(): void {
    this.showActionMenu = false;
    this.renameValue = this.selectedProject.name;
    this.showRenameDialog = true;
  }

  private confirmRename(): void {
    if (this.renameValue.length > 0) {
      renameProject(this.selectedProject.id, this.renameValue);
      const saved: ProjectItem[] = getSavedProjects();
      this.projects = saved.length > 0 ? saved.concat(MOCK_PROJECTS) : MOCK_PROJECTS;
    }
    this.showRenameDialog = false;
    this.renameValue = '';
  }

  private openDelete(): void {
    this.showActionMenu = false;
    this.showDeleteConfirm = true;
  }

  private confirmDelete(): void {
    deleteProject(this.selectedProject.id);
    const saved: ProjectItem[] = getSavedProjects();
    this.projects = saved.length > 0 ? saved.concat(MOCK_PROJECTS) : MOCK_PROJECTS;
    this.showDeleteConfirm = false;
  }

  build() {
    Stack({ alignContent: Alignment.TopStart }) {
      Column({ space: 0 }) {
        // 顶部栏
        Row({ space: 12 }) {
          Button() {
            CraftIcon({ iconName: 'back', iconSize: 22, color: Theme.TEXT_PRIMARY })
          }
          .type(ButtonType.Circle)
          .width(40)
          .height(40)
          .backgroundColor(Theme.BG_INPUT)
          .onClick(() => router.back())

          Text('我的作品')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.TEXT_PRIMARY)
            .layoutWeight(1)

          Button() {
            Row({ space: 4 }) {
              CraftIcon({ iconName: 'add', iconSize: 16, color: Theme.TEXT_LIGHT })
              Text('新建')
                .fontSize(14)
                .fontColor(Theme.TEXT_LIGHT)
            }
          }
          .type(ButtonType.Capsule)
          .backgroundColor(Theme.PRIMARY)
          .height(40)
          .padding({ left: 14, right: 16 })
          .onClick(() => {
            router.pushUrl({ url: 'pages/ChatPage' });
          })
        }
        .width('100%')
        .height(56)
        .padding({ left: 16, right: 16 })
        .backgroundColor(Theme.BG_CARD)
        .border({ width: { bottom: 1 }, color: Theme.BORDER })

        // 搜索栏
        Row({ space: 8 }) {
          Row({ space: 8 }) {
            CraftIcon({ iconName: 'search', iconSize: 16, color: Theme.TEXT_TERTIARY })
            TextInput({ placeholder: '搜索作品...', text: $$this.searchText })
              .placeholderColor(Theme.TEXT_TERTIARY)
              .fontSize(14)
              .height(44)
              .backgroundColor('transparent')
              .layoutWeight(1)
          }
          .width('100%')
          .height(44)
          .backgroundColor(Theme.BG_INPUT)
          .borderRadius(12)
          .padding({ left: 12, right: 12 })
        }
        .width('100%')
        .height(56)
        .padding({ left: 16, right: 16 })

        // 区块标题
        Row() {
          Text('我的作品 (' + this.getFilteredProjects().length.toString() + ')')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .fontColor(Theme.TEXT_PRIMARY)
          Blank()
          CraftIcon({ iconName: 'settings', iconSize: 16, color: Theme.TEXT_TERTIARY })
        }
        .width('100%')
        .padding({ left: 16, right: 16, top: 8 })

        // 项目网格 — 2列
        if (this.getFilteredProjects().length === 0) {
          EmptyState({
            title: '暂无作品',
            subtitle: '还没有创建任何项目，点击新建开始创作吧',
            actionText: '新建项目'
          })
            .layoutWeight(1)
            .onClick(() => {
              router.pushUrl({ url: 'pages/ChatPage' });
            })
        } else {
          Scroll() {
            Grid() {
              ForEach(this.getFilteredProjects(), (proj: ProjectItem) => {
                GridItem() {
                  Column({ space: 0 }) {
                    // 预览区
                    Column() {
                      Text(this.getTypeIcon(proj.type))
                        .fontSize(24)
                        .fontColor(Theme.PRIMARY)
                        .fontWeight(FontWeight.Medium)
                    }
                    .width('100%')
                    .height(120)
                    .backgroundColor(Theme.BG_INPUT)
                    .borderRadius({ topLeft: Theme.RADIUS_XL, topRight: Theme.RADIUS_XL })
                    .justifyContent(FlexAlign.Center)

                    // 信息区
                    Column({ space: 6 }) {
                      Text(proj.name)
                        .fontSize(15)
                        .fontWeight(FontWeight.Medium)
                        .fontColor(Theme.TEXT_PRIMARY)
                        .maxLines(1)
                        .textOverflow({ overflow: TextOverflow.Ellipsis })
                        .width('100%')

                      Text(proj.updateTime)
                        .fontSize(12)
                        .fontColor(Theme.TEXT_TERTIARY)

                      Row() {
                        Text(this.getStatusText(proj.status))
                          .fontSize(11)
                          .fontColor(this.getStatusColor(proj.status))
                        Blank()
                        Button() {
                          CraftIcon({ iconName: 'more', iconSize: 16, color: Theme.TEXT_TERTIARY })
                        }
                        .type(ButtonType.Circle)
                        .width(28)
                        .height(28)
                        .backgroundColor('transparent')
                        .onClick(() => this.openActionMenu(proj))
                      }
                      .width('100%')
                    }
                    .width('100%')
                    .padding(12)
                  }
                  .width('100%')
                  .height(220)
                  .backgroundColor(Theme.BG_CARD)
                  .borderRadius(Theme.RADIUS_XL)
                  .border({ width: 1, color: Theme.BORDER })
                  .shadow({ radius: 4, color: Theme.SHADOW_SM, offsetY: 1 })
                  .onClick(() => {
                    router.pushUrl({
                      url: 'pages/ProjectDetail',
                      params: {
                        projectId: proj.id,
                        projectName: proj.name,
                        projectType: proj.type,
                        updateTime: proj.updateTime
                      }
                    });
                  })
                }
              })
            }
            .columnsTemplate('1fr 1fr')
            .columnsGap(12)
            .rowsGap(12)
            .padding(16)
          }
          .layoutWeight(1)
          .scrollBar(BarState.Auto)
        }

        // 底部导航栏
        BottomNav({ activeTab: 2 })
      }
      .width('100%')
      .height('100%')
      .backgroundColor(Theme.BG_MAIN)

      // 操作菜单弹窗
      if (this.showActionMenu) {
        Column() {
          Column({ space: 0 }) {
            this.ActionMenuItem('查看详情', Theme.TEXT_PRIMARY, () => this.goToDetail())
            this.ActionMenuItem('重命名', Theme.TEXT_PRIMARY, () => this.openRename())
            this.ActionMenuItem('删除', Theme.ERROR, () => this.openDelete())
          }
          .width(180)
          .backgroundColor(Theme.BG_CARD)
          .borderRadius(Theme.RADIUS_MD)
          .shadow({ radius: 12, color: Theme.SHADOW_LG, offsetY: 4 })
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .backgroundColor('rgba(45,36,32,0.3)')
        .zIndex(100)
        .onClick(() => this.closeActionMenu())
      }

      // 重命名弹窗
      if (this.showRenameDialog) {
        Column() {
          Column({ space: 16 }) {
            Text('重命名项目')
              .fontSize(17)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.TEXT_PRIMARY)

            TextInput({ text: $$this.renameValue })
              .height(44)
              .backgroundColor(Theme.BG_INPUT)
              .borderRadius(Theme.RADIUS_MD)
              .fontSize(14)

            Row({ space: 12 }) {
              Button('取消')
                .fontSize(14)
                .fontColor(Theme.TEXT_SECONDARY)
                .backgroundColor(Theme.BG_INPUT)
                .borderRadius(Theme.RADIUS_MD)
                .layoutWeight(1)
                .height(40)
                .onClick(() => { this.showRenameDialog = false; })

              Button('确认')
                .fontSize(14)
                .fontColor(Theme.TEXT_LIGHT)
                .backgroundColor(Theme.PRIMARY)
                .borderRadius(Theme.RADIUS_MD)
                .layoutWeight(1)
                .height(40)
                .onClick(() => this.confirmRename())
            }
            .width('100%')
          }
          .width('80%')
          .padding(20)
          .backgroundColor(Theme.BG_CARD)
          .borderRadius(Theme.RADIUS_LG)
          .shadow({ radius: 16, color: Theme.SHADOW_LG, offsetY: 4 })
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .backgroundColor('rgba(45,36,32,0.4)')
        .zIndex(100)
      }

      // 删除确认弹窗
      if (this.showDeleteConfirm) {
        Column() {
          Column({ space: 16 }) {
            Text('确认删除？')
              .fontSize(17)
              .fontWeight(FontWeight.Bold)
              .fontColor(Theme.TEXT_PRIMARY)

            Text('删除后不可恢复')
              .fontSize(14)
              .fontColor(Theme.TEXT_SECONDARY)

            Row({ space: 12 }) {
              Button('取消')
                .fontSize(14)
                .fontColor(Theme.TEXT_SECONDARY)
                .backgroundColor(Theme.BG_INPUT)
                .borderRadius(Theme.RADIUS_MD)
                .layoutWeight(1)
                .height(40)
                .onClick(() => { this.showDeleteConfirm = false; })

              Button('删除')
                .fontSize(14)
                .fontColor(Theme.TEXT_LIGHT)
                .backgroundColor(Theme.ERROR)
                .borderRadius(Theme.RADIUS_MD)
                .layoutWeight(1)
                .height(40)
                .onClick(() => this.confirmDelete())
            }
            .width('100%')
          }
          .width('80%')
          .padding(20)
          .backgroundColor(Theme.BG_CARD)
          .borderRadius(Theme.RADIUS_LG)
          .shadow({ radius: 16, color: Theme.SHADOW_LG, offsetY: 4 })
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .backgroundColor('rgba(45,36,32,0.4)')
        .zIndex(100)
      }
    }
    .width('100%')
    .height('100%')
    .opacity(this.pageOpacity)
    .animation({ duration: 250, curve: Curve.EaseOut })
  }

  @Builder
  ActionMenuItem(label: string, color: string, action: () => void): void {
    Text(label)
      .fontSize(15)
      .fontColor(color)
      .width('100%')
      .textAlign(TextAlign.Center)
      .padding({ top: 14, bottom: 14 })
      .border({ width: { bottom: 1 }, color: Theme.BORDER })
      .onClick(() => action())
  }
}
