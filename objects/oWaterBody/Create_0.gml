/// @description Insert description here

// WARNING the right side gets fucked, so hide it

image_alpha = 0.5;
transBufferHeight = 32;
springSec2Calc = 5; // # seconds to calculate spring stuff
springCount = ceil(sprite_width / WATERDIVISION);
springs[springCount]			= 0;
springsVelocity[springCount]	= 0;
springDeltaL[springCount]		= 0;
springDeltaR[springCount]		= 0;

k		= 0.035;	// 0.035
d		= 0.0025;	// 0.025
spread	= 0.25;		// 0.25

waterSurface	= -1;
springSurface	= -1;
