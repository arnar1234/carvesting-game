//Calculating Movement
x = oPlayer.x+lengthdir_x(back, image_angle);
y = oPlayer.y+3+lengthdir_y(back, image_angle);

back = max(0,abs(back)-0.8)*sign(back);
guiY = max(0,abs(guiY)-0.8)*sign(guiY);