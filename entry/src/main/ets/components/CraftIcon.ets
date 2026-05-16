import { Theme } from '../utils/Theme';

@Component
export struct CraftIcon {
  @Prop iconName: string;
  @Prop iconSize: number = 24;
  @Prop color: string = Theme.TEXT_TERTIARY;
  @Prop strokeWidth: number = 1.75;

  build() {
    if (this.iconName === 'home') {
      this.HomeIcon()
    } else if (this.iconName === 'templates') {
      this.TemplatesIcon()
    } else if (this.iconName === 'projects') {
      this.ProjectsIcon()
    } else if (this.iconName === 'profile') {
      this.ProfileIcon()
    } else if (this.iconName === 'send') {
      this.SendIcon()
    } else if (this.iconName === 'mic') {
      this.MicIcon()
    } else if (this.iconName === 'search') {
      this.SearchIcon()
    } else if (this.iconName === 'back') {
      this.BackIcon()
    } else if (this.iconName === 'close') {
      this.CloseIcon()
    } else if (this.iconName === 'add') {
      this.AddIcon()
    } else if (this.iconName === 'check') {
      this.CheckIcon()
    } else if (this.iconName === 'more') {
      this.MoreIcon()
    } else if (this.iconName === 'login') {
      this.LoginIcon()
    } else if (this.iconName === 'todo') {
      this.TodoIcon()
    } else if (this.iconName === 'counter') {
      this.CounterIcon()
    } else if (this.iconName === 'news') {
      this.NewsIcon()
    } else if (this.iconName === 'settings') {
      this.SettingsIcon()
    } else if (this.iconName === 'datalist') {
      this.DatalistIcon()
    } else if (this.iconName === 'copy') {
      this.CopyIcon()
    } else if (this.iconName === 'download') {
      this.DownloadIcon()
    } else if (this.iconName === 'phone') {
      this.PhoneIcon()
    } else if (this.iconName === 'tablet') {
      this.TabletIcon()
    } else if (this.iconName === 'pc') {
      this.PcIcon()
    } else if (this.iconName === 'tag') {
      this.TagIcon()
    } else if (this.iconName === 'popular') {
      this.PopularIcon()
    } else {
      // 默认占位
      this.PlaceholderIcon()
    }
  }

  // ========== 底部导航 4 个核心图标 ==========

