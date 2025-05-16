//The debris of breakable tile

// 随机方向 & 速度
if (!variable_instance_exists(id, "direction")) direction = irandom(359);
if (!variable_instance_exists(id, "speed"))     speed     = 2 + random(1);

// 让碎片旋转一点点
angular_speed = choose(-6, -3, 3, 6);

// 寿命
life = 20;

image_alpha = 1;
