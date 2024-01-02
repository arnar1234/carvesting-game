hsp = lerp(hsp, 0, 0.05);
vsp = lerp(vsp, 0, 0.05);
tileCollisionBounce();

if(hsp == 0 and vsp == 0) instance_destroy();
if(speed_ > stops) speed_ = sqrt(hsp*hsp + vsp*vsp);