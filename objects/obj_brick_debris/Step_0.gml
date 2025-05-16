// 位移
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// 减速 & 旋转
speed *= 0.9;
image_angle += angular_speed;

// 淡出
life--;
image_alpha = life / 20;

if (life <= 0) instance_destroy();