  @Builder
  HomeIcon() {
    Shape() {
      Path()
        .commands('M3 12 L12 3 L21 12')
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .strokeLineCap(LineCapStyle.Round)
        .strokeLineJoin(LineJoinStyle.Round)
        .fill(Color.Transparent)
      Path()
        .commands('M5 12 V21 H19 V12')
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .strokeLineCap(LineCapStyle.Round)
        .strokeLineJoin(LineJoinStyle.Round)
        .fill(Color.Transparent)
    }
    .viewPort({ width: 24, height: 24 })
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  TemplatesIcon() {
    Shape() {
      Path()
        .commands('M3 3 H10 V10 H3 Z')
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .strokeLineCap(LineCapStyle.Round)
        .strokeLineJoin(LineJoinStyle.Round)
        .fill(Color.Transparent)
      Path()
        .commands('M14 3 H21 V10 H14 Z')
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .strokeLineCap(LineCapStyle.Round)
        .strokeLineJoin(LineJoinStyle.Round)
        .fill(Color.Transparent)
      Path()
        .commands('M3 14 H10 V21 H3 Z')
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .strokeLineCap(LineCapStyle.Round)
        .strokeLineJoin(LineJoinStyle.Round)
        .fill(Color.Transparent)
      Path()
        .commands('M14 14 H21 V21 H14 Z')
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .strokeLineCap(LineCapStyle.Round)
        .strokeLineJoin(LineJoinStyle.Round)
        .fill(Color.Transparent)
    }
    .viewPort({ width: 24, height: 24 })
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  ProjectsIcon() {
    Shape() {
      Path()
        .commands('M3 7 H9 L11 5 H21 V20 H3 Z')
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .strokeLineCap(LineCapStyle.Round)
        .strokeLineJoin(LineJoinStyle.Round)
        .fill(Color.Transparent)
    }
    .viewPort({ width: 24, height: 24 })
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  ProfileIcon() {
    Shape() {
      Circle()
        .width(8)
        .height(8)
        .offset({ x: 8, y: 4 })
        .fill(Color.Transparent)
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
      Path()
        .commands('M6 20 C6 17 9 15 12 15 C15 15 18 17 18 20')
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .strokeLineCap(LineCapStyle.Round)
        .strokeLineJoin(LineJoinStyle.Round)
        .fill(Color.Transparent)
    }
    .viewPort({ width: 24, height: 24 })
    .width(this.iconSize)
    .height(this.iconSize)
  }

  // ========== 常用操作图标 ==========

  @Builder
  SendIcon() {
    Shape() {
      Path()
        .commands('M5 12 H19 M13 7 L19 12 L13 17')
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .strokeLineCap(LineCapStyle.Round)
        .strokeLineJoin(LineJoinStyle.Round)
        .fill(Color.Transparent)
    }
    .viewPort({ width: 24, height: 24 })
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  MicIcon() {
    Shape() {
      Rect()
        .width(6)
        .height(10)
        .offset({ x: 9, y: 2 })
        .fill(Color.Transparent)
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .radius(3)
      Path()
        .commands('M7 13 C7 18 17 18 17 13')
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .strokeLineCap(LineCapStyle.Round)
        .fill(Color.Transparent)
      Path()
        .commands('M12 18 V22')
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .strokeLineCap(LineCapStyle.Round)
        .fill(Color.Transparent)
    }
    .viewPort({ width: 24, height: 24 })
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  SearchIcon() {
    Shape() {
      Circle()
        .width(10)
        .height(10)
        .offset({ x: 4, y: 4 })
        .fill(Color.Transparent)
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
      Path()
        .commands('M16 16 L21 21')
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .strokeLineCap(LineCapStyle.Round)
        .fill(Color.Transparent)
    }
    .viewPort({ width: 24, height: 24 })
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  BackIcon() {
    Shape() {
      Path()
        .commands('M15 5 L8 12 L15 19')
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .strokeLineCap(LineCapStyle.Round)
        .strokeLineJoin(LineJoinStyle.Round)
        .fill(Color.Transparent)
    }
    .viewPort({ width: 24, height: 24 })
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  CloseIcon() {
    Shape() {
      Path()
        .commands('M6 6 L18 18')
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .strokeLineCap(LineCapStyle.Round)
        .fill(Color.Transparent)
      Path()
        .commands('M18 6 L6 18')
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .strokeLineCap(LineCapStyle.Round)
        .fill(Color.Transparent)
    }
    .viewPort({ width: 24, height: 24 })
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  AddIcon() {
    Shape() {
      Path()
        .commands('M12 5 V19 M5 12 H19')
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .strokeLineCap(LineCapStyle.Round)
        .fill(Color.Transparent)
    }
    .viewPort({ width: 24, height: 24 })
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  CheckIcon() {
    Shape() {
      Path()
        .commands('M5 12 L10 17 L19 7')
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .strokeLineCap(LineCapStyle.Round)
        .strokeLineJoin(LineJoinStyle.Round)
        .fill(Color.Transparent)
    }
    .viewPort({ width: 24, height: 24 })
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  MoreIcon() {
    Shape() {
      Circle()
        .width(2)
        .height(2)
        .offset({ x: 11, y: 6 })
        .fill(this.color)
      Circle()
        .width(2)
        .height(2)
        .offset({ x: 11, y: 11 })
        .fill(this.color)
      Circle()
        .width(2)
        .height(2)
        .offset({ x: 11, y: 16 })
        .fill(this.color)
    }
    .viewPort({ width: 24, height: 24 })
    .width(this.iconSize)
    .height(this.iconSize)
  }

  // ========== 首页快捷模板 6 个图标 ==========

  @Builder
  LoginIcon() {
    Shape() {
      Circle()
        .width(8)
        .height(8)
        .offset({ x: 8, y: 3 })
        .fill(Color.Transparent)
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
      Path()
        .commands('M6 20 C6 17 9 15 12 15 C15 15 18 17 18 20')
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .strokeLineCap(LineCapStyle.Round)
        .strokeLineJoin(LineJoinStyle.Round)
        .fill(Color.Transparent)
    }
    .viewPort({ width: 24, height: 24 })
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  TodoIcon() {
    Shape() {
      Path()
        .commands('M4 5 H20 V19 H4 Z')
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .strokeLineCap(LineCapStyle.Round)
        .strokeLineJoin(LineJoinStyle.Round)
        .fill(Color.Transparent)
      Path()
        .commands('M9 12 L12 15 L17 9')
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .strokeLineCap(LineCapStyle.Round)
        .strokeLineJoin(LineJoinStyle.Round)
        .fill(Color.Transparent)
    }
    .viewPort({ width: 24, height: 24 })
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  CounterIcon() {
    Shape() {
      Circle()
        .width(14)
        .height(14)
        .offset({ x: 5, y: 5 })
        .fill(Color.Transparent)
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
      Path()
        .commands('M12 8 V16 M8 12 H16')
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .strokeLineCap(LineCapStyle.Round)
        .fill(Color.Transparent)
    }
    .viewPort({ width: 24, height: 24 })
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  NewsIcon() {
    Shape() {
      Path()
        .commands('M5 4 H19 V20 H5 Z')
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .strokeLineCap(LineCapStyle.Round)
        .strokeLineJoin(LineJoinStyle.Round)
        .fill(Color.Transparent)
      Path()
        .commands('M8 9 H16')
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .strokeLineCap(LineCapStyle.Round)
        .fill(Color.Transparent)
      Path()
        .commands('M8 13 H16')
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .strokeLineCap(LineCapStyle.Round)
        .fill(Color.Transparent)
      Path()
        .commands('M8 17 H13')
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .strokeLineCap(LineCapStyle.Round)
        .fill(Color.Transparent)
    }
    .viewPort({ width: 24, height: 24 })
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  SettingsIcon() {
    Shape() {
      Path()
        .commands('M4 8 H20')
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .strokeLineCap(LineCapStyle.Round)
        .fill(Color.Transparent)
      Path()
        .commands('M4 12 H20')
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .strokeLineCap(LineCapStyle.Round)
        .fill(Color.Transparent)
      Path()
        .commands('M4 16 H20')
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .strokeLineCap(LineCapStyle.Round)
        .fill(Color.Transparent)
    }
    .viewPort({ width: 24, height: 24 })
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  DatalistIcon() {
    Shape() {
      Path()
        .commands('M5 5 H9 V9 H5 Z')
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .strokeLineCap(LineCapStyle.Round)
        .strokeLineJoin(LineJoinStyle.Round)
        .fill(Color.Transparent)
      Path()
        .commands('M11 5 H15 V9 H11 Z')
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .strokeLineCap(LineCapStyle.Round)
        .strokeLineJoin(LineJoinStyle.Round)
        .fill(Color.Transparent)
      Path()
        .commands('M17 5 H21 V9 H17 Z')
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .strokeLineCap(LineCapStyle.Round)
        .strokeLineJoin(LineJoinStyle.Round)
        .fill(Color.Transparent)
      Path()
        .commands('M5 13 H21')
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .strokeLineCap(LineCapStyle.Round)
        .fill(Color.Transparent)
      Path()
        .commands('M5 17 H21')
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .strokeLineCap(LineCapStyle.Round)
        .fill(Color.Transparent)
    }
    .viewPort({ width: 24, height: 24 })
    .width(this.iconSize)
    .height(this.iconSize)
  }

  // ========== 其他页面图标 ==========

  @Builder
  CopyIcon() {
    Shape() {
      Path()
        .commands('M6 4 H16 V14 H6 Z')
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .strokeLineCap(LineCapStyle.Round)
        .strokeLineJoin(LineJoinStyle.Round)
        .fill(Color.Transparent)
      Path()
        .commands('M10 8 H20 V18 H10 Z')
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .strokeLineCap(LineCapStyle.Round)
        .strokeLineJoin(LineJoinStyle.Round)
        .fill(Color.Transparent)
    }
    .viewPort({ width: 24, height: 24 })
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  DownloadIcon() {
    Shape() {
      Path()
        .commands('M12 4 V16')
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .strokeLineCap(LineCapStyle.Round)
        .fill(Color.Transparent)
      Path()
        .commands('M8 13 L12 17 L16 13')
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .strokeLineCap(LineCapStyle.Round)
        .strokeLineJoin(LineJoinStyle.Round)
        .fill(Color.Transparent)
      Path()
        .commands('M6 19 H18')
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .strokeLineCap(LineCapStyle.Round)
        .fill(Color.Transparent)
    }
    .viewPort({ width: 24, height: 24 })
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  PhoneIcon() {
    Shape() {
      Rect()
        .width(12)
        .height(20)
        .offset({ x: 6, y: 2 })
        .fill(Color.Transparent)
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .radius(2)
    }
    .viewPort({ width: 24, height: 24 })
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  TabletIcon() {
    Shape() {
      Rect()
        .width(18)
        .height(14)
        .offset({ x: 3, y: 5 })
        .fill(Color.Transparent)
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .radius(2)
    }
    .viewPort({ width: 24, height: 24 })
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  PcIcon() {
    Shape() {
      Rect()
        .width(20)
        .height(14)
        .offset({ x: 2, y: 3 })
        .fill(Color.Transparent)
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .radius(2)
      Path()
        .commands('M9 17 H15 V20 H9 Z')
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .strokeLineCap(LineCapStyle.Round)
        .strokeLineJoin(LineJoinStyle.Round)
        .fill(Color.Transparent)
    }
    .viewPort({ width: 24, height: 24 })
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  TagIcon() {
    Shape() {
      Path()
        .commands('M4 5 H14 L20 11 L14 17 H4 Z')
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .strokeLineCap(LineCapStyle.Round)
        .strokeLineJoin(LineJoinStyle.Round)
        .fill(Color.Transparent)
      Circle()
        .width(2)
        .height(2)
        .offset({ x: 7, y: 10 })
        .fill(this.color)
    }
    .viewPort({ width: 24, height: 24 })
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  PopularIcon() {
    Shape() {
      Path()
        .commands('M12 3 L14 9 H20 L15 13 L17 19 L12 15 L7 19 L9 13 L4 9 H10 Z')
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
        .strokeLineCap(LineCapStyle.Round)
        .strokeLineJoin(LineJoinStyle.Round)
        .fill(Color.Transparent)
    }
    .viewPort({ width: 24, height: 24 })
    .width(this.iconSize)
    .height(this.iconSize)
  }

  @Builder
  PlaceholderIcon() {
    Shape() {
      Circle()
        .width(16)
        .height(16)
        .offset({ x: 4, y: 4 })
        .fill(Color.Transparent)
        .stroke(this.color)
        .strokeWidth(this.strokeWidth)
    }
    .viewPort({ width: 24, height: 24 })
    .width(this.iconSize)
    .height(this.iconSize)
  }
}
