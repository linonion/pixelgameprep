# pixelgameprep

# Game Name:《逃离社交压力》(eye escape?)

## Game Type

* **视角**：2D Top-down
* **游戏模式**：弹幕式躲避类游戏

## Possible Structure

```plaintext
Assets/
│
├── Scripts/
│   ├── Player/
│   │   └── PlayerController.cs (玩家移动、碰撞)
│   ├── Enemies/
│   │   ├── EnemySpawner.cs (目光敌人生成)
│   │   └── EnemyMovement.cs (敌人移动逻辑)
│   ├── Mechanics/ (Optional）
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

## 🚩 Core Development

### 🔹 Phase 1（Basic mechanics）

1. **玩家移动控制**（PlayerController）
2. **敌人生成和移动逻辑**（EnemySpawner、EnemyMovement）
3. **基础碰撞检测**

### 🔸 Phase 2（Optional）

4. **社交能量条**（SocialBattery）
5. **格挡与反击系统**（CourageSystem）
6. **道具**（?）

### 🔹 Phase 3（Main Menu）

7. **用户界面（UI）设计**
8. **游戏流程和关卡设计**（GameManager）
9. **音效与音乐整合**（AudioManager）

---

## 📅 时间规划


## 免费音乐与音效资源

* **音乐**：

  * [Incompetech](https://incompetech.com/music/)
  * [OpenGameArt](https://opengameart.org/art-search-advanced?field_art_type_tid[]=12)

* **音效**：

  * [Freesound](https://freesound.org/)
  * [Kenney音效](https://kenney.nl/assets?q=audio)

---


## 主要目标

* 保持游戏难度逐步提升，给予玩家明确的反馈和成就感。
* 可以在jam开始之前做简单的demo，美术同样可以先做简单的demo 
* 聚焦基础玩法 + 整体风格统一
* 完成后导出WebGL版便于展示

---
