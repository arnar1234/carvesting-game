//toggle disapearing
alarm[0] = 8;

disapearCount += 1;
if(!disapearing) disapearing = true;
else disapearing = false;

if(disapearCount > 11) instance_destroy();