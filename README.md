# pixelgameprep

# 《逃离社交压力》游戏开发计划

## 🎮 游戏类型

* **视角**：2D Top-down（垂直视角）
* **游戏模式**：躲避类游戏（弹幕式）

## 📂 项目结构

```plaintext
Assets/
│
├── Scripts/
│   ├── Player/
│   │   └── PlayerController.cs (玩家移动、碰撞)
│   ├── Enemies/
│   │   ├── EnemySpawner.cs (目光敌人生成)
│   │   └── EnemyMovement.cs (敌人移动逻辑)
│   ├── Mechanics/
│   │   ├── CourageSystem.cs (勇气格挡系统)
│   │   └── SocialBattery.cs (能量条控制)
│   ├── UI/
│   │   ├── UIManager.cs (界面控制)
│   │   └── HUDController.cs (实时界面更新)
│   └── Managers/
│       ├── GameManager.cs (整体流程管理)
│       └── AudioManager.cs (音效管理)
│
├── Art/
│   ├── Player/
│   ├── Enemies/
│   ├── Backgrounds/
│   └── UI/
│
├── Audio/
│   ├── Music/
│   └── SFX/
│
└── Scenes/
    ├── MainMenu.unity
    └── Gameplay.unity
```

---

## 🚩 核心机制开发顺序

### 🔹 Phase 1（基础玩法）

1. **玩家移动控制**（PlayerController）
2. **敌人生成和移动逻辑**（EnemySpawner、EnemyMovement）
3. **基础碰撞检测**（玩家与敌人）

### 🔸 Phase 2（特色机制）

4. **社交能量条**（SocialBattery）
5. **格挡与反击系统**（CourageSystem）
6. **道具系统**（可选，如耳机、手机）

### 🔹 Phase 3（界面与整合）

7. **用户界面（UI）设计**（主菜单、游戏HUD）
8. **游戏流程和关卡设计**（GameManager）
9. **音效与音乐整合**（AudioManager）

---

## 📅 时间规划

| 时间  | 任务                  |
| --- | ------------------- |
| 第一天 | 基础玩法：玩家移动、敌人生成、碰撞检测 |
| 第二天 | 特色玩法：电池系统、格挡机制、道具系统 |
| 第三天 | 整合与优化：界面、音效、测试、发布打包 |

---

## 🎵 免费音乐与音效资源

* **音乐**：

  * [Incompetech](https://incompetech.com/music/)
  * [Free Music Archive](https://freemusicarchive.org/)
  * [OpenGameArt](https://opengameart.org/art-search-advanced?field_art_type_tid[]=12)

* **音效**：

  * [Freesound](https://freesound.org/)
  * [Kenney音效](https://kenney.nl/assets?q=audio)

---

## 🤝 合作技巧（首次合作）

* 使用GitHub或Unity Version Control明确协作。
* 每日明确具体任务，保持高效沟通。
* 优先完成核心机制，循序渐进。

---

## 💡 额外建议

* 保持游戏难度逐步提升，给予玩家明确的反馈和成就感。
* 初次Game Jam切忌过度追求复杂性，聚焦基础玩法。
* 完成后，导出WebGL版便于展示。

---

🚀 **期待你的创意作品，加油！** 🌟
