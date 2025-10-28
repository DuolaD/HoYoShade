# HoYoShade C++ 启动器

## 概述

这是一个用C++重构的HoYoShade启动器，完全替代了原有的批处理文件启动器（`Starter(zh-Hans).bat`、`Starter(zh-Hant).bat`、`Starter(English).bat`）。

## 主要特性

### ✅ 已实现的功能

1. **完整的UI和功能复制**
   - 保持与原批处理启动器完全一致的界面、提示和执行逻辑
   - 支持所有原有的游戏注入选项
   - 管理员权限检查和自动提升

2. **多语言支持系统**
   - 支持简体中文、繁体中文、英文三种语言
   - 语言文件存储在 `LauncherResource/Language/` 目录
   - 自动检测系统语言并提示用户选择
   - 语言设置保存功能

3. **文件完整性检查**
   - 检查所有必需文件是否存在
   - 如果文件缺失，显示详细的错误信息和解决方案

4. **ReShade.ini 管理**
   - 自动检测并创建 ReShade.ini 文件
   - 首次使用时显示详细的设置指导
   - 支持重置 ReShade.ini 功能

5. **游戏注入功能**
   - 支持原神（中国大陆/国际服）
   - 支持崩坏3
   - 支持崩坏：星穹铁道
   - 支持绝区零
   - 使用与原版相同的注入逻辑

## 文件结构

```
HoYoShade/
├── HoYoShadeLauncher.exe          # 新的C++启动器
├── HoYoShadeLauncher.cpp          # 源代码
├── build.bat                      # 编译脚本
├── LauncherResource/
│   ├── Language/
│   │   ├── zh-Hans.txt           # 简体中文语言包
│   │   ├── zh-Hant.txt           # 繁体中文语言包
│   │   ├── English.txt           # 英文语言包
│   │   └── settings.txt          # 语言设置文件（自动生成）
│   └── INIBuild.exe              # ReShade.ini 构建工具
├── inject.exe                     # 注入器
├── ReShade64.dll                  # ReShade 库
└── ... (其他原有文件)
```

## 使用方法

### 首次运行

1. **以管理员身份运行** `HoYoShadeLauncher.exe`
2. 如果没有语言设置，启动器会：
   - 自动检测系统语言
   - 提示选择首选语言（简体中文/繁体中文/英文）
   - 保存语言设置到 `LauncherResource/Language/settings.txt`

### 主要功能

1. **重置 ReShade.ini** - 删除并重新生成配置文件
2. **游戏注入** - 选择对应的游戏进行ReShade注入
3. **语言切换** - 在"更多选项"菜单中切换界面语言
4. **退出程序** - 安全退出启动器

### 语言切换

1. 在主菜单选择 "10. 更多选项"
2. 选择要切换的语言
3. 重启启动器以应用新语言设置

## 编译说明

如果需要重新编译启动器：

1. 确保安装了 Visual Studio 2022 或 Build Tools
2. 运行 `build.bat` 脚本
3. 编译成功后会生成 `HoYoShadeLauncher.exe`

### 编译要求

- Visual Studio 2022 或 Visual Studio Build Tools
- C++17 标准支持
- Windows SDK

### 依赖库

- `shell32.lib` - Shell API
- `advapi32.lib` - 高级API（用于权限检查）

## 技术实现

### 核心特性

1. **系统语言检测**
   ```cpp
   LANGID langId = GetSystemDefaultUILanguage();
   WORD primaryLang = PRIMARYLANGID(langId);
   ```

2. **管理员权限检查**
   ```cpp
   CheckTokenMembership(NULL, adminGroup, &isAdmin);
   ```

3. **文件系统操作**
   ```cpp
   std::filesystem::exists(fullPath)
   std::filesystem::create_directories(languageDir)
   ```

4. **语言文件解析**
   - 支持 `KEY=VALUE` 格式
   - 忽略注释行（以 `#` 开头）
   - 自动回退到英文语言包

### 与原版的兼容性

- 完全兼容原有的 `inject.exe` 和 `INIBuild.exe`
- 保持相同的文件结构和依赖关系
- 使用相同的注入参数和命令

## 故障排除

### 常见问题

1. **启动器无法运行**
   - 确保以管理员身份运行
   - 检查是否缺少必需文件

2. **语言显示异常**
   - 检查 `LauncherResource/Language/` 目录是否存在
   - 确认语言文件格式正确

3. **注入失败**
   - 确保游戏通过官方启动器启动
   - 不要直接双击游戏可执行文件

### 文件缺失处理

如果启动器检测到文件缺失，会显示详细的错误信息和解决方案：
- 重新下载完整的压缩包
- 检查杀毒软件是否误删文件
- 确认文件解压完整

## 开发信息

- **开发者**: DuolaDStudio X ZelbertYQ X Ex_M
- **版本**: V3.X.X Stable - A new beginning
- **基于**: 原版 HoYoShade 批处理启动器
- **编程语言**: C++17
- **编译器**: MSVC (Visual Studio 2022)

## 许可证

遵循原 HoYoShade 项目的许可证条款。

---

**注意**: 这个C++启动器完全替代了原有的批处理文件，提供了更好的用户体验和更强的功能扩展性。