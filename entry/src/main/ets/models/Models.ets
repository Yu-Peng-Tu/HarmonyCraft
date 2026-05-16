/**
 * HarmonyCraft 数据模型
 */

export interface ChatMessage {
  role: string;
  content: string;
  timestamp: number;
  isCode: boolean;
}

export interface ProjectItem {
  id: string;
  name: string;
  type: string;
  updateTime: string;
  status: string;
}

export interface TemplateItem {
  id: string;
  name: string;
  desc: string;
  category: string;
  useCount: number;
  prompt: string;
}

export interface WidgetComponent {
  compType: string;
  posX: number;
  posY: number;
  width: number;
  height: number;
  text: string;
}

export interface GeneratedCode {
  fileName: string;
  code: string;
}

export function genId(): string {
  return 'hc_' + Date.now().toString(36);
}

export function fmtTime(ts: number): string {
  const d: Date = new Date(ts);
  const h: number = d.getHours();
  const m: number = d.getMinutes();
  const hs: string = h < 10 ? '0' + h.toString() : h.toString();
  const ms: string = m < 10 ? '0' + m.toString() : m.toString();
  return hs + ':' + ms;
}

export interface ChatPageParams {
  prompt?: string;
}

export interface CodePreviewParams {
  code?: string;
}

export interface ProjectVersion {
  versionId: string;
  projectId: string;
  code: string;
  timestamp: number;
  note: string;
}

export function saveProjectToStorage(name: string, type: string, code?: string): void {
  const stored: string | undefined = AppStorage.get('saved_projects');
  let list: ProjectItem[] = [];
  if (stored && stored.length > 0) {
    try {
      const parsed: object = JSON.parse(stored);
      if (parsed instanceof Array) {
        list = parsed as ProjectItem[];
      }
    } catch (e) {
      list = [];
    }
  }
  const projectId: string = 'p' + Date.now().toString();
  list.push({
    id: projectId,
    name: name,
    type: type,
    updateTime: '刚刚',
    status: 'done'
  });
  AppStorage.setOrCreate('saved_projects', JSON.stringify(list));

  // 同时记录版本历史
  if (code && code.length > 0) {
    saveProjectVersion(projectId, code, '初始版本');
  }
}

export function saveProjectVersion(projectId: string, code: string, note: string): void {
  const stored: string | undefined = AppStorage.get('project_versions');
  let versions: ProjectVersion[] = [];
  if (stored && stored.length > 0) {
    try {
      const parsed: object = JSON.parse(stored);
      if (parsed instanceof Array) {
        versions = parsed as ProjectVersion[];
      }
    } catch (e) {
      versions = [];
    }
  }
  versions.push({
    versionId: 'v' + Date.now().toString(),
    projectId: projectId,
    code: code,
    timestamp: Date.now(),
    note: note
  });
  AppStorage.setOrCreate('project_versions', JSON.stringify(versions));
}

export function getProjectVersions(projectId: string): ProjectVersion[] {
  const stored: string | undefined = AppStorage.get('project_versions');
  if (stored && stored.length > 0) {
    try {
      const parsed: object = JSON.parse(stored);
      if (parsed instanceof Array) {
        const allVersions: ProjectVersion[] = parsed as ProjectVersion[];
        return allVersions.filter((v: ProjectVersion) => v.projectId === projectId).reverse();
      }
    } catch (e) {
      // ignore
    }
  }
  return [];
}

export function getSavedProjects(): ProjectItem[] {
  const stored: string | undefined = AppStorage.get('saved_projects');
  if (stored && stored.length > 0) {
    try {
      const parsed: object = JSON.parse(stored);
      if (parsed instanceof Array) {
        return parsed as ProjectItem[];
      }
    } catch (e) {
      // ignore
    }
  }
  return [];
}

export function deleteProject(projectId: string): void {
  const stored: string | undefined = AppStorage.get('saved_projects');
  if (stored && stored.length > 0) {
    try {
      const parsed: object = JSON.parse(stored);
      if (parsed instanceof Array) {
        const list: ProjectItem[] = (parsed as ProjectItem[]).filter((p: ProjectItem) => p.id !== projectId);
        AppStorage.setOrCreate('saved_projects', JSON.stringify(list));
      }
    } catch (e) {
      // ignore
    }
  }
}

export function renameProject(projectId: string, newName: string): void {
  const stored: string | undefined = AppStorage.get('saved_projects');
  if (stored && stored.length > 0) {
    try {
      const parsed: object = JSON.parse(stored);
      if (parsed instanceof Array) {
        const list: ProjectItem[] = parsed as ProjectItem[];
        for (let i: number = 0; i < list.length; i++) {
          if (list[i].id === projectId) {
            list[i].name = newName;
            list[i].updateTime = '刚刚';
            break;
          }
        }
        AppStorage.setOrCreate('saved_projects', JSON.stringify(list));
      }
    } catch (e) {
      // ignore
    }
  }
}
