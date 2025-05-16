// 随机方向 & 速度，如 Destroy 时已传值就保留
if (!variable_instance_exists(id, "direction")) direction = irandom(359);
if (!variable_instance_exists(id, "speed"))     speed     = 2 + random(1);

// 让碎片旋转一点点
angular_speed = choose(-6, -3, 3, 6);

// 寿命（帧数）
life = 20;

// 初始透明度
image_alpha = 1;
